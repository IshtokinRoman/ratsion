package ru.productmanager.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
public class Dish {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    private String description;

    private Integer cookingTime;

    @OneToMany(mappedBy = "dish", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DishIngredient> ingredients = new ArrayList<>();

    /** Set, не List: Hibernate не умеет одновременно fetch два bag (List). */
    @OneToMany(mappedBy = "dish", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<MealTypeByDish> mealTypes = new HashSet<>();

    public void addIngredient(DishIngredient dishIngredient) {
        ingredients.add(dishIngredient);
        dishIngredient.setDish(this);
    }

    public void addMealType(MealType type) {
        MealTypeByDish link = new MealTypeByDish();
        link.setDish(this);
        link.setMealType(type);
        mealTypes.add(link);
    }

    @Transient
    public double getCalories() {
        return ingredients.stream()
                .mapToDouble(i -> {
                    if (i.getProduct() == null || i.getProduct().getCalories() == null || i.getAmount() == null) {
                        return 0;
                    }
                    return i.getProduct().getCalories() * i.getAmount() / 100.0;
                })
                .sum();
    }
}
