package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Properties;

@Repository
@Slf4j
public class TrainingPathTranslationDao {
    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public List<TrainingPathTranslation> getTrainingPathTranslationList() {
        return jdbcTemplate.query(sqlProperties.getProperty("training-path-translation.get.all"),
                TrainingPathTranslation::baseMapper);
    }

    public List<TrainingPathTranslation> getTrainingPathTranslationListByTrainingPathID(Long TrainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", TrainingPathID);
        return jdbcTemplate.query(sqlProperties.getProperty("training-path-translation.get.all.training-path-id"), namedParameters, TrainingPathTranslation::baseMapper);
    }

    public Optional<TrainingPathTranslation> getTrainingPathTranslationById(Long trainingPathTranslationID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_translation_id", trainingPathTranslationID);
        TrainingPathTranslation trainingPathTranslation = null;
        try {
            trainingPathTranslation = jdbcTemplate.queryForObject(sqlProperties.getProperty("training-path-translation.get.one"), namedParameters, TrainingPathTranslation::baseMapper);
        } catch (DataAccessException dataAccessException) {
            log.info("Training Path translation does not exist" + trainingPathTranslationID);
        }
        return Optional.ofNullable(trainingPathTranslation);
    }

    public long createNewTrainingPathTranslation(TrainingPathTranslation trainingPathTranslation) {
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = this.initParams(trainingPathTranslation);
        int insert = jdbcTemplate.update(sqlProperties.getProperty("training-path-translation.create"), sqlParameterSource, holder);
        if (insert == 1) {
            log.info("New Training Path created : ");
            return Objects.requireNonNull(holder.getKey()).longValue();
        } else {
            log.error("Training Path translation not created : ");
            return 0;
        }
    }

    public void updateTrainingPathTranslation(TrainingPathTranslation trainingPathTranslation) {
        SqlParameterSource sqlParameterSource = this.initParams(trainingPathTranslation);
        int update = jdbcTemplate.update(sqlProperties.getProperty("training-path-translation.update"), sqlParameterSource);
        if (update == 1) {
            log.info("Training Path translation updated : " + trainingPathTranslation.getId());
        }
    }

    public void deleteTrainingPathTranslation(Long trainingPathTranslationID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_translation_id", trainingPathTranslationID);
        int deleted = jdbcTemplate.update(sqlProperties.getProperty("training-path-translation.delete"), namedParameters);
        if (deleted == 1) {
            log.info("Training Path translation deleted : " + trainingPathTranslationID);
        }
    }

    public void deleteTrainingPathTranslationByTrainingPathID(Long trainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", trainingPathID);
        int deleted = jdbcTemplate.update(sqlProperties.getProperty("training-path-translation.delete.training-path-id"), namedParameters);
        if (deleted == 1) {
            log.info("Training Path translation deleted : " + trainingPathID);
        }
    }

    public void updateTrainingPathTranslationTemplate(Long trainingPathTranslationId, String content) {
        jdbcTemplate.update(sqlProperties.getProperty("training-path-translation.update.template"), new MapSqlParameterSource("content", content).addValue("trainingPathTranslationId", trainingPathTranslationId));
    }

    public String getTrainingPathTranslationTemplate(Long trainingPathTranslationId) {
        try {
            return jdbcTemplate.queryForObject(sqlProperties.getProperty("training-path-translation.get.template"), new MapSqlParameterSource("trainingPathTranslationId", trainingPathTranslationId), String.class);
        } catch (DataAccessException e) {
            return "";
        }
    }

    public String getTrainingPathTranslationTemplate(Long trainingPathId, Language currentLang) {
        try {
            return jdbcTemplate.queryForObject(sqlProperties.getProperty("training-path-translation.get.template.by.lang"), new MapSqlParameterSource("trainingPathId", trainingPathId)
                    .addValue("lang", currentLang.toString()), String.class);
        } catch (DataAccessException e) {
            return "";
        }
    }

    private SqlParameterSource initParams(TrainingPathTranslation trainingPathTranslation) {
        return new MapSqlParameterSource()
                .addValue("training_path_translation_id", trainingPathTranslation.getId())
                .addValue("training_path_title", trainingPathTranslation.getTitle())
                .addValue("capacity", trainingPathTranslation.getCapacity())
                .addValue("training_path_description", trainingPathTranslation.getDescription())
                .addValue("pre_request", trainingPathTranslation.getPreRequest())
                .addValue("language", trainingPathTranslation.getLanguage().toString())
                .addValue("training_path_id", trainingPathTranslation.getTrainingPathID())
                .addValue("tpt_template", trainingPathTranslation.getTemplate());
    }
}
