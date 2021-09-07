package org.agrisud.elearningAPI.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.agrisud.elearningAPI.cloudservice.TrainingPathCloudService;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.service.TrainingPathService;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("test")
public class TrainingPathControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private TrainingPathService trainingPathService;
    @MockBean
    private TrainingPathCloudService trainingPathCloudService;
    @MockBean
    private TrainingPathTranslationService trainingPathTranslationService;


    TrainingPath trainingPath = new TrainingPath();
    PictureDto pictureDto = new PictureDto();

    @BeforeEach
    public void setUp() throws Exception {
        trainingPath = TrainingPath.builder().imageUrl("TrainingPathPictures/image1.jpg")
                .trainingPathTime(22).status(false).fullImagePath("http://localhost:3900/s/fi2qNAYsmk7E5EY/preview").build();

        pictureDto.setUrl("http://localhost:3900/s/fi2qNAYsmk7E5EY/preview");
    }

    @Test
    public void shouldGetTrainingPathListRequestReturn200() throws Exception {
        mockMvc.perform(get("/trainingPath"))
                .andExpect(status().isOk());
        verify(trainingPathService, times(1)).getTrainingPathList();
    }

    @Test
    public void shouldGetTrainingPathByIdRequestReturn200() throws Exception {
        when(trainingPathService.getTrainingPathByID(anyLong())).thenReturn(Optional.ofNullable(trainingPath));
        mockMvc.perform(get("/trainingPath/{trainingPathID}", 1))
                .andExpect(status().isOk());
        verify(trainingPathService, times(1)).getTrainingPathByID(anyLong());
    }

    @Test
    void shouldCreateTrainingPathRequestReturn200() throws Exception {
        when(trainingPathService.createNewTrainingPath(any(TrainingPath.class))).thenReturn(1L);
        mockMvc.perform(post("/trainingPath")
                .content(asJsonString(trainingPath))
                .contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk());
        verify(this.trainingPathService, times(1)).createNewTrainingPath(any(TrainingPath.class));
    }

    @Test
    void shouldUpdateTrainingPathRequestReturn200() throws Exception {
        doNothing().when(trainingPathService).updateTrainingPath(any(TrainingPath.class));
        mockMvc.perform(put("/trainingPath")
                .content(asJsonString(trainingPath))
                .contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk());
        verify(this.trainingPathService, times(1)).updateTrainingPath(any(TrainingPath.class));
    }

    @Test
    void shouldDeleteTrainingPathRequestReturn200() throws Exception {
        when(trainingPathService.getTrainingPathByID(anyLong())).thenReturn(Optional.ofNullable(trainingPath));
        doNothing().when(trainingPathService).deleteTrainingPath(anyLong());
        doNothing().when(trainingPathTranslationService).deleteTrainingPathTranslationByTrainingPathID(anyLong());
        doNothing().when(trainingPathCloudService).deleteTrainingPathPicture(anyString());
        mockMvc.perform(delete("/trainingPath/{trainingPathID}", 1)).andExpect(status().isOk());
        verify(this.trainingPathService, times(1)).deleteTrainingPath(anyLong());
    }

    @Test
    void shouldUploadTrainingPathImageRequestReturn200() throws Exception {
        MockMultipartFile file = new MockMultipartFile("file", "hello.txt",
                MediaType.MULTIPART_FORM_DATA_VALUE, "Hello, World!".getBytes());
        when(trainingPathCloudService.uploadTrainingPathPicture(any(MultipartFile.class))).thenReturn(any(PictureDto.class));
        mockMvc.perform(multipart("/trainingPath/picture").file(file))
                .andExpect(status().isOk());
        verify(trainingPathCloudService, times(1))
                .uploadTrainingPathPicture(any(MultipartFile.class));
    }

    private static String asJsonString(final Object obj) {
        try {
            return new ObjectMapper().writeValueAsString(obj);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
