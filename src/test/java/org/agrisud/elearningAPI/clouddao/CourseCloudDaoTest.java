package org.agrisud.elearningAPI.clouddao;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ActiveProfiles("test")
@ExtendWith(MockitoExtension.class)
public class CourseCloudDaoTest {

    @Mock
    NextcloudConnector connector;

    CourseCloudDao courseCloudDao;

    @BeforeEach()
    public void setup() {
        courseCloudDao = new CourseCloudDao();
        courseCloudDao.connector = connector;
    }

    @Test
    public void shouldGetFolders() {
        courseCloudDao.getEventFolders();
        verify(connector, times(1)).listFolderContent("/");
    }
}
