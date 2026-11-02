package ru.productmanager.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Component;
import ru.productmanager.repo.DishRepository;
import ru.productmanager.repo.ProductRepository;

import javax.sql.DataSource;

/**
 * Подтягивает расширенный каталог при старте (идемпотентный SQL).
 * Сначала чинит кривые названия, затем досевает блюда.
 */
@Slf4j
@Component
@Order(200)
@RequiredArgsConstructor
public class CatalogSeedRunner implements ApplicationRunner {
    private final DataSource dataSource;
    private final ProductRepository productRepository;
    private final DishRepository dishRepository;

    @Override
    public void run(ApplicationArguments args) {
        long productsBefore = productRepository.count();
        long dishesBefore = dishRepository.count();

        ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
        populator.setSqlScriptEncoding("UTF-8");
        populator.setContinueOnError(false);
        populator.addScript(new ClassPathResource("db/seed/fix_dish_names.sql"));
        populator.addScript(new ClassPathResource("db/seed/extended_catalog.sql"));
        populator.addScript(new ClassPathResource("db/seed/catalog_1000.sql"));
        long started = System.currentTimeMillis();
        populator.execute(dataSource);

        long productsAfter = productRepository.count();
        long dishesAfter = dishRepository.count();
        log.info("Каталог: продукты {} → {}, блюда {} → {} ({} ms)",
                productsBefore, productsAfter, dishesBefore, dishesAfter,
                System.currentTimeMillis() - started);
    }
}
