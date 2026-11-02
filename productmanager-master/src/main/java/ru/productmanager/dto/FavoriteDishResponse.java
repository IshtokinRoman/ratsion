package ru.productmanager.dto;

import ru.productmanager.model.FavoriteDish;

public record FavoriteDishResponse(Long dishId, String name, Integer cookingTime) {
    public static FavoriteDishResponse from(FavoriteDish favorite) {
        return new FavoriteDishResponse(
                favorite.getDish().getId(),
                favorite.getDish().getName(),
                favorite.getDish().getCookingTime());
    }
}
