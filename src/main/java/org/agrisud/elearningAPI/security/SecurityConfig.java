package org.agrisud.elearningAPI.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.*;
import java.util.stream.Collectors;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    public static final String ROLE_ADMIN = "ELEARNING_ADMIN";
    public static final String RESOURCE_ACCESS = "resource_access";
    public static final String ROLES = "roles";
    public static final String REALM_ACCESS = "realm_access";

    @Value("${keycloak.resource}")
    private String clientId;

    @Value("${keycloak.allowed-origin}")
    private String allowedOrigin;

    @Bean
    @Order(0)
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOrigin(allowedOrigin);
        config.addAllowedHeader("*");
        config.addAllowedMethod("*");
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.oauth2ResourceServer().jwt().jwtAuthenticationConverter(jwtAuthenticationConverter());
        http
                .cors()
                .and()
                .authorizeRequests()
                .antMatchers("/trainingPath/**").hasRole(ROLE_ADMIN)
                .antMatchers("/module/**").hasRole(ROLE_ADMIN)
                .antMatchers("/course/**").hasRole(ROLE_ADMIN)
                .antMatchers(HttpMethod.GET, "/trainingPath/**").permitAll()
                .antMatchers(HttpMethod.GET, "/module/**").permitAll()
                .antMatchers(HttpMethod.GET, "/course/**").permitAll()
                .antMatchers(HttpMethod.POST, "/signup").permitAll()
                .anyRequest().authenticated()
                .and().csrf().disable();
    }

    private JwtAuthenticationConverter jwtAuthenticationConverter() {
        JwtAuthenticationConverter converter = new JwtAuthenticationConverter();
        converter.setJwtGrantedAuthoritiesConverter(jwt -> {
            final List<String> realmAccess = getRealmRoles(jwt);
            final List<String> resourceAccess = getResourceRoles(jwt);
            realmAccess.addAll(resourceAccess);
            Set<String> roles = new TreeSet<>(realmAccess);
            return roles.stream()
                    .map(SimpleGrantedAuthority::new)
                    .collect(Collectors.toList());
        });
        return converter;
    }

    private List<String> getRealmRoles(Jwt jwt) {
        return (List<String>) ((Map<String, Object>) jwt.getClaims().get(REALM_ACCESS)).get(ROLES);
    }

    private List<String> getResourceRoles(Jwt jwt) {
        Map<String, Object> resourceAccess = (Map<String, Object>) jwt.getClaims().get(RESOURCE_ACCESS);
        Map<String, Object> clientAccess = (Map<String, Object>) resourceAccess.get(clientId);
        if (clientAccess != null) {
            return (List<String>) clientAccess.get(ROLES);
        }
        return Collections.emptyList();
    }

}
