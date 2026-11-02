package ru.productmanager.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.productmanager.dto.DishCreateDto;
import ru.productmanager.dto.DishIngredientCreateDto;
import ru.productmanager.dto.DishSummary;
import ru.productmanager.exception.NotFoundException;
import ru.productmanager.model.Dish;
import ru.productmanager.model.DishIngredient;
import ru.productmanager.model.MealType;
import ru.productmanager.model.MealTypeByDish;
import ru.productmanager.model.Product;
import ru.productmanager.repo.DishRepository;
import ru.productmanager.repo.MealTypeByDishRepository;
import ru.productmanager.repo.ProductRepository;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DishService {
    private final DishRepository repository;
    private final ProductRepository productRepository;
    private final MealTypeByDishRepository mealTypeByDishRepository;

    @Transactional
    public Dish saveDish(DishCreateDto dto) {
        String name = dto.getName().trim();
        if (repository.existsByNameIgnoreCase(name)) {
            throw new IllegalArgumentException("Блюдо с таким названием уже есть: " + name);
        }
        if (dto.getMealTypes() == null || dto.getMealTypes().isEmpty()) {
            throw new IllegalArgumentException("Укажите хотя бы один приём пищи");
        }

        Dish dish = new Dish();
        dish.setName(name);
        dish.setDescription(dto.getDescription() == null || dto.getDescription().isBlank()
                ? null : dto.getDescription().trim());
        dish.setCookingTime(dto.getCookingTime());

        Set<MealType> uniqueTypes = new HashSet<>(dto.getMealTypes());
        uniqueTypes.forEach(dish::addMealType);

        List<DishIngredientCreateDto> ingredients = dto.getIngredients();
        Set<Long> ids = ingredients.stream()
                .map(DishIngredientCreateDto::productId)
                .collect(Collectors.toSet());
        if (ids.size() != ingredients.size()) {
            throw new IllegalArgumentException("Продукты в составе повторяются");
        }

        Map<Long, Product> products = productRepository.findAllById(ids).stream()
                .collect(Collectors.toMap(Product::getId, Function.identity()));

        for (DishIngredientCreateDto item : ingredients) {
            Product product = products.get(item.productId());
            if (product == null) {
                throw new NotFoundException("Продукт не найден: " + item.productId());
            }
            DishIngredient di = new DishIngredient();
            di.setProduct(product);
            di.setAmount(item.amount());
            dish.addIngredient(di);
        }
        return repository.save(dish);
    }

    @Transactional(readOnly = true)
    public List<DishSummary> search(String query) {
        String q = query == null ? "" : query.trim();
        List<Dish> dishes = repository.searchByName(q, PageRequest.of(0, 500));
        if (dishes.isEmpty()) {
            return List.of();
        }

        List<Long> ids = dishes.stream().map(Dish::getId).toList();
        Map<Long, Double> calories = new HashMap<>();
        for (Object[] row : repository.sumCaloriesByDishIds(ids)) {
            calories.put((Long) row[0], ((Number) row[1]).doubleValue());
        }

        return dishes.stream()
                .map(d -> DishSummary.from(d, calories.getOrDefault(d.getId(), 0.0)))
                .toList();
    }

    @Transactional(readOnly = true)
    public Dish getDish(Long id) {
        Dish dish = repository.findWithIngredientsById(id)
                .orElseThrow(() -> new NotFoundException("Dish with id:" + id + ", not found!"));
        // отдельный запрос: join ingredients × mealTypes давал дубли продуктов
        dish.setMealTypes(new HashSet<>(mealTypeByDishRepository.findByDishId(id)));
        return dish;
    }

    @Transactional
    public void deleteDish(Long id) {
        if (!repository.existsById(id)) {
            throw new NotFoundException("Dish with id:" + id + ", not found!");
        }
        repository.deleteById(id);
    }
}
