package org.agrisud.elearningapi.cloudservice;

import org.agrisud.elearningapi.clouddao.FileCloudDao;
import org.agrisud.elearningapi.dto.FileDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;

import static org.mockito.ArgumentMatchers.any;

@ExtendWith(MockitoExtension.class)
public class FileCloudServiceTest {
    @Mock
    private FileCloudDao fileCloudDao;
    @InjectMocks
    private FileCloudService fileCloudService;
    MockMultipartFile file = null;
    FileDto fileDto = null;
    String imageUrl = "http://localhost:3900/s/7xPzzJqrcBfDiWS/preview";
    String imagePath = "/TrainingPathPictures/image3_d8F6vZC1ef";

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        file = new MockMultipartFile("file", "hello.txt",
                MediaType.MULTIPART_FORM_DATA_VALUE, "Hello, World!".getBytes());
        fileDto = FileDto.builder().filePath(imagePath).fileUrl(imageUrl).build();
    }

    // @Test
    //public void shouldUploadTrainingPathImage() {
        // when(fileCloudDao.uploadFile(any(File.class), anyString(),anyBoolean())).thenReturn(fileDto);
        // fileCloudService.uploadFile(file, SupportMode.IMAGE);
        // verify(fileCloudDao, times(1)).uploadFile(any(File.class), anyString(),anyBoolean());
   // }
}
