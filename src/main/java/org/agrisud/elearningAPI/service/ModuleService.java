package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.ModuleDao;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ModuleService {

    @Autowired
    private ModuleDao moduleDao;
    @Autowired
    private CourseService courseService;
    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;

    public List<Module> getModuleList() {
        return moduleDao.getModuleList();
    }

    public List<Module> getModuleListByTrainingPathTranslationID(Long trainingPathTranslationID) {
        return this.moduleDao.getModuleListByTrainingPathTranslationID(trainingPathTranslationID);
    }

    public Page<Module> getModuleListByTrainingPathTranslationIDPerPage(Long trainingPathTranslationID, int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return this.moduleDao.getModuleListByTrainingPathTranslationIDPerPage(trainingPathTranslationID, pageRequest);
    }

    public Optional<Module> getModuleById(Long moduleID) {
        return this.moduleDao.getModuleById(moduleID);
    }

    public long createNewModule(Module module) {
        return this.moduleDao.createNewModule(module);
    }

    public void updateModule(Module module) {
        this.moduleDao.updateModule(module);
    }

    public void deleteModule(Long moduleID) {
        moduleDao.getModuleById(moduleID).ifPresent(moduleDto -> {
            this.courseService.deleteCourseByModule(moduleID);
            this.moduleDao.deleteModule(moduleID);
            updateDuration(moduleDto.getTrainingPathTranslationID());
        });
    }

    public void deleteModuleByTrainingPathTranslationID(Long trainingPathTranslationID) {
        this.moduleDao.deleteModulesByTrainingPathTranslationID(trainingPathTranslationID);
    }

    public void updateDuration(Long moduleId, String courseTimeString) {
        this.moduleDao.updateDuration(moduleId,courseTimeString);
    }

    private void updateDuration(long trainingPathTranslationID) {
        List<Module> modules = moduleDao.getModuleListByTrainingPathTranslationID(trainingPathTranslationID);
        int hours = modules.stream().map(module ->
                courseService.getCoursesByModule(module.getId()).stream().map(Course::getCourseHours)
                        .reduce(0, Integer::sum)).reduce(0, Integer::sum);
        int minutes = modules.stream().map(module ->
                courseService.getCoursesByModule(module.getId()).stream().map(Course::getCourseMinutes)
                        .reduce(0, Integer::sum)).reduce(0, Integer::sum);
        hours += minutes / 60;
        minutes = minutes % 60;
        trainingPathTranslationService.updateDuration(trainingPathTranslationID, getCourseTimeString(hours, minutes));
    }

    private String getCourseTimeString(int courseHours, int courseMinutes) {
        if (courseHours == 0) {
            return courseMinutes + " min ";
        } else if (courseMinutes == 0) {
            return courseMinutes + " h ";
        } else {
            return courseHours + " h " + courseMinutes + " min ";
        }
    }
}
