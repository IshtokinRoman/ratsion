package ru.productmanager.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.productmanager.model.Product;
import ru.productmanager.model.ProductCategory;

import java.util.Collection;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    boolean existsByNameIgnoreCase(String name);
    Page<Product> findByNameContainingIgnoreCase(String name, Pageable pageable);

    @Query("select p.id from Product p where p.category in :categories")
    List<Long> findIdsByCategoryIn(@Param("categories") Collection<ProductCategory> categories);
}
