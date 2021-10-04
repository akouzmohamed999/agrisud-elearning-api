package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.CourseDao;
import org.agrisud.elearningAPI.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseService {

    @Autowired
    private CourseDao courseDao;

    public Page<Course> getCoursesByModulePerPage(int page, int size, Long moduleID) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return this.courseDao.getCoursesByModulePerPage(pageRequest, moduleID);
    }

    public List<Course> getCoursesByModule(Long moduleID) {
        return this.courseDao.getCoursesByModule(moduleID);
    }

    public Optional<Course> getCoursesByID(Long courseID) {
        return this.courseDao.getCoursesByID(courseID);
    }

    public long createNewCourse(Course course) {
        return this.courseDao.createNewCourse(course);
    }

    public void updateCourse(Course course) {
        this.courseDao.updateCourse(course);
    }

    public void deleteCourse(Long courseID) {
        this.courseDao.deleteCourse(courseID);

    }

    public void deleteCourseByModule(Long moduleID) {
        this.courseDao.deleteCourseByModule(moduleID);
    }

    public void addCourseToUser(Long courseID) {
        this.courseDao.addCourseToUser(courseID);
    }

    public boolean isModuleFinished(Long moduleID) {
        return this.courseDao.isModuleFinished(moduleID);
    }
}
