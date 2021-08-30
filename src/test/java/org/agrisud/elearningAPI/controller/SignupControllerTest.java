package org.agrisud.elearningAPI.controller;


import org.agrisud.elearningAPI.model.Registration;
import org.agrisud.elearningAPI.service.SignupService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.testcontainers.shaded.com.fasterxml.jackson.databind.ObjectMapper;

import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("test")
class SignupControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private SignupService signupService;

    ObjectMapper mapper = new ObjectMapper();

    @Test
    public void shouldCreateUserWhenSigningUp() throws Exception {

        Registration registration = new Registration();
        registration.setFirstName("Mohamed");
        registration.setLastName("akouz");
        registration.setBirthDate("1993-09-09");
        registration.setEmail("makouz@norsys.fr");
        registration.setNationality("MOROCCAN");
        registration.setOrganisation("Norsys");
        registration.setOccupation("Engineer");
        registration.setSex("MALE");

        mockMvc.perform(post("/signup")
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(registration)))
                .andExpect(status().isOk());
        verify(signupService, times(1)).createCandidateUser(eq(registration));
    }

}