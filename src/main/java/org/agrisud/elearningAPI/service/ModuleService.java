package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.CourseDao;
import org.agrisud.elearningAPI.dao.ModuleDao;
import org.agrisud.elearningAPI.dao.TrainingPathTranslationDao;
import org.agrisud.elearningAPI.dto.CourseDto;
import org.agrisud.elearningAPI.dto.ModuleDto;
import org.agrisud.elearningAPI.dto.TrainingPathTranslationDto;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.util.DurationGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ModuleService {

    @Autowired
    private ModuleDao moduleDao;
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;

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
            this.courseDao.deleteCourseByModule(moduleID);
            this.moduleDao.deleteModule(moduleID);
            updateTrainingPathDuration(moduleDto.getTrainingPathTranslationID());
        });
    }

    public void deleteModuleByTrainingPathTranslationID(Long trainingPathTranslationID) {
        this.moduleDao.deleteModulesByTrainingPathTranslationID(trainingPathTranslationID);
    }

    private void updateTrainingPathDuration(Long trainingPathTranslationID) {
        TrainingPathTranslation trainingPathTranslation = trainingPathTranslationDao.getTrainingPathTranslationById(trainingPathTranslationID)
                .orElseThrow(() -> new RuntimeException("Training Path not found"));

        List<ModuleDto> moduleDtoList = moduleDao.getModuleListByTrainingPathTranslationID(trainingPathTranslationID)
                .stream().map(module1 -> getModuleDto(module1, getCourseDtoList(module1.getId()))).collect(Collectors.toList());

        TrainingPathTranslationDto trainingPathTranslationDto = getTrainingPathTranslationDto(trainingPathTranslation, moduleDtoList);

        trainingPathTranslationDao.updateDuration(trainingPathTranslationID, DurationGenerator.getTrainingPathDuration(trainingPathTranslationDto));
    }

    private List<CourseDto> getCourseDtoList(Long ModuleID) {
        return courseDao.getCoursesByModule(ModuleID).stream().map(this::getCourseDto).collect(Collectors.toList());
    }

    private TrainingPathTranslationDto getTrainingPathTranslationDto(TrainingPathTranslation trainingPathTranslation, List<ModuleDto> moduleDtoList) {
        return TrainingPathTranslationDto.builder().id(trainingPathTranslation.getId()).title(trainingPathTranslation.getTitle())
                .trainingPathID(trainingPathTranslation.getTrainingPathID()).description(trainingPathTranslation.getDescription())
                .language(trainingPathTranslation.getLanguage()).capacity(trainingPathTranslation.getCapacity()).preRequest(trainingPathTranslation.getPreRequest())
                .trainingPathDuration(trainingPathTranslation.getTrainingPathDuration()).moduleList(moduleDtoList).build();
    }

    private ModuleDto getModuleDto(Module module, List<CourseDto> courseDtoList) {
        return ModuleDto.builder().id(module.getId()).title(module.getTitle()).moduleDuration(module.getModuleDuration())
                .courseDtoList(courseDtoList).trainingPathTranslationID(module.getTrainingPathTranslationID())
                .orderOnPath(module.getOrderOnPath()).build();
    }

    private CourseDto getCourseDto(Course course) {
        return CourseDto.builder().courseHours(course.getCourseHours()).courseType(course.getCourseType()).courseMinutes(course.getCourseMinutes())
                .id(course.getId()).supportPath(course.getSupportPath()).supportUrl(course.getSupportUrl()).title(course.getTitle())
                .moduleId(course.getModuleId()).build();
    }
}
