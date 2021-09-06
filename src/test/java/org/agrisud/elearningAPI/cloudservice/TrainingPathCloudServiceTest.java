package org.agrisud.elearningAPI.cloudservice;

import org.agrisud.elearningAPI.clouddao.TrainingPathCloudDao;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;

import java.io.File;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class TrainingPathCloudServiceTest {
    @Mock
    private TrainingPathCloudDao trainingPathCloudDao;
    @InjectMocks
    private TrainingPathCloudService trainingPathCloudService;
    MockMultipartFile file = null;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        file = new MockMultipartFile("file", "hello.txt",
                MediaType.MULTIPART_FORM_DATA_VALUE, "Hello, World!".getBytes());
    }

    @Test
    public void shouldUploadTrainingPathImage() {
        when(trainingPathCloudDao.getTrainingPathPicture(anyString())).thenReturn("");
        when(trainingPathCloudDao.uploadTrainingPathPicture(any(File.class), anyString())).thenReturn(any(PictureDto.class));
        trainingPathCloudService.uploadTrainingPathPicture(file);
        verify(trainingPathCloudDao, times(1)).uploadTrainingPathPicture(any(File.class), anyString());
    }

    @Test
    public void shouldReturnImageUrl() {
        when(trainingPathCloudDao.getTrainingPathPicture(anyString())).thenReturn("");
        trainingPathCloudService.getTrainingPathPictureUrl("");
        verify(trainingPathCloudDao, times(1)).getTrainingPathPicture(anyString());
    }
}
