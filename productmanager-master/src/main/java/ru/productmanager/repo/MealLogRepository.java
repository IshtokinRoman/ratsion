package ru.productmanager.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.productmanager.model.MealLog;
import ru.productmanager.model.MealType;

import java.util.List;
import java.util.Optional;

public interface MealLogRepository extends JpaRepository<MealLog, Long> {
    List<MealLog> findByMealPlanIdAndDayNumber(Long mealPlanId, int dayNumber);

    Optional<MealLog> findByMealPlanIdAndDayNumberAndMealType(Long mealPlanId, int dayNumber, MealType mealType);

    @Modifying(clearAutomatically = true)
    void deleteByMealPlanIdAndDayNumberAndMealType(Long mealPlanId, int dayNumber, MealType mealType);

    @Modifying(clearAutomatically = true)
    void deleteByMealPlanId(Long mealPlanId);

    @Modifying(clearAutomatically = true)
    @Query("delete from MealLog l where l.mealPlan.owner.id = :ownerId")
    void deleteByOwnerId(@Param("ownerId") Long ownerId);
}
