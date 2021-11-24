package org.agrisud.elearningapi.clouddao;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.aarboard.nextcloud.api.filesharing.Share;
import org.aarboard.nextcloud.api.filesharing.SharePermissions;
import org.aarboard.nextcloud.api.filesharing.ShareType;
import org.agrisud.elearningapi.dto.FileDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
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
public class FileCloudDaoTest {

    @Mock
    NextcloudConnector connector;
    @InjectMocks
    private FileCloudDao fileCloudDao;

    String imageUrl = "http://localhost:3900/s/7xPzzJqrcBfDiWS/preview";
    String imageName = "/TrainingPathPictures/image3_d8F6vZC1ef";

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        fileCloudDao.downloadUrl = "http://localhost:3900";
        fileCloudDao.serverName = "http://localhost:3900";
    }

    @Test
    public void shouldUploadTrainingPathImage() throws IOException {

        Share share = Mockito.mock(Share.class);
        when(share.getUrl()).thenReturn("http://localhost:3900/image");
        when(connector.doShare(anyString(), any(ShareType.class), any(), anyBoolean(), any(),
                any(SharePermissions.class))).thenReturn(share);
        File file = File.createTempFile(imageName, "jpg");

        FileDto fileDto = fileCloudDao.uploadFile(file, imageUrl,true);

        assertThat(fileDto.getFileUrl()).isNotEmpty();
        verify(connector, times(1)).uploadFile(any(File.class), anyString());
        verify(connector, times(1)).doShare(anyString(), any(ShareType.class), any(), anyBoolean(), any(),
                any(SharePermissions.class));
    }
}
