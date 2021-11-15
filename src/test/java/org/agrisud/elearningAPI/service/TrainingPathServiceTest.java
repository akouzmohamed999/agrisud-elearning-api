package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.CourseDao;
import org.agrisud.elearningAPI.dao.ModuleDao;
import org.agrisud.elearningAPI.dao.TrainingPathDao;
import org.agrisud.elearningAPI.dao.TrainingPathTranslationDao;
import org.agrisud.elearningAPI.enums.CourseType;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class TrainingPathServiceTest {
    @Mock
    private TrainingPathDao trainingPathDao;
    @Mock
    private TrainingPathTranslationDao trainingPathTranslationDao;
    @Mock
    private ModuleDao moduleDao;
    @Mock
    private CourseDao courseDao;

    @InjectMocks
    private TrainingPathService trainingPathService;


    TrainingPath trainingPath = new TrainingPath();

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        trainingPath = TrainingPath.builder().imageUrl("TrainingPathPictures/image1.jpg")
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

//    @Test
//    void shouldCreateTrainingPath() throws Exception {
//        when(trainingPathDao.createNewTrainingPath(any(TrainingPath.class))).thenReturn(1L);
//        trainingPathService.createNewTrainingPath(new TrainingPathCreationDto());
//        verify(trainingPathDao, times(1)).createNewTrainingPath(any(TrainingPath.class));
//    }

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

    @Test
    void duplicateTrainingPath() {

        List<Course> courses = Collections.singletonList(Course.builder()
                .title("course 1").courseHours(1).courseMinutes(15).courseType(CourseType.PDF).moduleId(1L).supportUrl("support/url")
                .build());
        List<Module> modules = Collections.singletonList(Module.builder().id(1L).title("module 1")
                .orderOnPath(1).trainingPathTranslationID(1L).moduleDuration("1:15").build());

        List<TrainingPathTranslation> trainingPathTranslations = Collections.singletonList(TrainingPathTranslation.builder().
                id(1L).title("title").description("description").preRequest("prerequest").build());

        TrainingPath trainingPath = TrainingPath.builder().id(1L).imageUrl("image/url")
                .fullImagePath("full/image/url").status(true).archived(false).build();

        when(trainingPathDao.getTrainingPathById(1L)).thenReturn(Optional.of(trainingPath));
        when(trainingPathTranslationDao.getTrainingPathTranslationListByTrainingPathID(1L)).thenReturn(trainingPathTranslations);
        when(moduleDao.getModuleListByTrainingPathTranslationID(1L)).thenReturn(modules);
        when(courseDao.getCoursesByModule(1L)).thenReturn(courses);

        trainingPathService.duplicateTrainingPath(1L);

        verify(trainingPathDao, times(1)).getTrainingPathById(1L);
        verify(trainingPathTranslationDao, times(1)).getTrainingPathTranslationListByTrainingPathID(1L);
        verify(moduleDao, times(1)).getModuleListByTrainingPathTranslationID(1L);
        verify(courseDao, times(1)).getCoursesByModule(1L);
    }
}
