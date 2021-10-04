package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.security.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
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

@Slf4j
@Repository
public class CourseDao {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public Page<Course> getCoursesByModulePerPage(Pageable pageable, Long moduleID) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("limit", pageable.getPageSize())
                .addValue("offset", pageable.getOffset()).addValue("module_id", moduleID);
        SqlParameterSource sqlParameterSourceCount = new MapSqlParameterSource()
                .addValue("module_id", moduleID);
        Optional<Integer> total = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("course.get.all.by.module.count"),
                sqlParameterSourceCount, Integer.class));
        List<Course> courseList = namedParameterJdbcTemplate.query(sqlProperties.getProperty("course.get.all.by.module.per_page"), sqlParameterSource, Course::baseMapper);
        return new PageImpl<>(courseList, pageable, total.get());
    }

    public List<Course> getCoursesByModule(Long moduleID) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("module_id", moduleID);
        return namedParameterJdbcTemplate.query(sqlProperties.getProperty("course.get.all.by.module"), sqlParameterSource, Course::baseMapper);
    }

    public Optional<Course> getCoursesByID(Long courseID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("course_id", courseID);
        Course course = null;
        try {
            course = namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("course.get.by.id"), namedParameters, Course::baseMapper);
        } catch (DataAccessException dataAccessException) {
            log.info("Training Path does not exist" + courseID);
        }
        return Optional.ofNullable(course);
    }

    public long createNewCourse(Course course) {
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = this.initParams(course);
        int insert = namedParameterJdbcTemplate.update(sqlProperties.getProperty("course.create"), sqlParameterSource, holder);
        if (insert == 1) {
            log.info("New Course Created :) " + course.getTitle());
            return Objects.requireNonNull(holder.getKey()).longValue();
        } else {
            log.error("Course not created :/ ");
            return 0;
        }
    }

    public void updateCourse(Course course) {
        SqlParameterSource sqlParameterSource = this.initParams(course);
        int update = namedParameterJdbcTemplate.update(sqlProperties.getProperty("course.update"), sqlParameterSource);
        if (update == 1) {
            log.info("Course updated :) " + course.getId());
        }
    }

    public void deleteCourse(Long courseID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("course_id", courseID);
        int deleted = namedParameterJdbcTemplate.update(sqlProperties.getProperty("course.delete"), namedParameters);
        if (deleted == 1) {
            log.info("Course deleted :) " + courseID);
        }
    }

    public void deleteCourseByModule(Long moduleID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("module_id", moduleID);
        int deleted = namedParameterJdbcTemplate.update(sqlProperties.getProperty("course.delete.by.module"), namedParameters);
        if (deleted == 1) {
            log.info("Module's courses deleted :) " + moduleID);
        }
    }

    public void addCourseToUser(Long courseID) {
        User loggedInUser = User.getLoggedInUser();
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("userId", loggedInUser.getUserId())
                .addValue("course_id", courseID);
        int insert = namedParameterJdbcTemplate.update(sqlProperties.getProperty("user.add.course"), sqlParameterSource);
        if (insert == 1) {
            log.info("Course" + courseID + " finished for :) " + User.getLoggedInUser());
        } else {
            log.error("Course not finished :/ " + courseID);
        }
    }

    public boolean isModuleFinished(Long moduleID) {
        User loggedInUser = User.getLoggedInUser();
        SqlParameterSource modulesCoursesNumberSqlParameter = new MapSqlParameterSource()
                .addValue("module_id", moduleID);
        SqlParameterSource finishedCoursesNumberSqlParameter = new MapSqlParameterSource()
                .addValue("userId", loggedInUser.getUserId()).addValue("module_id", moduleID);
        Optional<Integer> modulesCoursesNumber = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("course.get.all.by.module.count"),
                modulesCoursesNumberSqlParameter, Integer.class));
        Optional<Integer> finishedCoursesNumber = Optional.ofNullable(namedParameterJdbcTemplate.queryForObject(sqlProperties.getProperty("user.finished.courses"),
                finishedCoursesNumberSqlParameter, Integer.class));
        return modulesCoursesNumber == finishedCoursesNumber;
    }

    private SqlParameterSource initParams(Course course) {
        return new MapSqlParameterSource()
                .addValue("course_id", course.getId())
                .addValue("course_title", course.getTitle())
                .addValue("course_hours", course.getCourseHours())
                .addValue("course_minutes", course.getCourseMinutes())
                .addValue("course_support_url", course.getSupportUrl())
                .addValue("course_support_path", course.getSupportPath())
                .addValue("course_type", course.getCourseType().toString())
                .addValue("module_id", course.getModuleId());
    }
}
