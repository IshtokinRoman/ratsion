package ru.productmanager.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import ru.productmanager.model.ActivityLevel;
import ru.productmanager.model.Gender;
import ru.productmanager.model.Goal;
import ru.productmanager.model.Role;
import ru.productmanager.model.UserProfile;
import ru.productmanager.repo.UserProfileRepository;

import java.time.LocalDate;

/**
 * Создаёт учётку администратора при первом запуске, если её ещё нет.
 * Логин/пароль задаются в app.admin.email / app.admin.password.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class AdminUserInitializer implements ApplicationRunner {
    private final UserProfileRepository repository;
    private final PasswordEncoder passwordEncoder;

    @Value("${app.admin.email:admin@local}")
    private String adminEmail;

    @Value("${app.admin.password:admin123}")
    private String adminPassword;

    @Override
    @Transactional
    public void run(ApplicationArguments args) {
        String email = adminEmail.trim();
        var existing = repository.findByEmailIgnoreCase(email);
        if (existing.isPresent()) {
            UserProfile profile = existing.get();
            if (profile.getRole() != Role.ADMIN) {
                profile.setRole(Role.ADMIN);
                log.info("Пользователю {} выдана роль ADMIN", email);
            }
            return;
        }

        UserProfile admin = new UserProfile();
        admin.setEmail(email);
        admin.setPasswordHash(passwordEncoder.encode(adminPassword));
        admin.setRole(Role.ADMIN);
        admin.setFirstName("Админ");
        admin.setLastName("Системы");
        admin.setHeight(175.0);
        admin.setWeight(70.0);
        admin.setBirthday(LocalDate.of(1990, 1, 1));
        admin.setGender(Gender.MALE);
        admin.setActivityLevel(ActivityLevel.MODERATE);
        admin.setGoal(Goal.MAINTENANCE);
        repository.save(admin);
        log.warn("Создан администратор {} (смените пароль app.admin.password в проде)", email);
    }
}
