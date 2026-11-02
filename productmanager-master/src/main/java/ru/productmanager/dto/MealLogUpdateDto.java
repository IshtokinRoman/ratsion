package ru.productmanager.dto;

import ru.productmanager.model.MealLogStatus;

/** status = null снимает отметку. */
public record MealLogUpdateDto(MealLogStatus status) {
}
