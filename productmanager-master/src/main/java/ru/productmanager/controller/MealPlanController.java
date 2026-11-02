package ru.productmanager.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import ru.productmanager.dto.ManualMealPlanCreateDto;
import ru.productmanager.dto.MealPlanRenameDto;
import ru.productmanager.dto.MealPlanResponse;
import ru.productmanager.dto.MealPlanSummary;
import ru.productmanager.dto.MealReplaceAlternativesResponse;
import ru.productmanager.dto.MealReplaceRequest;
import ru.productmanager.model.MealPlan;
import ru.productmanager.model.UserProfile;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.MealPlanService;
import ru.productmanager.service.ProductBasketService;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/meal-plans")
@RequiredArgsConstructor
public class MealPlanController {
    private final MealPlanService service;
    private final ProductBasketService basketService;
    private final CurrentUserService currentUser;

    @PostMapping("/generate")
    public ResponseEntity<MealPlanResponse> generate(@RequestParam int days,
                                                     @RequestParam int mealsPerDay,
                                                     @RequestParam(required = false) Integer cookingsPerDay,
                                                     @RequestParam(defaultValue = "false") boolean forFamily,
                                                     @RequestParam(required = false) String name) {
        UserProfile profile = currentUser.requireProfile();
        MealPlan plan = service.generateMealPlan(profile, forFamily, days, mealsPerDay,
                cookingsPerDay != null ? cookingsPerDay : mealsPerDay, name);

        URI location = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/api/meal-plans/{id}").buildAndExpand(plan.getId()).toUri();
        return ResponseEntity.created(location).body(MealPlanResponse.from(plan));
    }

    /** Ручное составление: дни и блюда задаёт пользователь, порции считаем под калории. */
    @PostMapping("/manual")
    public ResponseEntity<MealPlanResponse> createManual(@Valid @RequestBody ManualMealPlanCreateDto dto) {
        UserProfile profile = currentUser.requireProfile();
        MealPlan plan = service.createManualMealPlan(profile, dto);
        URI location = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/api/meal-plans/{id}").buildAndExpand(plan.getId()).toUri();
        return ResponseEntity.created(location).body(MealPlanResponse.from(plan));
    }

    @GetMapping
    public List<MealPlanSummary> list() {
        return service.getPlansByOwner(currentUser.requirePrincipal().getId());
    }

    @GetMapping("/{id}")
    public MealPlanResponse get(@PathVariable Long id) {
        return MealPlanResponse.from(requireOwned(id));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        requireOwned(id);
        service.delete(id);
    }

    @DeleteMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAll() {
        service.deleteAllByOwner(currentUser.requirePrincipal().getId());
    }

    /** Закрепить план как текущий для экрана «Сегодня». */
    @PostMapping("/{id}/activate")
    public MealPlanResponse activate(@PathVariable Long id) {
        requireOwned(id);
        return MealPlanResponse.from(service.activate(currentUser.requirePrincipal().getId(), id));
    }

    /** Переименовать план. */
    @PatchMapping("/{id}")
    public MealPlanResponse rename(@PathVariable Long id, @Valid @RequestBody MealPlanRenameDto dto) {
        requireOwned(id);
        return MealPlanResponse.from(service.rename(currentUser.requirePrincipal().getId(), id, dto.name()));
    }

    /** Варианты замены блюда (с учётом общей готовки на несколько приёмов). */
    @GetMapping("/{planId}/meals/{mealId}/alternatives")
    public MealReplaceAlternativesResponse alternatives(@PathVariable Long planId, @PathVariable Long mealId) {
        requireOwned(planId);
        return service.listReplaceAlternatives(currentUser.requireProfile(), planId, mealId);
    }

    /** Ставит выбранное блюдо; при общей готовке — на все связанные приёмы дня. Корзина сбрасывается. */
    @PostMapping("/{planId}/meals/{mealId}/replace")
    public MealPlanResponse replaceMeal(@PathVariable Long planId,
                                        @PathVariable Long mealId,
                                        @Valid @RequestBody MealReplaceRequest request) {
        requireOwned(planId);
        UserProfile profile = currentUser.requireProfile();
        MealPlan plan = service.replaceMealDish(profile, planId, mealId, request.dishId());
        basketService.deleteByMealPlanId(planId);
        return MealPlanResponse.from(plan);
    }

    private MealPlan requireOwned(Long id) {
        MealPlan plan = service.getPlan(id);
        if (!plan.getOwner().getId().equals(currentUser.requirePrincipal().getId())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Нет доступа к этому плану");
        }
        return plan;
    }
}
