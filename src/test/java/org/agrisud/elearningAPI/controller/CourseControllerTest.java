package org.agrisud.elearningAPI.controller;


import org.agrisud.elearningAPI.cloudservice.CourseCloudService;
import org.agrisud.elearningAPI.service.CourseService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("test")
public class CourseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CourseService courseService;

    @MockBean
    private CourseCloudService courseCloudService;

//    @Test
//    public void shouldGetEvents() throws Exception {
//        mockMvc.perform(get("/course"))
//                .andExpect(status().isOk());
//        verify(courseService, times(1)).getEvents();
//    }

    @Test
    public void shouldGetEventsFiles() throws Exception {
//        mockMvc.perform(get("/course/files"))
//                .andExpect(status().isOk());
//        verify(courseCloudService, times(1)).getFolders();
    }
}
