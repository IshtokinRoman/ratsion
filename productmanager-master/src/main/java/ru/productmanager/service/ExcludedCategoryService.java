package ru.productmanager.service;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import ru.productmanager.exception.NotFoundException;
import ru.productmanager.model.ExcludedCategory;
import ru.productmanager.model.ProductCategory;
import ru.productmanager.model.UserProfile;
import ru.productmanager.repo.ExcludedCategoryRepository;
import ru.productmanager.repo.UserProfileRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExcludedCategoryService {
    private final ExcludedCategoryRepository repository;
    private final UserProfileRepository profileRepository;

    @Transactional(readOnly = true)
    public List<ExcludedCategory> list(Long profileId) {
        requireProfile(profileId);
        return repository.findByUserProfileIdOrderByCategoryAsc(profileId);
    }

    @Transactional
    public List<ExcludedCategory> add(Long profileId, ProductCategory category) {
        UserProfile profile = requireProfile(profileId);
        if (repository.existsByUserProfileIdAndCategory(profileId, category)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Категория уже исключена");
        }
        ExcludedCategory excluded = new ExcludedCategory();
        excluded.setUserProfile(profile);
        excluded.setCategory(category);
        repository.save(excluded);
        return repository.findByUserProfileIdOrderByCategoryAsc(profileId);
    }

    @Transactional
    public void remove(Long profileId, ProductCategory category) {
        ExcludedCategory excluded = repository.findByUserProfileIdAndCategory(profileId, category)
                .orElseThrow(() -> new NotFoundException(
                        "Category " + category + " is not excluded for profile " + profileId));
        repository.delete(excluded);
    }

    private UserProfile requireProfile(Long id) {
        return profileRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("User Profile with id:" + id + ", not found!"));
    }
}
