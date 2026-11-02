package ru.productmanager.dto;

import jakarta.validation.constraints.*;
import lombok.Data;
import ru.productmanager.model.ActivityLevel;
import ru.productmanager.model.Gender;
import ru.productmanager.model.Goal;

import java.time.LocalDate;

@Data
public class RegisterRequest {
    @NotBlank
    @Email
    @Size(max = 255)
    private String email;

    @NotBlank
    @Size(min = 6, max = 100)
    private String password;

    @NotBlank
    @Size(max = 100)
    private String firstName;

    @NotBlank
    @Size(max = 100)
    private String lastName;

    @NotNull
    @Positive
    private Double height;

    @NotNull
    @Positive
    private Double weight;

    @NotNull
    @Past
    private LocalDate birthday;

    @NotNull
    private Gender gender;

    @NotNull
    private ActivityLevel activityLevel;

    private Goal goal;
}
