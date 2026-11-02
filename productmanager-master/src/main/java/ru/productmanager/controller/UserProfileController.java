package ru.productmanager.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.productmanager.dto.UserProfilePatchDto;
import ru.productmanager.dto.UserProfileResponse;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.AuthService;
import ru.productmanager.service.UserProfileService;

@RestController
@RequestMapping("/api/profiles")
@RequiredArgsConstructor
public class UserProfileController {
    private final UserProfileService service;
    private final CurrentUserService currentUser;
    private final AuthService authService;

    @GetMapping("/me")
    public UserProfileResponse me() {
        var profile = currentUser.requireProfile();
        return UserProfileResponse.from(profile, authService.dailyCalories(profile));
    }

    @GetMapping("/{id}")
    public UserProfileResponse get(@PathVariable Long id) {
        currentUser.requireSelf(id);
        var profile = service.getById(id);
        return UserProfileResponse.from(profile, authService.dailyCalories(profile));
    }

    @PatchMapping("/{id}")
    public UserProfileResponse patch(@PathVariable Long id, @Valid @RequestBody UserProfilePatchDto dto) {
        currentUser.requireSelf(id);
        var profile = service.patch(id, dto);
        return UserProfileResponse.from(profile, authService.dailyCalories(profile));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        currentUser.requireSelf(id);
        service.deleteUserProfile(id);
    }
}
