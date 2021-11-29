package org.agrisud.elearningapi.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningapi.model.StatisticsData;
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

    public Integer getNumberOfRegisteredUsers(int year) {
        return namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("registered_users"), new MapSqlParameterSource().addValue("year", year), Integer.class);
    }

    public List<StatisticsData> getNbrUsersByNbrTrainingPaths(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.nbr_training_paths"), new MapSqlParameterSource().addValue("year", year), StatisticsData::keyValueMapper);
    }

    public List<StatisticsData> getNbrRegisteredUsersByMonth(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.month"), new MapSqlParameterSource().addValue("year", year), StatisticsData::keyValueMapper);
    }

    public List<StatisticsData> getNbrRegisteredUsersByMonthByNationality(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.month.by.nationality"), new MapSqlParameterSource().addValue("year", year), StatisticsData::fullMapper);
    }

    public List<StatisticsData> getNbrUsersByAge(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.age"), new MapSqlParameterSource().addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByCompletedTrainingPaths(String language, int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.completed_training_paths"), new MapSqlParameterSource().addValue("language", language).addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByNationality(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.nationality"), new MapSqlParameterSource().addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByGenre(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.genre"), new MapSqlParameterSource().addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByOccupation(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.occupation"), new MapSqlParameterSource().addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByEstablishment(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.establishment"), new MapSqlParameterSource().addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrUsersByTrainingPath(String language, int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.training_path"), new MapSqlParameterSource().addValue("language", language).addValue("year", year), StatisticsData::labelValueMapper);
    }

    public List<StatisticsData> getNbrRegisteredUsersByNationality(int year) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_registered_users.by.nationality"), new MapSqlParameterSource().addValue("year", year), StatisticsData::labelValueMapper);
    }
}
