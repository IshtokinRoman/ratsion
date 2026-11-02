package ru.productmanager.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import ru.productmanager.dto.BasketItemUpdateDto;
import ru.productmanager.dto.ProductBasketCreateDto;
import ru.productmanager.dto.ProductBasketResponse;
import ru.productmanager.model.MealPlan;
import ru.productmanager.model.ProductBasket;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.MealPlanService;
import ru.productmanager.service.ProductBasketService;

import java.net.URI;

@RestController
@RequestMapping("/api/baskets")
@RequiredArgsConstructor
public class ProductBasketController {
    private final ProductBasketService service;
    private final MealPlanService mealPlanService;
    private final CurrentUserService currentUser;

    @PostMapping
    public ResponseEntity<ProductBasketResponse> create(@Valid @RequestBody ProductBasketCreateDto dto) {
        requirePlanOwner(dto.mealPlanId());
        ProductBasket basket = service.createFromPlan(dto.mealPlanId());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}").buildAndExpand(basket.getId()).toUri();
        return ResponseEntity.created(location).body(ProductBasketResponse.from(basket));
    }

    @GetMapping("/{id}")
    public ProductBasketResponse get(@PathVariable Long id) {
        return ProductBasketResponse.from(requireBasketOwner(id));
    }

    @GetMapping("/by-plan/{mealPlanId}")
    public ProductBasketResponse getByPlan(@PathVariable Long mealPlanId) {
        requirePlanOwner(mealPlanId);
        return ProductBasketResponse.from(service.getByMealPlan(mealPlanId));
    }

    @PatchMapping("/{basketId}/items/{itemId}")
    public ProductBasketResponse updateItem(@PathVariable Long basketId,
                                            @PathVariable Long itemId,
                                            @Valid @RequestBody BasketItemUpdateDto dto) {
        requireBasketOwner(basketId);
        return ProductBasketResponse.from(service.setPurchased(basketId, itemId, dto.purchased()));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        requireBasketOwner(id);
        service.delete(id);
    }

    private void requirePlanOwner(Long mealPlanId) {
        MealPlan plan = mealPlanService.getPlan(mealPlanId);
        if (!plan.getOwner().getId().equals(currentUser.requirePrincipal().getId())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Нет доступа к этому плану");
        }
    }

    private ProductBasket requireBasketOwner(Long basketId) {
        ProductBasket basket = service.getBasket(basketId);
        if (!basket.getOwner().getId().equals(currentUser.requirePrincipal().getId())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Нет доступа к этой корзине");
        }
        return basket;
    }
}
