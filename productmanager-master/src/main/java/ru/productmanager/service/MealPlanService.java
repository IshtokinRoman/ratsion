package ru.productmanager.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.productmanager.dto.ManualMealPlanCreateDto;
import ru.productmanager.dto.MealPlanSummary;
import ru.productmanager.dto.MealReplaceAlternativesResponse;
import ru.productmanager.exception.NotFoundException;
import ru.productmanager.model.*;
import ru.productmanager.repo.DishRepository;
import ru.productmanager.repo.ExcludedCategoryRepository;
import ru.productmanager.repo.ExcludedProductRepository;
import ru.productmanager.repo.FavoriteDishRepository;
import ru.productmanager.repo.MealLogRepository;
import ru.productmanager.repo.MealPlanRepository;
import ru.productmanager.repo.MealTypeByDishRepository;
import ru.productmanager.repo.ProductBasketRepository;
import ru.productmanager.repo.ProductRepository;
import ru.productmanager.repo.UserProfileRepository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MealPlanService {
    private static final int REPEAT_WINDOW_DAYS = 3;

    // при подборе блюда сначала ищем «удобную» порцию около 1×;
    // итоговую порцию считаем ровно под цель калорий (без жёсткого потолка 2×)
    private static final double MIN_PORTION = 0.5;
    private static final double MAX_PORTION = 2.0;
    private static final double PREFERRED_MIN_PORTION = 0.75;
    private static final double PREFERRED_MAX_PORTION = 1.5;
    // в семье нормы различаются сильнее — для фильтра кандидатов шире
    private static final double FAMILY_MIN_PORTION = 0.3;
    private static final double FAMILY_MAX_PORTION = 3.0;
    // защита от нуля/аномалий; верх не режет норму калорий
    private static final double APPLY_MIN_PORTION = 0.25;
    private static final int CLOSEST_LIMIT = 3;
    private static final int REPLACE_ALTERNATIVES_LIMIT = 60;

    private static final DateTimeFormatter PLAN_NAME_DATE =
            DateTimeFormatter.ofPattern("d MMM", Locale.forLanguageTag("ru"));

    private final MealTypeByDishRepository mealTypeByDishRepository;
    private final MealPlanRepository repository;
    private final MealLogRepository mealLogRepository;
    private final ProductBasketRepository productBasketRepository;
    private final UserProfileRepository userProfileRepository;
    private final FavoriteDishRepository favoriteDishRepository;
    private final ExcludedProductRepository excludedProductRepository;
    private final ExcludedCategoryRepository excludedCategoryRepository;
    private final ProductRepository productRepository;
    private final DishRepository dishRepository;
    private final BmrCalculator calculator;

    @Transactional(readOnly = true)
    public MealPlan getPlan(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Meal plan with id:" + id + ", not found!"));
    }

    @Transactional
    public void delete(Long id) {
        MealPlan plan = getPlan(id); // единообразно: 404, если плана нет
        mealLogRepository.deleteByMealPlanId(id); // отметки «Сегодня» (съел/пропуск)
        productBasketRepository.findByMealPlanId(id).ifPresent(productBasketRepository::delete);
        repository.delete(plan);
    }

    /** Удаляет все планы владельца (корзины и логи «Сегодня» уйдут вместе с ними). */
    @Transactional
    public int deleteAllByOwner(Long ownerId) {
        mealLogRepository.deleteByOwnerId(ownerId);
        for (MealPlan plan : repository.findByOwnerIdOrderByIdDesc(ownerId)) {
            productBasketRepository.findByMealPlanId(plan.getId()).ifPresent(productBasketRepository::delete);
        }
        return (int) repository.deleteByOwnerId(ownerId);
    }

    /**
     * Ручной план: пользователь задаёт блюда по дням и приёмам, порции считаем под норму калорий.
     */
    @Transactional
    public MealPlan createManualMealPlan(UserProfile requester, ManualMealPlanCreateDto dto) {
        if (dto.days() < 1) {
            throw new IllegalArgumentException("days must be >= 1");
        }
        UserProfile owner = userProfileRepository.findById(requester.getId())
                .orElseThrow(() -> new NotFoundException("User Profile with id:" + requester.getId() + ", not found!"));

        Family family = null;
        List<UserProfile> members = List.of(owner);
        if (dto.forFamily()) {
            family = owner.getFamily();
            if (family == null) {
                throw new IllegalArgumentException("Профиль не состоит в семье");
            }
            members = userProfileRepository.findByFamilyIdOrderById(family.getId());
        }

        List<Double> dailyCalories = members.stream().map(this::dailyCaloriesOf).toList();

        // структура приёмов — по первому дню; остальные дни должны совпадать
        Map<Integer, List<ManualMealPlanCreateDto.ManualMealSlot>> byDay = new TreeMap<>();
        Set<String> seen = new HashSet<>();
        for (ManualMealPlanCreateDto.ManualMealSlot slot : dto.meals()) {
            if (slot.dayNumber() < 1 || slot.dayNumber() > dto.days()) {
                throw new IllegalArgumentException("День " + slot.dayNumber() + " вне диапазона 1…" + dto.days());
            }
            String key = slot.dayNumber() + ":" + slot.mealType();
            if (!seen.add(key)) {
                throw new IllegalArgumentException("Дублируется приём " + slot.mealType() + " в день " + slot.dayNumber());
            }
            byDay.computeIfAbsent(slot.dayNumber(), d -> new ArrayList<>()).add(slot);
        }
        if (byDay.size() != dto.days()) {
            throw new IllegalArgumentException("Нужно заполнить все дни от 1 до " + dto.days());
        }
        List<MealType> template = byDay.get(1).stream()
                .map(ManualMealPlanCreateDto.ManualMealSlot::mealType)
                .sorted(Comparator.comparingInt(Enum::ordinal))
                .toList();
        int mealsPerDay = template.size();
        if (mealsPerDay < 3 || mealsPerDay > 5) {
            throw new IllegalArgumentException("В дне должно быть от 3 до 5 приёмов пищи");
        }
        for (int day = 1; day <= dto.days(); day++) {
            List<MealType> dayTypes = byDay.get(day).stream()
                    .map(ManualMealPlanCreateDto.ManualMealSlot::mealType)
                    .sorted(Comparator.comparingInt(Enum::ordinal))
                    .toList();
            if (!dayTypes.equals(template)) {
                throw new IllegalArgumentException("Набор приёмов в день " + day + " должен совпадать с днём 1");
            }
        }

        Map<MealType, Double> mealShares = getTargetCaloriesByMeals(mealsPerDay);
        Set<Long> dishIds = dto.meals().stream().map(ManualMealPlanCreateDto.ManualMealSlot::dishId)
                .collect(Collectors.toCollection(LinkedHashSet::new));
        Map<Long, Dish> dishes = new HashMap<>();
        for (Long id : dishIds) {
            Dish dish = dishRepository.findWithIngredientsById(id)
                    .orElseThrow(() -> new NotFoundException("Dish with id:" + id + ", not found!"));
            requireDishCalories(dish);
            dishes.put(id, dish);
        }

        MealPlan plan = new MealPlan();
        plan.setOwner(owner);
        plan.setFamily(family);
        plan.setDays(dto.days());
        plan.setName(normalizePlanName(dto.name(), dto.days(), family != null));
        plan.setStartDate(LocalDate.now());

        for (int day = 1; day <= dto.days(); day++) {
            for (ManualMealPlanCreateDto.ManualMealSlot slot : byDay.get(day)) {
                Dish dish = dishes.get(slot.dishId());
                Meal meal = new Meal();
                meal.setDish(dish);
                meal.setDayNumber(day);
                meal.setMealType(slot.mealType());
                applyExactPortions(meal, dish, slot.mealType(), members, dailyCalories, mealShares);
                plan.addMeal(meal);
            }
        }
        MealPlan saved = repository.save(plan);
        markActive(owner.getId(), saved);
        return saved;
    }

    /**
     * План для одного человека (forFamily = false) или для всей семьи профиля (forFamily = true).
     * Для приёма пищи выбирается одно блюдо на всех. Порция каждого участника считается от его собственной
     * нормы калорий и записывается в MealPortion, а Meal.portion равна сумме порций участников.
     */
    @Transactional
    public MealPlan generateMealPlan(UserProfile requester, boolean forFamily, int days, int mealsPerDay,
                                     int cookingCountPerDay) {
        return generateMealPlan(requester, forFamily, days, mealsPerDay, cookingCountPerDay, null);
    }

    @Transactional
    public MealPlan generateMealPlan(UserProfile requester, boolean forFamily, int days, int mealsPerDay,
                                     int cookingCountPerDay, String name) {
        if (days < 1) {
            throw new IllegalArgumentException("days must be >= 1");
        }

        UserProfile owner = userProfileRepository.findById(requester.getId())
                .orElseThrow(() -> new NotFoundException("User Profile with id:" + requester.getId() + ", not found!"));

        Family family = null;
        List<UserProfile> members = List.of(owner);
        if (forFamily) {
            family = owner.getFamily();
            if (family == null) {
                throw new IllegalArgumentException("Профиль не состоит в семье");
            }
            members = userProfileRepository.findByFamilyIdOrderById(family.getId());
        }
        Set<Long> excludedIds = excludedProductIds(members);

        List<Double> dailyCalories = members.stream().map(this::dailyCaloriesOf).toList();
        double meanDaily = dailyCalories.stream().mapToDouble(Double::doubleValue).average().orElseThrow();
        boolean shared = members.size() > 1;
        double minPortion = shared ? FAMILY_MIN_PORTION : MIN_PORTION;
        double maxPortion = shared ? FAMILY_MAX_PORTION : MAX_PORTION;

        MealPlan plan = new MealPlan();
        plan.setOwner(owner);
        plan.setFamily(family);
        plan.setDays(days);
        plan.setName(normalizePlanName(name, days, forFamily));
        plan.setStartDate(LocalDate.now());

        Map<MealType, Double> mealShares = getTargetCaloriesByMeals(mealsPerDay);
        List<List<MealType>> groups = getMealTypeByCookingCount(mealsPerDay, cookingCountPerDay);

        // кандидатов для каждой готовки грузим один раз, до цикла по дням
        List<List<Dish>> candidatesByGroup = new ArrayList<>();
        for (List<MealType> group : groups) {
            List<Dish> candidates = mealTypeByDishRepository.findDishesByMealTypes(group, excludedIds);
            if (candidates.isEmpty()) {
                throw new IllegalStateException("No dishes suitable for all meal types " + group);
            }
            candidatesByGroup.add(candidates);
        }

        Set<Long> favoriteIds = favoriteDishRepository.findDishIdsByUserId(owner.getId());

        // id блюд, использованных в последние дни, отдельно по каждому типу приёма
        Map<MealType, Deque<Long>> recentIds = new EnumMap<>(MealType.class);

        for (int day = 1; day <= days; day++) {
            for (int g = 0; g < groups.size(); g++) {
                List<MealType> group = groups.get(g);

                // блюдо подбираем по средней цели участников
                List<Double> targets = group.stream()
                        .map(type -> mealShares.get(type) * meanDaily)
                        .toList();

                Set<Long> recent = new HashSet<>();
                for (MealType type : group) {
                    recent.addAll(recentIds.computeIfAbsent(type, t -> new ArrayDeque<>()));
                }

                Dish dish = pickDish(candidatesByGroup.get(g), recent, targets, favoriteIds);

                for (MealType type : group) {
                    Deque<Long> history = recentIds.get(type);
                    history.addLast(dish.getId());
                    if (history.size() > REPEAT_WINDOW_DAYS) {
                        history.removeFirst();
                    }

                    Meal meal = new Meal();
                    meal.setDish(dish);
                    meal.setDayNumber(day);
                    meal.setMealType(type);

                    applyPortions(meal, dish, type, members, dailyCalories, mealShares, minPortion, maxPortion);
                    plan.addMeal(meal);
                }
            }
        }

        MealPlan saved = repository.save(plan);
        markActive(owner.getId(), saved);
        return saved;
    }

    /** Делает план текущим для «Сегодня»; если окно дат не покрывает сегодня — сдвигает старт. */
    @Transactional
    public MealPlan activate(Long ownerId, Long planId) {
        MealPlan plan = getPlan(planId);
        if (!plan.getOwner().getId().equals(ownerId)) {
            throw new IllegalArgumentException("Нет доступа к этому плану");
        }
        LocalDate today = LocalDate.now();
        if (plan.getStartDate() == null || plan.dayNumberFor(today) == null) {
            plan.setStartDate(today);
        }
        markActive(ownerId, plan);
        return plan;
    }

    @Transactional
    public MealPlan rename(Long ownerId, Long planId, String name) {
        MealPlan plan = getPlan(planId);
        if (!plan.getOwner().getId().equals(ownerId)) {
            throw new IllegalArgumentException("Нет доступа к этому плану");
        }
        plan.setName(normalizePlanName(name, plan.getDays(), plan.getFamily() != null));
        return repository.save(plan);
    }

    private void markActive(Long ownerId, MealPlan plan) {
        for (MealPlan other : repository.findByOwnerIdOrderByIdDesc(ownerId)) {
            if (other.isActive() && !other.getId().equals(plan.getId())) {
                other.setActive(false);
            }
        }
        plan.setActive(true);
        repository.save(plan);
    }

    private String normalizePlanName(String raw, int days, boolean forFamily) {
        if (raw != null) {
            String trimmed = raw.trim().replaceAll("\\s+", " ");
            if (!trimmed.isEmpty()) {
                return trimmed.length() > 100 ? trimmed.substring(0, 100) : trimmed;
            }
        }
        String kind = forFamily ? "Семейное меню" : "Моё меню";
        return kind + " · " + days + " дн. · " + LocalDate.now().format(PLAN_NAME_DATE);
    }

    /**
     * Кандидаты на замену: если блюдо готовится сразу на несколько приёмов дня —
     * ищем варианты, подходящие ко всей готовке, и менять будем везде.
     */
    @Transactional(readOnly = true)
    public MealReplaceAlternativesResponse listReplaceAlternatives(UserProfile requester, Long planId, Long mealId) {
        ReplaceCtx ctx = buildReplaceCtx(planId, mealId);
        Set<Long> favoriteIds = favoriteDishRepository.findDishIdsByUserId(requester.getId());

        List<Dish> candidates = loadCandidates(ctx.typesForPick(), ctx.excludedIds(), ctx.oldDishId());
        String scope = ctx.scope();
        if (candidates.isEmpty() && ctx.cookingGroup().size() > 1) {
            // нет общего блюда на всю готовку — предлагаем замену только выбранного приёма
            candidates = loadCandidates(List.of(ctx.meal().getMealType()), ctx.excludedIds(), ctx.oldDishId());
            scope = "MEAL";
        }

        Map<Long, Double> calMap = caloriesMap(candidates);
        double meanTarget = ctx.typesForPick().stream()
                .mapToDouble(t -> ctx.mealShares().get(t) * ctx.meanDaily())
                .average()
                .orElse(ctx.meanDaily() / Math.max(1, ctx.mealsPerDay()));
        if ("MEAL".equals(scope)) {
            meanTarget = ctx.mealShares().get(ctx.meal().getMealType()) * ctx.meanDaily();
        }

        final double targetCal = meanTarget;
        final String finalScope = scope;
        List<MealType> affectedTypes = "COOKING".equals(scope)
                ? ctx.groupTypes()
                : List.of(ctx.meal().getMealType());

        List<MealReplaceAlternativesResponse.Alternative> alts = candidates.stream()
                .filter(d -> calMap.getOrDefault(d.getId(), 0.0) > 0)
                .sorted(Comparator
                        .comparing((Dish d) -> !favoriteIds.contains(d.getId()))
                        .thenComparingDouble(d -> Math.abs(Math.log(targetCal / calMap.get(d.getId())))))
                .limit(REPLACE_ALTERNATIVES_LIMIT)
                .map(d -> {
                    double cal = calMap.get(d.getId());
                    double portion = Math.max(APPLY_MIN_PORTION, targetCal / cal);
                    return new MealReplaceAlternativesResponse.Alternative(
                            d.getId(),
                            d.getName(),
                            d.getCookingTime(),
                            cal,
                            favoriteIds.contains(d.getId()),
                            portion);
                })
                .toList();

        return new MealReplaceAlternativesResponse(
                ctx.meal().getId(),
                ctx.meal().getDayNumber(),
                ctx.oldDishId(),
                ctx.meal().getDish().getName(),
                finalScope,
                affectedTypes,
                alts);
    }

    /**
     * Ставит выбранное блюдо. При scope COOKING (одна готовка) — на все связанные приёмы дня.
     */
    @Transactional
    public MealPlan replaceMealDish(UserProfile requester, Long planId, Long mealId, Long newDishId) {
        ReplaceCtx ctx = buildReplaceCtx(planId, mealId);

        List<Meal> mealsToUpdate = ctx.cookingGroup();
        List<MealType> typesForPick = ctx.groupTypes();
        List<Dish> candidates = loadCandidates(typesForPick, ctx.excludedIds(), ctx.oldDishId());
        if (candidates.stream().noneMatch(d -> d.getId().equals(newDishId)) && ctx.cookingGroup().size() > 1) {
            // выбран вариант только для одного приёма
            mealsToUpdate = List.of(ctx.meal());
            typesForPick = List.of(ctx.meal().getMealType());
            candidates = loadCandidates(typesForPick, ctx.excludedIds(), ctx.oldDishId());
        }
        if (candidates.stream().noneMatch(d -> d.getId().equals(newDishId))) {
            throw new IllegalArgumentException("Это блюдо не подходит для замены выбранного приёма");
        }

        Dish dish = dishRepository.findWithIngredientsById(newDishId)
                .orElseThrow(() -> new NotFoundException("Dish with id:" + newDishId + ", not found!"));

        for (Meal m : mealsToUpdate) {
            m.setDish(dish);
            reapplyPortions(m, dish, m.getMealType(), ctx.members(), ctx.dailyCalories(),
                    ctx.mealShares(), ctx.minPortion(), ctx.maxPortion());
        }

        repository.saveAndFlush(ctx.plan());
        return getPlan(planId);
    }

    private ReplaceCtx buildReplaceCtx(Long planId, Long mealId) {
        MealPlan plan = getPlan(planId);
        Meal meal = plan.getMeals().stream()
                .filter(m -> m.getId().equals(mealId))
                .findFirst()
                .orElseThrow(() -> new NotFoundException("Meal with id:" + mealId + ", not found!"));

        Long oldDishId = meal.getDish().getId();
        int day = meal.getDayNumber();
        List<Meal> cookingGroup = plan.getMeals().stream()
                .filter(m -> m.getDayNumber() == day && m.getDish().getId().equals(oldDishId))
                .sorted(Comparator.comparing(m -> m.getMealType().ordinal()))
                .toList();
        List<MealType> groupTypes = cookingGroup.stream().map(Meal::getMealType).distinct().toList();

        List<UserProfile> members = resolveMembers(plan);
        Set<Long> excludedIds = excludedProductIds(members);
        List<Double> dailyCalories = members.stream().map(this::dailyCaloriesOf).toList();
        double meanDaily = dailyCalories.stream().mapToDouble(Double::doubleValue).average().orElseThrow();
        boolean sharedFamily = members.size() > 1;
        double minPortion = sharedFamily ? FAMILY_MIN_PORTION : MIN_PORTION;
        double maxPortion = sharedFamily ? FAMILY_MAX_PORTION : MAX_PORTION;

        int mealsPerDay = (int) plan.getMeals().stream().filter(m -> m.getDayNumber() == day).count();
        Map<MealType, Double> mealShares = getTargetCaloriesByMeals(mealsPerDay);

        String scope = cookingGroup.size() > 1 ? "COOKING" : "MEAL";
        return new ReplaceCtx(plan, meal, oldDishId, cookingGroup, groupTypes, groupTypes, scope,
                members, excludedIds, dailyCalories, meanDaily, mealsPerDay, mealShares, minPortion, maxPortion);
    }

    private record ReplaceCtx(
            MealPlan plan,
            Meal meal,
            Long oldDishId,
            List<Meal> cookingGroup,
            List<MealType> groupTypes,
            List<MealType> typesForPick,
            String scope,
            List<UserProfile> members,
            Set<Long> excludedIds,
            List<Double> dailyCalories,
            double meanDaily,
            int mealsPerDay,
            Map<MealType, Double> mealShares,
            double minPortion,
            double maxPortion
    ) {
    }

    private List<Dish> loadCandidates(List<MealType> types, Set<Long> excludedIds, Long oldDishId) {
        return mealTypeByDishRepository.findDishesByMealTypes(types, excludedIds).stream()
                .filter(d -> !d.getId().equals(oldDishId))
                .toList();
    }

    private Map<Long, Double> caloriesMap(List<Dish> dishes) {
        Map<Long, Double> calMap = new HashMap<>();
        if (dishes.isEmpty()) {
            return calMap;
        }
        List<Long> ids = dishes.stream().map(Dish::getId).toList();
        for (Object[] row : dishRepository.sumCaloriesByDishIds(ids)) {
            calMap.put((Long) row[0], ((Number) row[1]).doubleValue());
        }
        return calMap;
    }

    @Transactional(readOnly = true)
    public List<MealPlanSummary> getPlansByOwner(Long profileId) {
        return repository.findSummariesByOwnerId(profileId);
    }

    private List<UserProfile> resolveMembers(MealPlan plan) {
        if (plan.getFamily() == null) {
            return List.of(plan.getOwner());
        }
        return userProfileRepository.findByFamilyIdOrderById(plan.getFamily().getId());
    }

    /**
     * Продукты и целые категории (мясо, рыба…): категория разворачивается во все id продуктов.
     * −1 — заглушка для пустого IN в JPQL.
     */
    private Set<Long> excludedProductIds(List<UserProfile> members) {
        Set<Long> excludedIds = new HashSet<>();
        excludedIds.add(-1L);
        List<Long> profileIds = members.stream().map(UserProfile::getId).toList();
        excludedIds.addAll(excludedProductRepository.findProductIdsByProfileIds(profileIds));
        Set<ProductCategory> categories = excludedCategoryRepository.findCategoriesByProfileIds(profileIds);
        if (!categories.isEmpty()) {
            excludedIds.addAll(productRepository.findIdsByCategoryIn(categories));
        }
        return excludedIds;
    }

    private void applyPortions(Meal meal, Dish dish, MealType type, List<UserProfile> members,
                               List<Double> dailyCalories, Map<MealType, Double> mealShares,
                               double minPortion, double maxPortion) {
        // min/max здесь только для подбора кандидатов; порцию ставим под калории
        applyExactPortions(meal, dish, type, members, dailyCalories, mealShares);
    }

    /** Обновляет существующие MealPortion без delete+insert (иначе конфликт uq_meal_portion). */
    private void reapplyPortions(Meal meal, Dish dish, MealType type, List<UserProfile> members,
                                 List<Double> dailyCalories, Map<MealType, Double> mealShares,
                                 double minPortion, double maxPortion) {
        double dishCal = requireDishCalories(dish);
        Map<Long, MealPortion> byMember = new HashMap<>();
        for (MealPortion mp : meal.getMemberPortions()) {
            byMember.put(mp.getMember().getId(), mp);
        }

        double total = 0;
        Set<Long> seen = new HashSet<>();
        for (int i = 0; i < members.size(); i++) {
            UserProfile member = members.get(i);
            double target = mealShares.get(type) * dailyCalories.get(i);
            double portion = exactPortion(target, dishCal);
            MealPortion existing = byMember.get(member.getId());
            if (existing != null) {
                existing.setPortion(portion);
            } else {
                meal.addMemberPortion(member, portion);
            }
            seen.add(member.getId());
            total += portion;
        }
        meal.getMemberPortions().removeIf(mp -> !seen.contains(mp.getMember().getId()));
        meal.setPortion(total);
    }

    private void applyExactPortions(Meal meal, Dish dish, MealType type, List<UserProfile> members,
                                    List<Double> dailyCalories, Map<MealType, Double> mealShares) {
        double dishCal = requireDishCalories(dish);
        double total = 0;
        for (int i = 0; i < members.size(); i++) {
            double target = mealShares.get(type) * dailyCalories.get(i);
            double portion = exactPortion(target, dishCal);
            meal.addMemberPortion(members.get(i), portion);
            total += portion;
        }
        meal.setPortion(total);
    }

    /** Порция ровно под цель калорий; минимум только от деления на ноль/крошки. */
    private double exactPortion(double targetCalories, double dishCalories) {
        return Math.max(APPLY_MIN_PORTION, targetCalories / dishCalories);
    }

    private double requireDishCalories(Dish dish) {
        double dishCal = dish.getCalories();
        if (dishCal <= 0) {
            // fallback: сумма из БД, если коллекция ingredients ещё не прогружена
            List<Object[]> rows = dishRepository.sumCaloriesByDishIds(List.of(dish.getId()));
            if (!rows.isEmpty()) {
                dishCal = ((Number) rows.get(0)[1]).doubleValue();
            }
        }
        if (dishCal <= 0) {
            throw new IllegalStateException("У блюда «" + dish.getName() + "» не задана калорийность");
        }
        return dishCal;
    }

    private double dailyCaloriesOf(UserProfile member) {
        if (member.getGender() == null || member.getWeight() == null || member.getHeight() == null
                || member.getBirthday() == null || member.getActivityLevel() == null) {
            throw new IllegalArgumentException("Профиль «" + member.getFirstName() + "» заполнен не полностью");
        }
        return calculator.calculateDailyCalories(member.getGender(), member.getWeight(), member.getHeight(),
                member.getAge(), member.getActivityLevel(), member.getGoal());
    }

    private Map<MealType, Double> getTargetCaloriesByMeals(int mealsPerDay) {
        Map<MealType, Double> shares = new EnumMap<>(MealType.class);
        switch (mealsPerDay) {
            case 3 -> {
                shares.put(MealType.BREAKFAST, 0.30);
                shares.put(MealType.LUNCH, 0.50);
                shares.put(MealType.DINNER, 0.20);
            }
            case 4 -> {
                shares.put(MealType.BREAKFAST, 0.20);
                shares.put(MealType.SNACK, 0.10);
                shares.put(MealType.LUNCH, 0.45);
                shares.put(MealType.DINNER, 0.25);
            }
            case 5 -> {
                shares.put(MealType.BREAKFAST, 0.20);
                shares.put(MealType.SNACK, 0.10);
                shares.put(MealType.LUNCH, 0.30);
                shares.put(MealType.DINNER, 0.25);
                shares.put(MealType.SECOND_SNACK, 0.15);
            }
            default -> throw new IllegalArgumentException("mealsPerDay must be 3, 4 or 5");
        }
        return shares;
    }

    /**
     * Блюдо подходит, если его можно довести до цели множителем порции, причём для КАЖДОГО приёма
     * группы. Порядок выбора:
     * 1) свежие блюда с порцией в комфортном диапазоне;
     * 2) свежие блюда с любой допустимой порцией;
     * 3) недавно использованные блюда с допустимой порцией;
     * 4) если ничего не масштабируется в допустимых пределах, то несколько ближайших по калорийности.
     */
    private Dish pickDish(List<Dish> dishes, Collection<Long> recent, List<Double> targets,
                          Set<Long> preferredIds) {
        if (dishes.isEmpty()) {
            throw new NotFoundException("No dishes available for this meal type");
        }

        // если состав ещё не в сессии — подтянем калории одним запросом и отсеем нулевые
        Map<Long, Double> calMap = new HashMap<>();
        List<Long> ids = dishes.stream().map(Dish::getId).toList();
        for (Object[] row : dishRepository.sumCaloriesByDishIds(ids)) {
            calMap.put((Long) row[0], ((Number) row[1]).doubleValue());
        }
        List<Dish> usable = dishes.stream()
                .filter(d -> calMap.getOrDefault(d.getId(), 0.0) > 0)
                .toList();
        if (usable.isEmpty()) {
            throw new IllegalStateException("Dishes for this meal type have no calories");
        }

        List<Dish> fresh = new ArrayList<>();
        List<Dish> repeated = new ArrayList<>();
        for (Dish dish : usable) {
            if (recent.contains(dish.getId())) {
                repeated.add(dish);
            } else {
                fresh.add(dish);
            }
        }

        List<Dish> candidates = withPortionIn(fresh, targets, PREFERRED_MIN_PORTION, PREFERRED_MAX_PORTION, calMap);
        if (candidates.isEmpty()) {
            candidates = withPortionIn(fresh, targets, MIN_PORTION, MAX_PORTION, calMap);
        }
        if (candidates.isEmpty()) {
            candidates = withPortionIn(repeated, targets, MIN_PORTION, MAX_PORTION, calMap);
        }
        if (!candidates.isEmpty()) {
            return randomOf(prefer(candidates, preferredIds));
        }

        List<Dish> closest = closestTo(fresh.isEmpty() ? usable : fresh, targets, calMap);
        if (closest.isEmpty()) {
            throw new IllegalStateException("Dishes for this meal type have no calories");
        }
        return randomOf(prefer(closest, preferredIds));
    }

    /** Если среди кандидатов есть избранные — выбираем только из них. */
    private List<Dish> prefer(List<Dish> candidates, Set<Long> preferredIds) {
        if (preferredIds == null || preferredIds.isEmpty()) {
            return candidates;
        }
        List<Dish> liked = candidates.stream().filter(d -> preferredIds.contains(d.getId())).toList();
        return liked.isEmpty() ? candidates : liked;
    }

    private List<Dish> withPortionIn(List<Dish> dishes, List<Double> targets, double minPortion, double maxPortion,
                                     Map<Long, Double> calMap) {
        return dishes.stream()
                .filter(d -> calMap.getOrDefault(d.getId(), 0.0) > 0)
                .filter(d -> targets.stream().allMatch(target -> {
                    double portion = target / calMap.get(d.getId());
                    return portion >= minPortion && portion <= maxPortion;
                }))
                .toList();
    }

    // ближайшие блюда: минимизируем наибольшее отклонение множителя порции среди приёмов группы
    private List<Dish> closestTo(List<Dish> dishes, List<Double> targets, Map<Long, Double> calMap) {
        return dishes.stream()
                .filter(d -> calMap.getOrDefault(d.getId(), 0.0) > 0)
                .sorted(Comparator.comparingDouble(d -> {
                    double cal = calMap.get(d.getId());
                    return targets.stream()
                            .mapToDouble(target -> Math.abs(Math.log(target / cal)))
                            .max()
                            .orElse(0);
                }))
                .limit(CLOSEST_LIMIT)
                .toList();
    }

    private Dish randomOf(List<Dish> list) {
        return list.get(ThreadLocalRandom.current().nextInt(list.size()));
    }

    private List<List<MealType>> getMealTypeByCookingCount(int mealsPerDay, int cookingCountByDay) {
        if (mealsPerDay < 3 || mealsPerDay > 5) {
            throw new IllegalArgumentException("Количество приёмов пищи должно быть от 3 до 5");
        }

        if (cookingCountByDay < 1 || cookingCountByDay > mealsPerDay) {
            throw new IllegalArgumentException("Количество готовок должно быть от 1 до " + mealsPerDay);
        }

        List<MealType> mealTypes = switch (mealsPerDay) {
            case 3 -> List.of(MealType.BREAKFAST, MealType.LUNCH, MealType.DINNER);
            case 4 -> List.of(MealType.BREAKFAST, MealType.SNACK, MealType.LUNCH, MealType.DINNER);
            case 5 -> List.of(MealType.BREAKFAST, MealType.SNACK, MealType.LUNCH, MealType.DINNER,
                    MealType.SECOND_SNACK);
            default -> throw new IllegalStateException();
        };

        List<List<MealType>> result = new ArrayList<>();

        int baseSize = mealsPerDay / cookingCountByDay;
        int remainder = mealsPerDay % cookingCountByDay;
        int index = 0;

        for (int i = 0; i < cookingCountByDay; i++) {
            int groupSize = baseSize + (i < remainder ? 1 : 0);

            List<MealType> group = new ArrayList<>(mealTypes.subList(index, index + groupSize));

            result.add(group);
            index += groupSize;
        }

        return result;
    }
}
