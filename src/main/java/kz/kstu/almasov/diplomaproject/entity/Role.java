package kz.kstu.almasov.diplomaproject.entity;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN, TAMADA, RESTAURANT;

    @Override
    public String getAuthority() {
        return name();
    }

}
