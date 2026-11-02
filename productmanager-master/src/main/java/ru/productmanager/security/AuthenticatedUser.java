package ru.productmanager.security;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ru.productmanager.model.Role;
import ru.productmanager.model.UserProfile;

import java.util.Collection;
import java.util.List;

@Getter
public class AuthenticatedUser implements UserDetails {
    private final Long id;
    private final String email;
    private final String passwordHash;
    private final Role role;

    public AuthenticatedUser(UserProfile profile) {
        this.id = profile.getId();
        this.email = profile.getEmail();
        this.passwordHash = profile.getPasswordHash();
        this.role = profile.getRole() != null ? profile.getRole() : Role.USER;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + role.name()));
    }

    @Override
    public String getPassword() {
        return passwordHash;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
