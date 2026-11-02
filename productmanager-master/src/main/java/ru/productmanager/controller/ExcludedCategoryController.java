package ru.productmanager.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.productmanager.dto.ExcludedCategoryAddDto;
import ru.productmanager.dto.ExcludedCategoryResponse;
import ru.productmanager.model.ProductCategory;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.ExcludedCategoryService;

import java.util.List;

@RestController
@RequestMapping("/api/profiles/{profileId}/excluded-categories")
@RequiredArgsConstructor
public class ExcludedCategoryController {
    private final ExcludedCategoryService service;
    private final CurrentUserService currentUser;

    @GetMapping
    public List<ExcludedCategoryResponse> list(@PathVariable Long profileId) {
        currentUser.requireSelf(profileId);
        return service.list(profileId).stream().map(ExcludedCategoryResponse::from).toList();
    }

    @PostMapping
    public List<ExcludedCategoryResponse> add(@PathVariable Long profileId,
                                              @Valid @RequestBody ExcludedCategoryAddDto dto) {
        currentUser.requireSelf(profileId);
        return service.add(profileId, dto.category()).stream().map(ExcludedCategoryResponse::from).toList();
    }

    @DeleteMapping("/{category}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remove(@PathVariable Long profileId, @PathVariable ProductCategory category) {
        currentUser.requireSelf(profileId);
        service.remove(profileId, category);
    }
}
