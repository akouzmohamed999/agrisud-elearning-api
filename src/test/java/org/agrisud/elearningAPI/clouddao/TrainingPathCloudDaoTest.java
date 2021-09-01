package org.agrisud.elearningAPI.clouddao;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.aarboard.nextcloud.api.filesharing.Share;
import org.aarboard.nextcloud.api.filesharing.SharePermissions;
import org.aarboard.nextcloud.api.filesharing.ShareType;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.io.File;
import java.io.IOException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ActiveProfiles("test")
@ExtendWith(MockitoExtension.class)
public class TrainingPathCloudDaoTest {

    @Mock
    NextcloudConnector connector;
    @InjectMocks
    private TrainingPathCloudDao trainingPathCloudDao;

    String imageUrl = "http://localhost:3900/s/7xPzzJqrcBfDiWS/preview";
    String imageName = "/TrainingPathPictures/image3_d8F6vZC1ef";

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void shouldUploadTrainingPathImage() throws IOException {
        when(connector.doShare(anyString(), any(ShareType.class), any(), anyBoolean(), any(),
                any(SharePermissions.class))).thenReturn(new Share());
        File file = File.createTempFile(imageName, "jpg");

        PictureDto pictureDto = trainingPathCloudDao.uploadTrainingPathPicture(file, imageUrl);

        assertThat(pictureDto.getUrl()).isNotEmpty();
        verify(connector, times(1)).uploadFile(any(File.class), anyString());
        verify(connector, times(1)).doShare(anyString(), any(ShareType.class), any(), anyBoolean(), any(),
                any(SharePermissions.class));
    }
}
