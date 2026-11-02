package ru.productmanager.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Data;
import ru.productmanager.model.MealType;

import java.util.ArrayList;
import java.util.List;

@Data
public class DishCreateDto {
    @NotBlank
    @Size(max = 255)
    private String name;

    @Size(max = 1000)
    private String description;

    @Positive
    private Integer cookingTime;

    @NotEmpty
    private List<MealType> mealTypes = new ArrayList<>();

    @NotEmpty
    @Valid
    private List<DishIngredientCreateDto> ingredients = new ArrayList<>();
}
