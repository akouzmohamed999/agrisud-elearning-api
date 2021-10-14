package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.CourseDao;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
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
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;

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
        long courseID = this.courseDao.createNewCourse(course);
        updateDuration(course.getModuleId());
        return courseID;
    }

    public void updateCourse(Course course) {
        this.courseDao.updateCourse(course);
        updateDuration(course.getModuleId());
    }

    public void deleteCourse(Long courseID) {
        this.courseDao.getCoursesByID(courseID).ifPresent(course -> {
            this.courseDao.deleteCourse(courseID);
            updateDuration(course.getModuleId());
        });
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

    private void updateDuration(Long moduleID) {
        moduleService.getModuleById(moduleID).ifPresent(moduleDto -> {
            Long trainingPathTranslationID = moduleDto.getTrainingPathTranslationID();
            List<Module> modules = moduleService.getModuleListByTrainingPathTranslationID(trainingPathTranslationID);
            int hours = modules.stream().map(module ->
                    courseDao.getCoursesByModule(module.getId()).stream().map(Course::getCourseHours)
                            .reduce(0, Integer::sum)).reduce(0, Integer::sum);
            int minutes = modules.stream().map(module ->
                    courseDao.getCoursesByModule(module.getId()).stream().map(Course::getCourseMinutes)
                            .reduce(0, Integer::sum)).reduce(0, Integer::sum);
            hours += minutes / 60;
            minutes = minutes % 60;

            trainingPathTranslationService.updateDuration(trainingPathTranslationID, getCourseTimeString(hours, minutes));
            List<Course> courses = courseDao.getCoursesByModule(moduleID);
            int moduleHours = courses.stream().map(Course::getCourseHours).reduce(0, Integer::sum);
            int moduleMinutes = courses.stream().map(Course::getCourseMinutes).reduce(0, Integer::sum);
            moduleHours += moduleMinutes / 60;
            moduleMinutes = moduleMinutes % 60;
            moduleService.updateDuration(moduleID, getCourseTimeString(moduleHours, moduleMinutes));
        });
    }

    private String getCourseTimeString(int courseHours, int courseMinutes) {
        if (courseHours == 0) {
            return courseMinutes + " min ";
        } else if (courseMinutes == 0) {
            return courseHours + " h ";
        } else {
            return courseHours + " h " + courseMinutes + " min ";
        }
    }
}
