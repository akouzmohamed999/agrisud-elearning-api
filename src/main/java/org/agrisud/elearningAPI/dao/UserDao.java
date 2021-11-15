package org.agrisud.elearningAPI.dao;

import org.agrisud.elearningAPI.model.Registration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Properties;

@Repository
public class UserDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

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

    public void addTrainingPathToUser(Long trainingPathId, String userId){
        MapSqlParameterSource params = new MapSqlParameterSource("userId", userId)
                .addValue("trainingPathId", trainingPathId);
        jdbcTemplate.update(sqlProperties.getProperty("user.add.trainingPath"), params);
    }

}
