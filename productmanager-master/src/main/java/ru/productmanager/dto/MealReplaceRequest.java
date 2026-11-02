package ru.productmanager.dto;

import jakarta.validation.constraints.NotNull;

public record MealReplaceRequest(@NotNull Long dishId) {
}
