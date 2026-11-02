package ru.productmanager.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record MealPlanRenameDto(
        @NotBlank @Size(max = 100) String name
) {
}
