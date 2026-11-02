package ru.productmanager.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.productmanager.model.ExcludedCategory;
import ru.productmanager.model.ProductCategory;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface ExcludedCategoryRepository extends JpaRepository<ExcludedCategory, Long> {
    List<ExcludedCategory> findByUserProfileIdOrderByCategoryAsc(Long profileId);

    boolean existsByUserProfileIdAndCategory(Long profileId, ProductCategory category);

    Optional<ExcludedCategory> findByUserProfileIdAndCategory(Long profileId, ProductCategory category);

    @Query("select e.category from ExcludedCategory e where e.userProfile.id in :profileIds")
    Set<ProductCategory> findCategoriesByProfileIds(@Param("profileIds") Collection<Long> profileIds);
}
