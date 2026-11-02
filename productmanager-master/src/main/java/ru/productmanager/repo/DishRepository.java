package ru.productmanager.repo;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.productmanager.model.Dish;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

public interface DishRepository extends JpaRepository<Dish, Long> {
    boolean existsByNameIgnoreCase(String name);

    /** Только mealTypes — без ingredients, иначе Cartesian product дублирует строки. */
    @EntityGraph(attributePaths = {"mealTypes"})
    @Query("""
            select d from Dish d
            where lower(d.name) like lower(concat('%', :q, '%'))
            order by d.name
            """)
    List<Dish> searchByName(@Param("q") String q, Pageable pageable);

    @Query("""
            select di.dish.id, coalesce(sum(di.amount * di.product.calories / 100.0), 0)
            from DishIngredient di
            where di.dish.id in :ids
            group by di.dish.id
            """)
    List<Object[]> sumCaloriesByDishIds(@Param("ids") Collection<Long> ids);

    /** Только состав — mealTypes подгружаем отдельным запросом. */
    @EntityGraph(attributePaths = {"ingredients", "ingredients.product"})
    @Query("select d from Dish d where d.id = :id")
    Optional<Dish> findWithIngredientsById(@Param("id") Long id);
}
