package ru.productmanager.service;

import org.springframework.stereotype.Component;
import ru.productmanager.model.ActivityLevel;
import ru.productmanager.model.Gender;
import ru.productmanager.model.Goal;

@Component
public class BmrCalculator {
    /** Mifflin–St Jeor × коэффициент активности, с поправкой на цель. */
    public double calculateDailyCalories(Gender gender, double weight, double height,
                                         int age, ActivityLevel activityLevel, Goal goal) {
        int genderConstant = gender == Gender.MALE ? 5 : -161;

        double activityCoefficient = switch (activityLevel) {
            case LOW -> 1.375;
            case MODERATE -> 1.55;
            case HIGH -> 1.725;
            case VERY_HIGH -> 1.9;
        };

        double maintenance = (10 * weight + 6.25 * height - 5 * age + genderConstant) * activityCoefficient;
        Goal effective = goal != null ? goal : Goal.MAINTENANCE;
        return switch (effective) {
            case WEIGHT_LOSS -> maintenance * 0.85;
            case WEIGHT_GAIN -> maintenance * 1.15;
            case MAINTENANCE -> maintenance;
        };
    }
}
