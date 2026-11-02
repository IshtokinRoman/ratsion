package ru.productmanager.repo;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.productmanager.model.ProductBasket;

import java.util.List;
import java.util.Optional;

public interface ProductBasketRepository extends JpaRepository<ProductBasket, Long> {
    List<ProductBasket> findByOwnerIdOrderByCreatedAtDesc(Long ownerId);

    Optional<ProductBasket> findByMealPlanId(Long mealPlanId);

    @Modifying(clearAutomatically = true)
    void deleteByMealPlanId(Long mealPlanId);

    @Modifying(clearAutomatically = true)
    @Query("delete from ProductBasket b where b.owner.id = :ownerId")
    void deleteByOwnerId(@Param("ownerId") Long ownerId);

    @EntityGraph(attributePaths = {"items", "items.product"})
    Optional<ProductBasket> findWithItemsById(Long id);

    @EntityGraph(attributePaths = {"items", "items.product"})
    Optional<ProductBasket> findWithItemsByMealPlanId(Long mealPlanId);
}