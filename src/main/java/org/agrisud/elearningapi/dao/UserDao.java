package org.agrisud.elearningapi.dao;

import org.agrisud.elearningapi.model.Registration;
import org.agrisud.elearningapi.model.TrainingPathTranslation;
import org.apache.james.mime4j.field.datetime.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

@Repository
public class UserDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void createElearningUser(String userId, Registration registration) {
        MapSqlParameterSource params = new MapSqlParameterSource("id", userId)
                .addValue("firstName", registration.getFirstName())
                .addValue("lastName", registration.getLastName())
                .addValue("email", registration.getEmail())
                .addValue("birthDate", registration.getBirthDate())
                .addValue("nationality", registration.getNationality())
                .addValue("occupation", registration.getOccupation())
                .addValue("organisation", registration.getOrganisation())
                .addValue("establishment", registration.getEstablishment())
                .addValue("sex", registration.getSex());
        jdbcTemplate.update(sqlProperties.getProperty("user.create"), params);
    }

    public void addTrainingPathToUser(Long trainingPathId, String userId) {
        MapSqlParameterSource params = new MapSqlParameterSource("userId", userId)
                .addValue("trainingPathId", trainingPathId);
        jdbcTemplate.update(sqlProperties.getProperty("user.add.trainingPath"), params);
    }

    public void addStartTrainingPathDate(Long trainingPathId, String userId) {
        LocalDateTime startDate = LocalDateTime.now();
        MapSqlParameterSource params = new MapSqlParameterSource("userId", userId)
                .addValue("trainingPathId", trainingPathId)
                .addValue("tpt_start_date", startDate);
        jdbcTemplate.update(sqlProperties.getProperty("user.add.start-date.trainingPath"), params);
    }

    public void addEndTrainingPathDate(Long trainingPathId, String userId) {
        LocalDateTime endDate = LocalDateTime.now();
        MapSqlParameterSource params = new MapSqlParameterSource("userId", userId)
                .addValue("trainingPathId", trainingPathId)
                .addValue("tpt_end_date", endDate);
        jdbcTemplate.update(sqlProperties.getProperty("user.add.end-date.trainingPath"), params);
    }

    public Boolean isAlreadyStarted(Long trainingPathId, String userId) {
        MapSqlParameterSource params = new MapSqlParameterSource("userId", userId)
                .addValue("trainingPathId", trainingPathId);
        LocalDateTime endDate = namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("user.start-date.trainingPath.exist"), params, LocalDateTime.class);
        return endDate != null;
    }

    public int getTheAverageTimeSpentByUsersToCompleteATrainingPath(long trainingPathId) {
        Integer average = namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("get.average.time.spent.by.users"),
                new MapSqlParameterSource("trainingPathId", trainingPathId), Integer.class);
        return Objects.requireNonNullElse(average, 0);
    }
}
