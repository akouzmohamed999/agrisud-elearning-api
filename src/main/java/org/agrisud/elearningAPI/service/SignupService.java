package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.UserDao;
import org.agrisud.elearningAPI.model.Registration;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.CreatedResponseUtil;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.ws.rs.core.Response;
import java.util.Collections;

@Service
public class SignupService {

    @Value("${realm-admin.server-url}")
    String serverUrl;
    @Value("${realm-admin.username}")
    String username;
    @Value("${realm-admin.password}")
    String password;
    @Value("${realm-admin.realm}")
    String realm;
    @Value("${realm-admin.client-id}")
    String clientId;
    public static final String ELEARNING_USERS_GROUP = "elearning-users";

    @Autowired
    UserDao userDao;

    public void createCandidateUser(Long trainingPathId, Registration registration) {
        Keycloak keycloak = getKeyCloakRealmResource();
        RealmResource realmResource = keycloak.realm(realm);
        UserRepresentation userRepresentation = getUserRepresentationFromCandidate(registration);
        UsersResource usersResource = realmResource.users();
        Response response = usersResource.create(userRepresentation);
        String userId = CreatedResponseUtil.getCreatedId(response);
        userDao.createElearningUser(userId, registration);
        if (trainingPathId != null) {
            userDao.addTrainingPathToUser(trainingPathId, userId);
        }
        keycloak.close();
    }

    private Keycloak getKeyCloakRealmResource() {
        return KeycloakBuilder.builder()
                .serverUrl(serverUrl)
                .grantType(OAuth2Constants.PASSWORD)
                .realm(realm)
                .clientId(clientId)
                .username(username)
                .password(password)
                .resteasyClient(
                        new ResteasyClientBuilder()
                                .connectionPoolSize(10).build()
                ).build();
    }

    private UserRepresentation getUserRepresentationFromCandidate(Registration registration) {
        UserRepresentation userRepresentation = new UserRepresentation();
        userRepresentation.setUsername(getUsername(registration.getFirstName(), registration.getLastName()));
        userRepresentation.setEmail(registration.getEmail());
        userRepresentation.setFirstName(registration.getFirstName());
        userRepresentation.setLastName(registration.getLastName());
        userRepresentation.setEnabled(true);
        userRepresentation.setEmailVerified(true);

        CredentialRepresentation credentialRepresentation = new CredentialRepresentation();
        credentialRepresentation.setType(CredentialRepresentation.PASSWORD);
        credentialRepresentation.setValue(registration.getPassword());
        credentialRepresentation.setTemporary(false);

        userRepresentation.setGroups(Collections.singletonList(ELEARNING_USERS_GROUP));

        userRepresentation.setCredentials(Collections.singletonList(credentialRepresentation));
        return userRepresentation;
    }

    private String getUsername(String firstName, String lastName) {
        return firstName.toLowerCase().substring(0, 1).concat(lastName.toLowerCase());
    }
}
