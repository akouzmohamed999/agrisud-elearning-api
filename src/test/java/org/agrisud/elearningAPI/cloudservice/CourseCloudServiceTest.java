package org.agrisud.elearningAPI.cloudservice;

import org.agrisud.elearningAPI.clouddao.CourseCloudDao;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
public class CourseCloudServiceTest {

    @Mock
    CourseCloudDao courseCloudDao;

    CourseCloudService courseCloudService;

    @BeforeEach
    public void setup() {
        courseCloudService = new CourseCloudService();
        courseCloudService.courseCloudDao = courseCloudDao;
    }

    @Test
    public void shouldReturnEventFiles(){
        courseCloudService.getFolders();
        verify(courseCloudDao, times(1)).getEventFolders();
    }
}
