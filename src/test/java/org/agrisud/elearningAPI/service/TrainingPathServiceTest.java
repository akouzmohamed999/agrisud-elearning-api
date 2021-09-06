package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.TrainingPathDao;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class TrainingPathServiceTest {
    @Mock
    private TrainingPathDao trainingPathDao;
    @InjectMocks
    private TrainingPathService trainingPathService;

    TrainingPath trainingPath = new TrainingPath();

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        trainingPath = TrainingPath.builder().imageUrl("TrainingPathPictures/image1.jpg").trainingPathTime(22)
                .status(false).fullImagePath("http://localhost:3900/s/fi2qNAYsmk7E5EY/preview")
                .build();
    }

    @Test
    public void shouldGetTrainingPathList() throws Exception {
        when(trainingPathDao.getTrainingPathList()).thenReturn(Collections.singletonList(trainingPath));
        trainingPathService.getTrainingPathList();
        verify(trainingPathDao, times(1)).getTrainingPathList();
    }

    @Test
    public void shouldGetTrainingPathById() throws Exception {
        when(trainingPathDao.getTrainingPathById(anyLong())).thenReturn(Optional.ofNullable(trainingPath));
        trainingPathService.getTrainingPathByID(1L);
        verify(trainingPathDao, times(1)).getTrainingPathById(anyLong());
    }

    @Test
    void shouldCreateTrainingPath() throws Exception {
        when(trainingPathDao.createNewTrainingPath(any(TrainingPath.class))).thenReturn(1L);
        trainingPathService.createNewTrainingPath(trainingPath);
        verify(trainingPathDao, times(1)).createNewTrainingPath(any(TrainingPath.class));
    }

    @Test
    void shouldUpdateTrainingPath() throws Exception {
        doNothing().when(trainingPathDao).updateTrainingPath(any(TrainingPath.class));
        trainingPathService.updateTrainingPath(trainingPath);
        verify(trainingPathDao, times(1)).updateTrainingPath(any(TrainingPath.class));
    }

    @Test
    void shouldDeleteTrainingPath() throws Exception {
        doNothing().when(trainingPathDao).deleteTrainingPath(anyLong());
        trainingPathService.deleteTrainingPath(1L);
        verify(trainingPathDao, times(1)).deleteTrainingPath(anyLong());
    }
}
