package ru.productmanager.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.productmanager.dto.FavoriteDishAddDto;
import ru.productmanager.dto.FavoriteDishResponse;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.FavoriteDishService;

import java.util.List;

@RestController
@RequestMapping("/api/profiles/{profileId}/favorites")
@RequiredArgsConstructor
public class FavoriteDishController {
    private final FavoriteDishService service;
    private final CurrentUserService currentUser;

    @GetMapping
    public List<FavoriteDishResponse> list(@PathVariable Long profileId) {
        currentUser.requireSelf(profileId);
        return service.list(profileId).stream().map(FavoriteDishResponse::from).toList();
    }

    @PostMapping
    public List<FavoriteDishResponse> add(@PathVariable Long profileId,
                                          @Valid @RequestBody FavoriteDishAddDto dto) {
        currentUser.requireSelf(profileId);
        return service.add(profileId, dto.dishId()).stream().map(FavoriteDishResponse::from).toList();
    }

    @DeleteMapping("/{dishId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remove(@PathVariable Long profileId, @PathVariable Long dishId) {
        currentUser.requireSelf(profileId);
        service.remove(profileId, dishId);
    }
}
