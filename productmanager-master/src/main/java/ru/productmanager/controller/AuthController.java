package ru.productmanager.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.productmanager.dto.LoginRequest;
import ru.productmanager.dto.RegisterRequest;
import ru.productmanager.dto.UserProfileResponse;
import ru.productmanager.model.UserProfile;
import ru.productmanager.service.AuthService;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<UserProfileResponse> register(@Valid @RequestBody RegisterRequest request,
                                                        HttpServletRequest httpRequest,
                                                        HttpServletResponse httpResponse) {
        UserProfile profile = authService.register(request, httpRequest, httpResponse);
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(profile));
    }

    @PostMapping("/login")
    public UserProfileResponse login(@Valid @RequestBody LoginRequest request,
                                     HttpServletRequest httpRequest,
                                     HttpServletResponse httpResponse) {
        return toResponse(authService.login(request, httpRequest, httpResponse));
    }

    @GetMapping("/me")
    public UserProfileResponse me() {
        return toResponse(authService.me());
    }

    private UserProfileResponse toResponse(UserProfile profile) {
        return UserProfileResponse.from(profile, authService.dailyCalories(profile));
    }
}
