package ru.productmanager.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import ru.productmanager.dto.MealLogUpdateDto;
import ru.productmanager.dto.TodayResponse;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.TodayService;

@RestController
@RequestMapping("/api/today")
@RequiredArgsConstructor
public class TodayController {
    private final TodayService service;
    private final CurrentUserService currentUser;

    @GetMapping
    public TodayResponse today() {
        return service.today(currentUser.requireProfile());
    }

    @PutMapping("/plans/{planId}/meals/{mealId}")
    public TodayResponse updateLog(@PathVariable Long planId,
                                   @PathVariable Long mealId,
                                   @RequestBody MealLogUpdateDto dto) {
        return service.updateMealLog(currentUser.requireProfile(), planId, mealId,
                dto == null ? null : dto.status());
    }
}
