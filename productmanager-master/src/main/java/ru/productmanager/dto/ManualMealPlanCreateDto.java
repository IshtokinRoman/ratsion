package ru.productmanager.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import ru.productmanager.model.MealType;

import java.util.List;

public record ManualMealPlanCreateDto(
        @Size(max = 100) String name,
        @Min(1) @Max(14) int days,
        boolean forFamily,
        @NotEmpty @Valid List<ManualMealSlot> meals
) {
    public record ManualMealSlot(
            @Min(1) int dayNumber,
            @NotNull MealType mealType,
            @NotNull Long dishId
    ) {
    }
}
