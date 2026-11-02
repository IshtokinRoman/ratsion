package ru.productmanager.dto;

import ru.productmanager.model.Dish;
import ru.productmanager.model.MealType;

import java.util.List;

public record DishResponse(
        Long id,
        String name,
        String description,
        Integer cookingTime,
        double calories,
        List<MealType> mealTypes,
        List<IngredientItem> ingredients
) {
    public record IngredientItem(
            Long productId,
            String productName,
            Double amount,
            double calories
    ) {
    }

    public static DishResponse from(Dish dish) {
        List<IngredientItem> items = dish.getIngredients().stream()
                .map(i -> new IngredientItem(
                        i.getProduct().getId(),
                        i.getProduct().getName(),
                        i.getAmount(),
                        i.getCalories()))
                .toList();

        List<MealType> types = dish.getMealTypes() == null ? List.of()
                : dish.getMealTypes().stream().map(m -> m.getMealType()).toList();

        return new DishResponse(
                dish.getId(),
                dish.getName(),
                dish.getDescription(),
                dish.getCookingTime(),
                dish.getCalories(),
                types,
                items);
    }
}
