package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.service.CourseService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("test")
public class CourseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CourseService courseService;

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
