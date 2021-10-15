package org.agrisud.elearningAPI.dao;

import org.agrisud.elearningAPI.model.Course;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Sql(scripts = {"classpath:dao/course-test.sql"},
        config = @SqlConfig(encoding = "utf-8", transactionMode = SqlConfig.TransactionMode.ISOLATED))
public class CourseDaoTest {

    @Autowired
    CourseDao courseDao;

//    @Test
//    public void shouldReturnEvents() {
//        List<Course> events = courseDao.getCourses();
//        assertThat(events).isNotEmpty();
//        assertThat(events).hasSize(3);
//    }

}
