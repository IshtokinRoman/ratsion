package ru.productmanager.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.productmanager.dto.TodayResponse;
import ru.productmanager.exception.NotFoundException;
import ru.productmanager.model.*;
import ru.productmanager.repo.DishRepository;
import ru.productmanager.repo.MealLogRepository;
import ru.productmanager.repo.MealPlanRepository;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TodayService {
    private final MealPlanRepository mealPlanRepository;
    private final MealLogRepository mealLogRepository;
    private final DishRepository dishRepository;
    private final BmrCalculator calculator;

    @Transactional(readOnly = true)
    public TodayResponse today(UserProfile profile) {
        LocalDate today = LocalDate.now();
        double target = dailyTarget(profile);
        MealPlan plan = resolvePlanForToday(profile.getId(), today);
        if (plan == null) {
            return new TodayResponse(today, null, null, null, 0, null, false,
                    "Нет плана на сегодня. Сгенерируйте меню, соберите вручную или активируйте план из списка.",
                    target, 0, 0, List.of());
        }

        Integer dayNumber = plan.dayNumberFor(today);
        if (dayNumber == null) {
            return new TodayResponse(today, plan.getId(), plan.getName(), null, plan.getDays(), plan.getStartDate(),
                    plan.isActive(),
                    "Активный план не покрывает сегодняшнюю дату. Выберите другой в списке выше — старт сдвинется на сегодня.",
                    target, 0, 0, List.of());
        }

        // подгружаем полный граф
        plan = mealPlanRepository.findById(plan.getId()).orElse(plan);
        List<Meal> dayMeals = plan.getMeals().stream()
                .filter(m -> m.getDayNumber() == dayNumber)
                .sorted(Comparator.comparingInt(m -> m.getMealType().ordinal()))
                .toList();

        Map<Long, Double> calMap = caloriesMap(dayMeals);
        Map<MealType, MealLogStatus> logs = mealLogRepository
                .findByMealPlanIdAndDayNumber(plan.getId(), dayNumber).stream()
                .collect(Collectors.toMap(MealLog::getMealType, MealLog::getStatus, (a, b) -> a));

        double planned = 0;
        double eaten = 0;
        List<TodayResponse.TodayMeal> items = new ArrayList<>();
        for (Meal meal : dayMeals) {
            double dishCal = calMap.getOrDefault(meal.getDish().getId(), 0.0);
            double portion = meal.getPortion() != null ? meal.getPortion() : 1.0;
            double mealCal = dishCal * portion;
            planned += mealCal;
            MealLogStatus status = logs.get(meal.getMealType());
            if (status == MealLogStatus.EATEN) {
                eaten += mealCal;
            }
            items.add(new TodayResponse.TodayMeal(
                    meal.getId(),
                    meal.getMealType(),
                    meal.getDish().getName(),
                    meal.getDish().getId(),
                    mealCal,
                    portion,
                    status));
        }

        return new TodayResponse(today, plan.getId(), plan.getName(), dayNumber, plan.getDays(), plan.getStartDate(),
                plan.isActive(), null, target, planned, eaten, items);
    }

    @Transactional
    public TodayResponse updateMealLog(UserProfile profile, Long planId, Long mealId, MealLogStatus status) {
        MealPlan plan = mealPlanRepository.findById(planId)
                .orElseThrow(() -> new NotFoundException("Meal plan with id:" + planId + ", not found!"));
        if (!plan.getOwner().getId().equals(profile.getId())) {
            throw new org.springframework.web.server.ResponseStatusException(
                    org.springframework.http.HttpStatus.FORBIDDEN, "Нет доступа к этому плану");
        }
        Integer todayDay = plan.dayNumberFor(LocalDate.now());
        Meal meal = plan.getMeals().stream()
                .filter(m -> m.getId().equals(mealId))
                .findFirst()
                .orElseThrow(() -> new NotFoundException("Meal with id:" + mealId + ", not found!"));
        if (todayDay == null || meal.getDayNumber() != todayDay) {
            throw new IllegalArgumentException("Отмечать можно только приёмы текущего дня плана");
        }

        if (status == null) {
            mealLogRepository.deleteByMealPlanIdAndDayNumberAndMealType(
                    planId, meal.getDayNumber(), meal.getMealType());
        } else {
            MealLog log = mealLogRepository
                    .findByMealPlanIdAndDayNumberAndMealType(planId, meal.getDayNumber(), meal.getMealType())
                    .orElseGet(MealLog::new);
            log.setMealPlan(plan);
            log.setUserProfile(profile);
            log.setDayNumber(meal.getDayNumber());
            log.setMealType(meal.getMealType());
            log.setStatus(status);
            mealLogRepository.save(log);
        }
        return today(profile);
    }

    /** Гибрид: активный план, если покрывает сегодня; иначе самый новый покрывающий сегодня. */
    private MealPlan resolvePlanForToday(Long ownerId, LocalDate today) {
        Optional<MealPlan> active = mealPlanRepository.findFirstByOwnerIdAndActiveTrueOrderByIdDesc(ownerId);
        if (active.isPresent() && active.get().dayNumberFor(today) != null) {
            return active.get();
        }
        return mealPlanRepository.findByOwnerIdOrderByIdDesc(ownerId).stream()
                .filter(p -> p.dayNumberFor(today) != null)
                .findFirst()
                .orElse(active.orElse(null));
    }

    private double dailyTarget(UserProfile profile) {
        if (profile.getGender() == null || profile.getWeight() == null || profile.getHeight() == null
                || profile.getBirthday() == null || profile.getActivityLevel() == null) {
            return 0;
        }
        return calculator.calculateDailyCalories(profile.getGender(), profile.getWeight(), profile.getHeight(),
                profile.getAge(), profile.getActivityLevel(), profile.getGoal());
    }

    private Map<Long, Double> caloriesMap(List<Meal> meals) {
        Set<Long> ids = meals.stream().map(m -> m.getDish().getId()).collect(Collectors.toSet());
        Map<Long, Double> map = new HashMap<>();
        if (ids.isEmpty()) {
            return map;
        }
        for (Object[] row : dishRepository.sumCaloriesByDishIds(ids)) {
            map.put((Long) row[0], ((Number) row[1]).doubleValue());
        }
        return map;
    }
}
