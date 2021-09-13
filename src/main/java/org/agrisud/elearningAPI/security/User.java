package org.agrisud.elearningAPI.security;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;

@Getter
@Setter
public class User {
    private String userId;
    private String username;

    public static User getLoggedInUser() {
        User currentUser = new User();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            Jwt test = (Jwt) SecurityContextHolder.getContext().getAuthentication().getCredentials();
            currentUser.setUserId(test.getClaim("sub"));
            currentUser.setUsername(test.getClaim("preferred_username"));
        }
        return currentUser;
    }
}
