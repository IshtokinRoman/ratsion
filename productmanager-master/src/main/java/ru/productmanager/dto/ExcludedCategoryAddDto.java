package ru.productmanager.dto;

import jakarta.validation.constraints.NotNull;
import ru.productmanager.model.ProductCategory;

public record ExcludedCategoryAddDto(@NotNull ProductCategory category) {
}
