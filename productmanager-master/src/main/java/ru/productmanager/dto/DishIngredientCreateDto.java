package ru.productmanager.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

public record DishIngredientCreateDto(
        @NotNull Long productId,
        @NotNull @Positive Double amount
) {
}
