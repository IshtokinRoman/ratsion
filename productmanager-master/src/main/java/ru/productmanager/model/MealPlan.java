package ru.productmanager.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
public class MealPlan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // кто составил план
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "owner_id", nullable = false)
    private UserProfile owner;

    // если план составлен на семью, здесь семья, иначе null (план только для владельца)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "family_id")
    private Family family;

    private int days;

    /** Человекочитаемое имя (список планов / «Сегодня»). */
    @Column(nullable = false, length = 100)
    private String name = "Меню";

    /** Календарная дата дня 1; для экрана «Сегодня». */
    @Column(name = "start_date")
    private LocalDate startDate;

    /** Закреплённый текущий план владельца (гибрид с автоподбором по датам). */
    @Column(nullable = false)
    private boolean active = false;

    @OneToMany(mappedBy = "mealPlan", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Meal> meals = new ArrayList<>();

    public void addMeal(Meal meal) {
        meals.add(meal);
        meal.setMealPlan(this);
    }

    public LocalDate endDate() {
        if (startDate == null || days < 1) {
            return null;
        }
        return startDate.plusDays(days - 1L);
    }

    public Integer dayNumberFor(LocalDate date) {
        if (startDate == null || date == null) {
            return null;
        }
        long offset = java.time.temporal.ChronoUnit.DAYS.between(startDate, date);
        if (offset < 0 || offset >= days) {
            return null;
        }
        return (int) offset + 1;
    }
}
