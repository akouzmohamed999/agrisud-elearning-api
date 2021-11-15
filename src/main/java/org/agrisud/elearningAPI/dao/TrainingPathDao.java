package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.enums.SortColumn;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.security.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.*;
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

    public Page<TrainingPath> getTrainingPathListPerPage(Pageable pageable, String language,Boolean archived) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset())
                .addValue("language", language)
                .addValue("archived", archived);
        SqlParameterSource sqlParameterSourceCount = new MapSqlParameterSource()
                .addValue("language", language)
                .addValue("archived", archived);
        User loggedInUser = User.getLoggedInUser();
        List<TrainingPath> trainingPathPerPage = null;
        Optional<Integer> total = null;
        if (loggedInUser.getUserId() != null) {
            trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page"),
                    sqlParameterSource, TrainingPath::baseMapper);
            total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.count"),
                    sqlParameterSourceCount, Integer.class));
        } else {
            trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.active.per.page"),
                    sqlParameterSource, TrainingPath::baseMapper);
            total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.active.count"),
                    sqlParameterSourceCount, Integer.class));
        }
        return new PageImpl<>(trainingPathPerPage, pageable, total.get());
    }

    public Page<TrainingPath> getTrainingPathListByUser(Pageable pageable, String userId, String language,Boolean archived) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset())
                .addValue("language", language)
                .addValue("userId", userId)
                .addValue("archived", archived);
        SqlParameterSource sqlParameterSourceCount = new MapSqlParameterSource()
                .addValue("language", language)
                .addValue("userId", userId)
                .addValue("archived", archived);
        List<TrainingPath> trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.by.user"), sqlParameterSource, TrainingPath::baseMapper);
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.by.user.count"), sqlParameterSourceCount, Integer.class));
        return new PageImpl<>(trainingPathPerPage, pageable, total.get());
    }

    public Page<TrainingPath> getTrainingPathListNotUsers(Pageable pageable, String userId, String language,Boolean archived) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset())
                .addValue("language", language)
                .addValue("userId", userId)
                .addValue("archived", archived);
        SqlParameterSource sqlParameterSourceCount = new MapSqlParameterSource()
                .addValue("language", language)
                .addValue("userId", userId)
                .addValue("archived", archived);
        List<TrainingPath> trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.not.users"), sqlParameterSource, TrainingPath::baseMapper);
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.by.not.users.count"), sqlParameterSourceCount, Integer.class));
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
        int associationTableDeleted = namedParameterJdbcTemplate.update(sqlProperties.getProperty("training-path.user.delete"), namedParameters);
        int deleted = namedParameterJdbcTemplate.update(sqlProperties.getProperty("training-path.delete"), namedParameters);
        if (deleted == 1 && associationTableDeleted == 1) {
            log.info("Training Path deleted : " + trainingPathID);
        }
    }

    public void deprecateTrainingPath(Long trainingPathId){
        SqlParameterSource namedParameters = new MapSqlParameterSource("trainingPathId", trainingPathId);
        namedParameterJdbcTemplate.update(sqlProperties.getProperty("training-path.deprecate"), namedParameters);
    }

    private SqlParameterSource initParams(TrainingPath trainingPath) {
        return new MapSqlParameterSource()
                .addValue("training_path_id", trainingPath.getId())
                .addValue("image_url", trainingPath.getImageUrl())
                .addValue("full_image_path", trainingPath.getFullImagePath())
                .addValue("training_path_status", trainingPath.getStatus())
                .addValue("archived", trainingPath.getArchived());
    }

    private SqlParameterSource initParamsByOrder(int page, int size, String language, Boolean archived) {
        return new MapSqlParameterSource()
                .addValue("limit", size)
                .addValue("offset", page * size)
                .addValue("language", language)
                .addValue("archived", archived);
    }

    public Page<TrainingPath> getTrainingPathListPerPageByOrderASC(int page, int size, String language, SortColumn sortColumn, Boolean archived) {
        SqlParameterSource sqlParameterSourceCount = new MapSqlParameterSource()
                .addValue("language", language)
                .addValue("archived", archived);
        List<TrainingPath> trainingPathPerPage = null;
        switch (sortColumn) {
            case TRAINING_PATH_TITLE -> {
                trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page.order-by-title.asc"), initParamsByOrder(page, size, language, archived), TrainingPath::baseMapper);
            }
            case MODULES_NUMBER -> {
                trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page.order-by-modules-number.asc"), initParamsByOrder(page, size, language, archived), TrainingPath::baseMapper);
            }
            case TRAINING_PATH_TIME -> {
                trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page.order-by-time.asc"), initParamsByOrder(page, size, language, archived), TrainingPath::baseMapper);
            }
        }
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.count"), sqlParameterSourceCount, Integer.class));
        PageRequest pageRequest = PageRequest.of(page, size);
        return new PageImpl<>(trainingPathPerPage, pageRequest, total.get());
    }

    public Page<TrainingPath> getTrainingPathListPerPageByOrderDESC(int page, int size, String language, SortColumn sortColumn, Boolean archived) {
        List<TrainingPath> trainingPathPerPage = null;
        SqlParameterSource sqlParameterSourceCount = new MapSqlParameterSource()
                .addValue("language", language)
                .addValue("archived", archived);
        switch (sortColumn) {
            case TRAINING_PATH_TITLE -> {
                trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page.order-by-title.desc"), initParamsByOrder(page, size, language, archived), TrainingPath::baseMapper);
            }
            case MODULES_NUMBER -> {
                trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page.order-by-modules-number.desc"), initParamsByOrder(page, size, language, archived), TrainingPath::baseMapper);
            }
            case TRAINING_PATH_TIME -> {
                trainingPathPerPage = namedParameterJdbcTemplate.query(sqlProperties.getProperty("training-path.get.all.per.page.order-by-time.desc"), initParamsByOrder(page, size, language, archived), TrainingPath::baseMapper);
            }
        }
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("training-path.get.all.count"), sqlParameterSourceCount, Integer.class));
        PageRequest pageRequest = PageRequest.of(page, size);
        return new PageImpl<>(trainingPathPerPage, pageRequest, total.get());
    }
}
