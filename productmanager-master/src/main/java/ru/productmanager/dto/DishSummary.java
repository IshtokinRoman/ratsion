package ru.productmanager.dto;

import ru.productmanager.model.Dish;
import ru.productmanager.model.MealType;

import java.util.List;

public record DishSummary(
        Long id,
        String name,
        Integer cookingTime,
        double calories,
        List<MealType> mealTypes
) {
    public static DishSummary from(Dish dish, double calories) {
        List<MealType> types = dish.getMealTypes() == null ? List.of()
                : dish.getMealTypes().stream().map(m -> m.getMealType()).sorted().toList();
        return new DishSummary(
                dish.getId(),
                dish.getName(),
                dish.getCookingTime(),
                calories,
                types);
    }
}
