package ru.productmanager.dto;

import ru.productmanager.model.MealType;

import java.util.List;

public record MealReplaceAlternativesResponse(
        Long mealId,
        int dayNumber,
        Long currentDishId,
        String currentDishName,
        /** COOKING — одна готовка на несколько приёмов; MEAL — только выбранный приём. */
        String scope,
        List<MealType> affectedMealTypes,
        List<Alternative> alternatives
) {
    public record Alternative(
            Long dishId,
            String name,
            Integer cookingTime,
            double calories,
            boolean favorite,
            double portionEstimate
    ) {
    }
}
