package ru.productmanager.dto;

import java.time.LocalDate;

public record MealPlanSummary(
        Long id,
        String name,
        Integer days,
        Long mealsCount,
        LocalDate startDate,
        boolean active
) {
}
