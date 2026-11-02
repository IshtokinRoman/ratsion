package ru.productmanager.dto;

import jakarta.validation.constraints.NotNull;

public record FavoriteDishAddDto(@NotNull Long dishId) {
}
