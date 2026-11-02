package ru.productmanager.security;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import ru.productmanager.exception.NotFoundException;
import ru.productmanager.model.UserProfile;
import ru.productmanager.repo.UserProfileRepository;

@Service
@RequiredArgsConstructor
public class CurrentUserService {
    private final UserProfileRepository repository;

    public AuthenticatedUser requirePrincipal() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !(auth.getPrincipal() instanceof AuthenticatedUser user)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Требуется вход в аккаунт");
        }
        return user;
    }

    public UserProfile requireProfile() {
        Long id = requirePrincipal().getId();
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("User Profile with id:" + id + ", not found!"));
    }

    public void requireSelf(Long profileId) {
        if (!requirePrincipal().getId().equals(profileId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Нет доступа к этому профилю");
        }
    }

    public void requireFamilyMember(Long familyId) {
        UserProfile profile = requireProfile();
        if (profile.getFamily() == null || !profile.getFamily().getId().equals(familyId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Вы не состоите в этой семье");
        }
    }
}
