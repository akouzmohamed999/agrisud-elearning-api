package org.agrisud.elearningapi.dao;

import org.agrisud.elearningapi.model.TrainingPath;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Sql(scripts = {"classpath:dao/training-path-test.sql"},
        config = @SqlConfig(encoding = "utf-8", transactionMode = SqlConfig.TransactionMode.ISOLATED))
public class TrainingPathDaoTest {

    @Autowired
    private TrainingPathDao trainingPathDao;
    TrainingPath trainingPath = new TrainingPath();

    @BeforeEach
    public void setUp() throws Exception {
        trainingPath = TrainingPath.builder().imageUrl("TrainingPathPictures/image1.jpg")
                .status(false).fullImagePath("http://localhost:3900/s/fi2qNAYsmk7E5EY/preview")
                .build();
    }


    @Test
    public void shouldReturnAllTrainingPath() {
        List<TrainingPath> trainingPathList = trainingPathDao.getTrainingPathList();
        assertThat(trainingPathList).isNotEmpty();
        assertThat(trainingPathList).hasSize(1);
        assertThat(trainingPathList.get(0).getImageUrl()).isEqualTo("imageUrl");
    }

    @Test
    public void shouldGetTrainingPathByID() {
        TrainingPath trainingPath = trainingPathDao.getTrainingPathById(1L).orElseThrow(() -> new RuntimeException(""));
        assertThat(trainingPath).isNotNull();
        assertThat(trainingPath.getImageUrl()).isEqualTo("imageUrl");
    }

    @Test()
    public void shouldGetTrainingPathByIdThrowException() {
        Assertions.assertThrows(RuntimeException.class, () -> {
            TrainingPath trainingPath = trainingPathDao.getTrainingPathById(5L).orElseThrow(() -> new RuntimeException(""));
            assertThat(trainingPath).isNotNull();
            assertThat(trainingPath.getImageUrl()).isEqualTo("imageUrl");

        });
    }

    @Test
    public void shouldCreateNewTrainingPath() {
        long id = trainingPathDao.createNewTrainingPath(trainingPath);
        assertThat(trainingPathDao.getTrainingPathList()).hasSize(2);
        TrainingPath trainingPath = trainingPathDao.getTrainingPathById(id).orElseThrow(() -> new RuntimeException(""));
        assertThat(trainingPath.getImageUrl()).isEqualTo("TrainingPathPictures/image1.jpg");
    }

    @Test
    public void shouldUpdateTrainingPath() {
        TrainingPath trainingPath2 = TrainingPath.builder().id(1L).imageUrl("imageUrl 2")
                .status(false).build();
        trainingPathDao.updateTrainingPath(trainingPath2);
        TrainingPath trainingPath = trainingPathDao.getTrainingPathById(1L).orElseThrow(() -> new RuntimeException(""));
        assertThat(trainingPathDao.getTrainingPathList()).hasSize(1);
        assertThat(trainingPath.getImageUrl()).isEqualTo("imageUrl 2");
    }

    @Test
    public void shouldDeleteTrainingPath() {
        trainingPathDao.deleteTrainingPath(1L);
        assertThat(trainingPathDao.getTrainingPathList()).hasSize(0);
    }
}
