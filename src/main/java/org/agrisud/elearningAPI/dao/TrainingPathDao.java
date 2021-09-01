package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.TrainingPath;
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
public class TrainingPathDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public List<TrainingPath> getTrainingPathList() {
        return jdbcTemplate.query(sqlProperties.getProperty("training-path.get.all"), TrainingPath::baseMapper);
    }

    public Optional<TrainingPath> getTrainingPathById(Long trainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", trainingPathID);
        TrainingPath trainingPath = null;
        try {
            trainingPath = jdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.one"), namedParameters, TrainingPath::baseMapper);
        } catch (DataAccessException dataAccessException) {
//            log.info("Training Path does not exist" + trainingPathID);
        }
        return Optional.ofNullable(trainingPath);
    }

    public long createNewTrainingPath(TrainingPath trainingPath) {
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = this.initParams(trainingPath);
        int insert = jdbcTemplate.update(sqlProperties.getProperty("training-path.create"), sqlParameterSource, holder);
        if (insert == 1) {
//            log.info("New Training Path created : " + trainingPath.getTitle());
            return Objects.requireNonNull(holder.getKey()).longValue();
        } else {
//            log.error("Training Path not created : ");
            return 0;
        }
    }

    public void updateTrainingPath(TrainingPath trainingPath) {
        SqlParameterSource sqlParameterSource = this.initParams(trainingPath);
        int update = jdbcTemplate.update(sqlProperties.getProperty("training-path.update"), sqlParameterSource);
        if (update == 1) {
//            log.info("Training Path updated : " + trainingPath.getTitle());
        }
    }

    public void deleteTrainingPath(Long trainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", trainingPathID);
        int deleted = jdbcTemplate.update(sqlProperties.getProperty("training-path.delete"), namedParameters);
        if (deleted == 1) {
//            log.info("Training Path deleted : " + trainingPathID);
        }
    }

    private SqlParameterSource initParams(TrainingPath trainingPath) {
        return new MapSqlParameterSource()
                .addValue("training_path_id", trainingPath.getId())
                .addValue("training_path_title", trainingPath.getTitle())
                .addValue("image_url", trainingPath.getImageUrl())
                .addValue("full_image_path", trainingPath.getFullImagePath())
                .addValue("training_path_time", trainingPath.getTrainingPathTime())
                .addValue("capacity", trainingPath.getCapacity())
                .addValue("training_path_description", trainingPath.getDescription())
                .addValue("pre_request", trainingPath.getPreRequest())
                .addValue("training_path_status", trainingPath.getStatus())
                .addValue("training_path_language", trainingPath.getLanguage().toString());
    }
}
