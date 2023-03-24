package com.example.ediary.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER, ROLE_GUEST, ROLE_TEACHER, ROLE_ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
