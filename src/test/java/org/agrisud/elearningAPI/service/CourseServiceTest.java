package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.CourseDao;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
public class CourseServiceTest {

    @Mock
    CourseDao courseDao;

    CourseService couldService;

    @BeforeEach
    public void setup() {
        couldService = new CourseService();
        couldService.courseDao = courseDao;
    }

    @Test
    public void shouldGetEvents() {
        couldService.getEvents();
        verify(courseDao, times(1)).getCourses();
    }
}
