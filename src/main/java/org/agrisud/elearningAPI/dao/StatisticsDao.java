package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.StatisticsData;
import org.agrisud.elearningAPI.model.TrainingPathsUsers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
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

    public List<TrainingPathsUsers> getNbrUsersByNbrTrainingPaths() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.nbr_training_paths"), TrainingPathsUsers::baseMapper);
    }

    public List<StatisticsData> getNbrUsersByNationality() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.nationality"), StatisticsData::baseMapper);
    }

    public List<StatisticsData> getNbrUsersByGenre() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.genre"), StatisticsData::baseMapper);
    }

    public List<StatisticsData> getNbrUsersByOccupation() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.occupation"), StatisticsData::baseMapper);
    }

    public List<StatisticsData> getNbrUsersByEstablishment() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.establishment"), StatisticsData::baseMapper);
    }

    public List<StatisticsData> getNbrUsersByTrainingPath(String language) {
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("nbr_users.by.training_path"), new MapSqlParameterSource().addValue("language", language), StatisticsData::baseMapper);
    }

    public List<StatisticsData> getNbrRegistredUsersByNationality() {
        return jdbcTemplate.query(sqlProperties.getProperty("nbr_registred_users.by.nationality"), StatisticsData::baseMapper);
    }
}
