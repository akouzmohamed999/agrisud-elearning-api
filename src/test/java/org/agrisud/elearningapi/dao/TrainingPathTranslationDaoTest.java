package org.agrisud.elearningapi.dao;

import org.agrisud.elearningapi.enums.Language;
import org.agrisud.elearningapi.model.TrainingPathTranslation;
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
@Sql(scripts = {"classpath:dao/training-path-translation-test.sql"},
        config = @SqlConfig(encoding = "utf-8", transactionMode = SqlConfig.TransactionMode.ISOLATED))
public class TrainingPathTranslationDaoTest {

    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;

    TrainingPathTranslation trainingPathTranslation = new TrainingPathTranslation();


    @BeforeEach
    public void setUp() throws Exception {
        trainingPathTranslation = TrainingPathTranslation.builder()
                .id(3L).language(Language.FR).title("Parcours 3").description("Parcours 3").build();
    }


    @Test
    public void shouldReturnAllTrainingPathTranslations() {
        List<TrainingPathTranslation> trainingPathTranslationDao = this.trainingPathTranslationDao.getTrainingPathTranslationList();
        assertThat(trainingPathTranslationDao).isNotEmpty();
        assertThat(trainingPathTranslationDao).hasSize(2);
        assertThat(trainingPathTranslationDao.get(0).getTitle()).isEqualTo("Parcours 1");
    }

    @Test
    public void shouldReturnTrainingPathTranslationByTrainingPathID() {
        List<TrainingPathTranslation> trainingPathTranslationDao =
                this.trainingPathTranslationDao.getTrainingPathTranslationListByTrainingPathID(100L);
        assertThat(trainingPathTranslationDao).isNotEmpty();
        assertThat(trainingPathTranslationDao).hasSize(2);
        assertThat(trainingPathTranslationDao.get(0).getTitle()).isEqualTo("Parcours 1");
    }

    @Test
    public void shouldGetTrainingPathTranslationByID() {
        Optional<TrainingPathTranslation> trainingPathTranslation =
                this.trainingPathTranslationDao.getTrainingPathTranslationById(1L);
        assertThat(trainingPathTranslation).isNotNull();
        assertThat(trainingPathTranslation.get().getTitle()).isEqualTo("Parcours 1");
    }

    @Test()
    public void shouldGetTrainingPathTranslationByIdThrowException() {
        Assertions.assertThrows(NoSuchElementException.class, () -> {
            Optional<TrainingPathTranslation> trainingPathTranslation =
                    this.trainingPathTranslationDao.getTrainingPathTranslationById(5L);
            assertThat(trainingPathTranslation).isNotNull();
            assertThat(trainingPathTranslation.get().getTitle()).isEqualTo("Parcours 1");
        });
    }

    @Test
    public void shouldCreateNewTrainingPathTranslation() {
        long id = this.trainingPathTranslationDao.createNewTrainingPathTranslation(trainingPathTranslation);
        assertThat(trainingPathTranslationDao.getTrainingPathTranslationList()).hasSize(3);
        assertThat(trainingPathTranslationDao.getTrainingPathTranslationById(id)
                .get().getTitle()).isEqualTo("Parcours 3");
    }

    @Test
    public void shouldUpdateTrainingPathTranslation() {
        TrainingPathTranslation trainingPathTranslation1 = TrainingPathTranslation.builder()
                .id(1L).language(Language.FR).title("Parcours").description("Parcours 1").language(Language.FR)
                .capacity("Parcours 1").preRequest("Parcours 1").build();
        this.trainingPathTranslationDao.updateTrainingPathTranslation(trainingPathTranslation1);
        assertThat(trainingPathTranslationDao.getTrainingPathTranslationList()).hasSize(2);
        assertThat(trainingPathTranslationDao.getTrainingPathTranslationById(1L)
                .get().getTitle()).isEqualTo("Parcours");
    }

    @Test
    public void shouldDeleteTrainingPathTranslation() {
        this.trainingPathTranslationDao.deleteTrainingPathTranslation(2L);
        assertThat(trainingPathTranslationDao.getTrainingPathTranslationList()).hasSize(1);
    }
}
