package org.agrisud.elearningAPI.dao;

import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Sql(scripts = {"classpath:dao/training-path-test.sql"},
        config = @SqlConfig(encoding = "utf-8", transactionMode = SqlConfig.TransactionMode.ISOLATED))
public class TrainingPathDaoTest {

    @Autowired
    private TrainingPathDao trainingPathDao;
    String trainingPath1 = "Parcours 1";
    String trainingPath4 = "Parcours 4";
    TrainingPath trainingPath = new TrainingPath();

    @BeforeEach
    public void setUp() throws Exception {
        trainingPath = TrainingPath.builder().imageUrl("TrainingPathPictures/image1.jpg")
                .trainingPathTime(22).status(false).fullImagePath("http://localhost:3900/s/fi2qNAYsmk7E5EY/preview")
                .build();
    }


    @Test
    public void shouldReturnAllTrainingPath() {
        List<TrainingPath> trainingPathList = trainingPathDao.getTrainingPathList();
        assertThat(trainingPathList).isNotEmpty();
        assertThat(trainingPathList).hasSize(3);
        assertThat(trainingPathList.get(0).getImageUrl()).isEqualTo(trainingPath1);
    }

    @Test
    public void shouldGetTrainingPathByID() {
        Optional<TrainingPath> trainingPath = trainingPathDao.getTrainingPathById(1L);
        assertThat(trainingPath).isNotNull();
        assertThat(trainingPath.get().getImageUrl()).isEqualTo(trainingPath1);
    }

    @Test()
    public void shouldGetTrainingPathByIdThrowException() {
        Assertions.assertThrows(NoSuchElementException.class, () -> {
            Optional<TrainingPath> trainingPath = trainingPathDao.getTrainingPathById(5L);
            assertThat(trainingPath).isNotNull();
            assertThat(trainingPath.get().getImageUrl()).isEqualTo(trainingPath1);
        });

    }

    @Test
    public void shouldCreateNewTrainingPath() {
        long id = trainingPathDao.createNewTrainingPath(trainingPath);
        assertThat(trainingPathDao.getTrainingPathList()).hasSize(4);
        assertThat(trainingPathDao.getTrainingPathById(id).get().getImageUrl()).isEqualTo(trainingPath4);
    }

    @Test
    public void shouldUpdateTrainingPath() {
        TrainingPath trainingPath2 = TrainingPath.builder().id(1L).imageUrl("imageUrl 1")
                .trainingPathTime(15).status(false).build();
        trainingPathDao.updateTrainingPath(trainingPath2);
        assertThat(trainingPathDao.getTrainingPathList()).hasSize(3);
        assertThat(trainingPathDao.getTrainingPathById(1L).get().getImageUrl()).isEqualTo(trainingPath4);
    }

    @Test
    public void shouldDeleteTrainingPath() {
        trainingPathDao.deleteTrainingPath(1L);
        assertThat(trainingPathDao.getTrainingPathList()).hasSize(2);
    }
}
