package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.security.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcTemplate;
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
public class TrainingPathDao {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public Page<TrainingPath> getTrainingPathListPerPage(Pageable pageable) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset());
        User loggedInUser = User.getLoggedInUser();
        List<TrainingPath> trainingPathPerPage = null;
        Optional<Integer> total = null;
        if (loggedInUser.getUserId() != null) {
            trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page"), sqlParameterSource, TrainingPath::baseMapper);
            total = Optional.ofNullable(jdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.count"), Integer.class));
        } else {
            trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.active.per.page"), sqlParameterSource, TrainingPath::baseMapper);
            total = Optional.ofNullable(jdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.active.count"), Integer.class));
        }

        return new PageImpl<>(trainingPathPerPage, pageable, total.get());
    }

    public Page<TrainingPath> getTrainingPathListByUser(Pageable pageable, String userId) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset())
                .addValue("userId", userId);
        SqlParameterSource namedParameters = new MapSqlParameterSource("userId", userId);
        List<TrainingPath> trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.by.user"), sqlParameterSource, TrainingPath::baseMapper);
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.by.user.count"), namedParameters, Integer.class));
        return new PageImpl<>(trainingPathPerPage, pageable, total.get());
    }

    public Page<TrainingPath> getTrainingPathListNotUsers(Pageable pageable, String userId) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset())
                .addValue("userId", userId);
        SqlParameterSource namedParameters = new MapSqlParameterSource("userId", userId);
        List<TrainingPath> trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.not.users"), sqlParameterSource, TrainingPath::baseMapper);
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.by.not.users.count"), namedParameters, Integer.class));
        return new PageImpl<>(trainingPathPerPage, pageable, total.get());
    }


    public List<TrainingPath> getTrainingPathList() {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all"), TrainingPath::baseMapper);
    }

    public Optional<TrainingPath> getTrainingPathById(Long trainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", trainingPathID);
        TrainingPath trainingPath = null;
        try {
            trainingPath = namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.one"), namedParameters, TrainingPath::baseMapper);
        } catch (DataAccessException dataAccessException) {
            log.info("Training Path does not exist" + trainingPathID);
        }
        return Optional.ofNullable(trainingPath);
    }

    public long createNewTrainingPath(TrainingPath trainingPath) {
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = this.initParams(trainingPath);
        int insert = namedParameterJdbcTemplate.update(sqlProperties.getProperty("training-path.create"), sqlParameterSource, holder);
        if (insert == 1) {
            log.info("New Training Path created : ");
            return Objects.requireNonNull(holder.getKey()).longValue();
        } else {
            log.error("Training Path not created : ");
            return 0;
        }
    }

    public void updateTrainingPath(TrainingPath trainingPath) {
        SqlParameterSource sqlParameterSource = this.initParams(trainingPath);
        int update = namedParameterJdbcTemplate.update(sqlProperties.getProperty("training-path.update"), sqlParameterSource);
        if (update == 1) {
            log.info("Training Path updated : " + trainingPath.getId());
        }
    }

    public void deleteTrainingPath(Long trainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", trainingPathID);
        int deleted = namedParameterJdbcTemplate.update(sqlProperties.getProperty("training-path.delete"), namedParameters);
        if (deleted == 1) {
            log.info("Training Path deleted : " + trainingPathID);
        }
    }

    private SqlParameterSource initParams(TrainingPath trainingPath) {
        return new MapSqlParameterSource()
                .addValue("training_path_id", trainingPath.getId())
                .addValue("image_url", trainingPath.getImageUrl())
                .addValue("full_image_path", trainingPath.getFullImagePath())
                .addValue("training_path_time", trainingPath.getTrainingPathTime())
                .addValue("training_path_status", trainingPath.getStatus());
    }
}
