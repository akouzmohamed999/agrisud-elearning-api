package org.agrisud.elearningAPI.dao;

import org.agrisud.elearningAPI.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Properties;

@Repository
public class CourseDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public List<Course> getCourses() {
        return jdbcTemplate.query(sqlProperties.getProperty("course.get.all"), Course::baseMapper);
    }
}
