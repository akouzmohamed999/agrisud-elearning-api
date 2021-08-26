package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.UserDao;
import org.agrisud.elearningAPI.model.Registration;
import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.CreatedResponseUtil;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.UserRepresentation;
import org.mockito.Mock;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.ws.rs.core.Response;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class SignupServiceTest {

    @Mock
    UserDao userDao;

    SignupService signupService;

    @BeforeEach
    public void setup() {
        signupService = new SignupService();
        signupService.userDao = userDao;
        signupService.serverUrl = "http://localhost:3800/auth";
        signupService.username = "root";
        signupService.password = "password";
        signupService.realm = "agrisud";
        signupService.clientId = "admin-cli";
    }

    @Test
    public void shouldCreateUserFromRegistration() {

        Registration registration = new Registration();
        registration.setFirstName("Mohamed");
        registration.setLastName("akouz");
        registration.setBirthDate("1993-09-09");
        registration.setEmail("makouz@norsys.fr");
        registration.setNationality("MOROCCAN");
        registration.setOrganisation("Norsys");
        registration.setOccupation("Engineer");
        registration.setSex("MALE");

        String userId = "userId";
        MockedStatic<KeycloakBuilder> keycloakBuilderMock = Mockito.mockStatic(KeycloakBuilder.class);
        Keycloak keycloak = Mockito.mock(Keycloak.class);
        RealmResource realmResource = Mockito.mock(RealmResource.class);
        UsersResource usersResource = Mockito.mock(UsersResource.class);
        Response response = Mockito.mock(Response.class);
        MockedStatic<CreatedResponseUtil> createdResponseUtilMock = Mockito.mockStatic(CreatedResponseUtil.class);
        KeycloakBuilder builder = Mockito.mock(KeycloakBuilder.class);

        keycloakBuilderMock.when(KeycloakBuilder::builder).thenReturn(builder);
        when(builder.serverUrl("http://localhost:3800/auth")).thenReturn(builder);
        when(builder.grantType(OAuth2Constants.PASSWORD)).thenReturn(builder);
        when(builder.realm("agrisud")).thenReturn(builder);
        when(builder.clientId("admin-cli")).thenReturn(builder);
        when(builder.username("root")).thenReturn(builder);
        when(builder.password("password")).thenReturn(builder);
        when(builder.resteasyClient(any(ResteasyClient.class))).thenReturn(builder);

        when(builder.build()).thenReturn(keycloak);
        when(keycloak.realm("agrisud")).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.create(any(UserRepresentation.class))).thenReturn(response);
        createdResponseUtilMock.when(() -> CreatedResponseUtil.getCreatedId(response)).thenReturn(userId);

        signupService.createCandidateUser(registration);

        verify(userDao, times(1)).createElearningUser(userId, registration);
    }

}