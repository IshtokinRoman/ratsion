package ru.productmanager.service;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import ru.productmanager.exception.NotFoundException;
import ru.productmanager.model.Dish;
import ru.productmanager.model.FavoriteDish;
import ru.productmanager.model.UserProfile;
import ru.productmanager.repo.DishRepository;
import ru.productmanager.repo.FavoriteDishRepository;
import ru.productmanager.repo.UserProfileRepository;

import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class FavoriteDishService {
    private final FavoriteDishRepository repository;
    private final UserProfileRepository profileRepository;
    private final DishRepository dishRepository;

    @Transactional(readOnly = true)
    public List<FavoriteDish> list(Long profileId) {
        requireProfile(profileId);
        return repository.findByUserProfileIdOrderByIdDesc(profileId);
    }

    @Transactional(readOnly = true)
    public Set<Long> dishIds(Long profileId) {
        return repository.findDishIdsByUserId(profileId);
    }

    @Transactional
    public List<FavoriteDish> add(Long profileId, Long dishId) {
        UserProfile profile = requireProfile(profileId);
        Dish dish = dishRepository.findById(dishId)
                .orElseThrow(() -> new NotFoundException("Dish with id:" + dishId + ", not found!"));
        if (repository.existsByUserProfileIdAndDishId(profileId, dishId)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Блюдо уже в избранном");
        }
        FavoriteDish favorite = new FavoriteDish();
        favorite.setUserProfile(profile);
        favorite.setDish(dish);
        repository.save(favorite);
        return repository.findByUserProfileIdOrderByIdDesc(profileId);
    }

    @Transactional
    public void remove(Long profileId, Long dishId) {
        FavoriteDish favorite = repository.findByUserProfileIdAndDishId(profileId, dishId)
                .orElseThrow(() -> new NotFoundException(
                        "Dish " + dishId + " is not favorite for profile " + profileId));
        repository.delete(favorite);
    }

    private UserProfile requireProfile(Long id) {
        return profileRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("User Profile with id:" + id + ", not found!"));
    }
}
