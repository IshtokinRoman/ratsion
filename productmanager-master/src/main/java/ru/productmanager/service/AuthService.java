package ru.productmanager.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import ru.productmanager.dto.LoginRequest;
import ru.productmanager.dto.RegisterRequest;
import ru.productmanager.model.Goal;
import ru.productmanager.model.Role;
import ru.productmanager.model.UserProfile;
import ru.productmanager.repo.UserProfileRepository;
import ru.productmanager.security.AuthenticatedUser;
import ru.productmanager.security.CurrentUserService;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final UserProfileRepository repository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final SecurityContextRepository securityContextRepository;
    private final CurrentUserService currentUserService;
    private final BmrCalculator bmrCalculator;

    @Transactional
    public UserProfile register(RegisterRequest request,
                                HttpServletRequest httpRequest,
                                HttpServletResponse httpResponse) {
        String email = request.getEmail().trim();
        if (repository.existsByEmailIgnoreCase(email)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Email already registered");
        }

        UserProfile profile = new UserProfile();
        profile.setEmail(email);
        profile.setPasswordHash(passwordEncoder.encode(request.getPassword()));
        profile.setRole(Role.USER);
        profile.setFirstName(request.getFirstName().trim());
        profile.setLastName(request.getLastName().trim());
        profile.setHeight(request.getHeight());
        profile.setWeight(request.getWeight());
        profile.setBirthday(request.getBirthday());
        profile.setGender(request.getGender());
        profile.setActivityLevel(request.getActivityLevel());
        profile.setGoal(request.getGoal() != null ? request.getGoal() : Goal.MAINTENANCE);
        repository.save(profile);

        login(new LoginRequest(email, request.getPassword()), httpRequest, httpResponse);
        return profile;
    }

    @Transactional(readOnly = true)
    public UserProfile login(LoginRequest request,
                             HttpServletRequest httpRequest,
                             HttpServletResponse httpResponse) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.email().trim(),
                        request.password()));

        SecurityContext context = SecurityContextHolder.createEmptyContext();
        context.setAuthentication(authentication);
        SecurityContextHolder.setContext(context);
        httpRequest.getSession(true);
        httpRequest.changeSessionId();
        securityContextRepository.saveContext(context, httpRequest, httpResponse);

        AuthenticatedUser user = (AuthenticatedUser) authentication.getPrincipal();
        return repository.findById(user.getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Пользователь не найден"));
    }

    @Transactional(readOnly = true)
    public UserProfile me() {
        return currentUserService.requireProfile();
    }

    public int dailyCalories(UserProfile profile) {
        if (profile.getGender() == null || profile.getWeight() == null || profile.getHeight() == null
                || profile.getBirthday() == null || profile.getActivityLevel() == null) {
            return 0;
        }
        return (int) Math.round(bmrCalculator.calculateDailyCalories(
                profile.getGender(), profile.getWeight(), profile.getHeight(),
                profile.getAge(), profile.getActivityLevel(), profile.getGoal()));
    }
}
