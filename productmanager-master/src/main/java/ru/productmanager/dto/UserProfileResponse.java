package ru.productmanager.dto;

import ru.productmanager.model.ActivityLevel;
import ru.productmanager.model.Gender;
import ru.productmanager.model.Goal;
import ru.productmanager.model.Role;
import ru.productmanager.model.UserProfile;

import java.time.LocalDate;

public record UserProfileResponse(
        Long id,
        String firstName,
        String lastName,
        String email,
        Double height,
        Double weight,
        LocalDate birthday,
        int age,
        Gender gender,
        ActivityLevel activityLevel,
        Goal goal,
        Long familyId,
        Integer dailyCalories,
        Role role
) {
    public static UserProfileResponse from(UserProfile profile) {
        return from(profile, null);
    }

    public static UserProfileResponse from(UserProfile profile, Integer dailyCalories) {
        return new UserProfileResponse(
                profile.getId(),
                profile.getFirstName(),
                profile.getLastName(),
                profile.getEmail(),
                profile.getHeight(),
                profile.getWeight(),
                profile.getBirthday(),
                profile.getAge(),
                profile.getGender(),
                profile.getActivityLevel(),
                profile.getGoal(),
                profile.getFamily() == null ? null : profile.getFamily().getId(),
                dailyCalories,
                profile.getRole() != null ? profile.getRole() : Role.USER);
    }
}
