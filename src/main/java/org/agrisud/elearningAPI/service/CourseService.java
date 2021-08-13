package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.CourseDao;
import org.agrisud.elearningAPI.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    CourseDao courseDao;

    public List<Course> getEvents() {
        return courseDao.getCourses();
    }
}
