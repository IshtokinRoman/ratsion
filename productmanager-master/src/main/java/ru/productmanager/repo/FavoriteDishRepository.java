package ru.productmanager.repo;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.productmanager.model.FavoriteDish;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface FavoriteDishRepository extends JpaRepository<FavoriteDish, Long> {
    boolean existsByUserProfileIdAndDishId(Long userId, Long dishId);

    Optional<FavoriteDish> findByUserProfileIdAndDishId(Long userId, Long dishId);

    @EntityGraph(attributePaths = {"dish"})
    List<FavoriteDish> findByUserProfileIdOrderByIdDesc(Long userId);

    @Query("select f.dish.id from FavoriteDish f where f.userProfile.id = :userId")
    Set<Long> findDishIdsByUserId(@Param("userId") Long userId);

    void deleteByUserProfileIdAndDishId(Long userId, Long dishId);
}
