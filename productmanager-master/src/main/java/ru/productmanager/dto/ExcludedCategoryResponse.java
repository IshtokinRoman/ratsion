package ru.productmanager.dto;

import ru.productmanager.model.ExcludedCategory;
import ru.productmanager.model.ProductCategory;

public record ExcludedCategoryResponse(ProductCategory category) {
    public static ExcludedCategoryResponse from(ExcludedCategory excluded) {
        return new ExcludedCategoryResponse(excluded.getCategory());
    }
}
