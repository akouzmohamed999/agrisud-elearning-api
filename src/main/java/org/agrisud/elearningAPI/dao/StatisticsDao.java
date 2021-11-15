package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.StatisticsData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Properties;

@Repository
@Slf4j
public class StatisticsDao {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public Integer getNumberOfRegisteredUsers() {
        return jdbcTemplate.queryForObject(sqlProperties.getProperty("registered_users"), Integer.class);
    }

    public List<StatisticsData> getNbrUsersByNbrTrainingPaths() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.nbr_training_paths"), StatisticsData::keyValueMapper);
    }

    public List<StatisticsData> getNbrRegisteredUsersByMonth() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.month"), StatisticsData::keyValueMapper);
    }

    public List<StatisticsData> getNbrRegisteredUsersByMonthByNationality() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.month.by.nationality"), StatisticsData::fullMapper);
    }

    public List<StatisticsData> getNbrUsersByAge() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.age"), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByCompletedTrainingPaths(String language) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.completed_training_paths"), new MapSqlParameterSource().addValue("language", language), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByNationality() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.nationality"), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByGenre() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.genre"), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByOccupation() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.occupation"), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByEstablishment() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.establishment"), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByTrainingPath(String language) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.training_path"), new MapSqlParameterSource().addValue("language", language), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrRegisteredUsersByNationality() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_registered_users.by.nationality"), StatisticsData::labelValueMapper);
    }
}
