package ru.productmanager.dto;

import ru.productmanager.model.MealLogStatus;
import ru.productmanager.model.MealType;

import java.time.LocalDate;
import java.util.List;

public record TodayResponse(
        LocalDate date,
        Long planId,
        String planName,
        Integer dayNumber,
        int planDays,
        LocalDate planStartDate,
        boolean active,
        String message,
        double targetCalories,
        double plannedCalories,
        double eatenCalories,
        List<TodayMeal> meals
) {
    public record TodayMeal(
            Long mealId,
            MealType mealType,
            String dishName,
            Long dishId,
            double calories,
            double portion,
            MealLogStatus status
    ) {
    }
}
