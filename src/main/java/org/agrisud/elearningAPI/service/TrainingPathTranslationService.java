package org.agrisud.elearningAPI.service;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.dao.CourseDao;
import org.agrisud.elearningAPI.dao.ModuleDao;
import org.agrisud.elearningAPI.dao.TrainingPathDao;
import org.agrisud.elearningAPI.dao.TrainingPathTranslationDao;
import org.agrisud.elearningAPI.dto.CourseDto;
import org.agrisud.elearningAPI.dto.ModuleDto;
import org.agrisud.elearningAPI.dto.TrainingPathDto;
import org.agrisud.elearningAPI.dto.TrainingPathTranslationDto;
import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.util.TemplateGenerationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
public class TrainingPathTranslationService {
    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;
    @Autowired
    private TrainingPathDao trainingPathDao;
    @Autowired
    private ModuleDao moduleDao;
    @Autowired
    private CourseDao courseDao;

    public List<TrainingPathTranslation> getTrainingPathTranslationList() {
        return trainingPathTranslationDao.getTrainingPathTranslationList();
    }

    public List<TrainingPathTranslationDto> getTrainingPathTranslationListByTrainingPathID(Long trainingPathID) {
        List<TrainingPathTranslation> trainingPathTranslationList = this.trainingPathTranslationDao.getTrainingPathTranslationListByTrainingPathID(trainingPathID);
        return trainingPathTranslationList.stream().map(trainingPathTranslation -> {
            List<Module> moduleList = moduleDao.getModuleListByTrainingPathTranslationID(trainingPathTranslation.getId());
            List<ModuleDto> moduleDtoList = moduleList.stream().map(module -> {
                List<Course> courses = courseDao.getCoursesByModule(module.getId());
                List<CourseDto> courseDtoList = courses.stream().map(this::getCourseDto).collect(Collectors.toList());
                return getModuleDto(module, courseDtoList);
            }).collect(Collectors.toList());
            return getTrainingPathTranslationDto(trainingPathTranslation, moduleDtoList);
        }).collect(Collectors.toList());
    }

    public Optional<TrainingPathTranslation> getTrainingPathTranslationById(Long trainingPathTranslationID) {
        return this.trainingPathTranslationDao.getTrainingPathTranslationById(trainingPathTranslationID);
    }

    public long createNewTrainingPathTranslation(TrainingPathTranslation trainingPathTranslation) {
        return this.trainingPathTranslationDao.createNewTrainingPathTranslation(trainingPathTranslation);
    }

    public void updateTrainingPathTranslation(TrainingPathTranslation trainingPathTranslation) {
        TrainingPathTranslationDto trainingPathTranslationDto = getTrainingPathTranslationDto(trainingPathTranslation);
        TrainingPath trainingPath = trainingPathDao.getTrainingPathById(trainingPathTranslation.getTrainingPathID()).orElseThrow(() -> new RuntimeException("Training Path not found"));
        TrainingPathDto trainingPathDto = TrainingPathDto.builder().imageUrl(trainingPath.getImageUrl()).build();
        trainingPathTranslation.setTemplate(TemplateGenerationHelper.generateTrainingPathTemplate(trainingPathDto, trainingPathTranslationDto));
        this.trainingPathTranslationDao.updateTrainingPathTranslation(trainingPathTranslation);
    }

    public void deleteTrainingPathTranslation(Long trainingPathTranslationID) {
        this.trainingPathTranslationDao.deleteTrainingPathTranslation(trainingPathTranslationID);
    }

    public void deleteTrainingPathTranslationByTrainingPathID(Long trainingPathID) {
        this.trainingPathTranslationDao.deleteTrainingPathTranslationByTrainingPathID(trainingPathID);
    }

    public void updateTrainingPathTranslationTemplate(Long trainingPathTranslationId, String content) {
        trainingPathTranslationDao.updateTrainingPathTranslationTemplate(trainingPathTranslationId, content);
    }

    public String getTrainingPathTranslationTemplate(Long trainingPathTranslationId) {
        return trainingPathTranslationDao.getTrainingPathTranslationTemplate(trainingPathTranslationId);
    }

    public String getTrainingPathTranslationTemplate(Long trainingPathId, Language currentLang) {
        return trainingPathTranslationDao.getTrainingPathTranslationTemplate(trainingPathId, currentLang);
    }

    private CourseDto getCourseDto(Course course) {
        return CourseDto.builder().courseHours(course.getCourseHours()).courseType(course.getCourseType()).courseMinutes(course.getCourseMinutes())
                .id(course.getId()).supportPath(course.getSupportPath()).supportUrl(course.getSupportUrl()).title(course.getTitle())
                .moduleId(course.getModuleId()).build();
    }

    private ModuleDto getModuleDto(Module module, List<CourseDto> courseDtoList) {
        return ModuleDto.builder().id(module.getId()).title(module.getTitle()).moduleDuration(module.getModuleDuration())
                .courseDtoList(courseDtoList).trainingPathTranslationID(module.getTrainingPathTranslationID())
                .orderOnPath(module.getOrderOnPath()).build();
    }

    private TrainingPathTranslationDto getTrainingPathTranslationDto(TrainingPathTranslation trainingPathTranslation, List<ModuleDto> moduleDtoList) {
        return TrainingPathTranslationDto.builder().id(trainingPathTranslation.getId()).title(trainingPathTranslation.getTitle())
                .trainingPathID(trainingPathTranslation.getTrainingPathID()).description(trainingPathTranslation.getDescription())
                .language(trainingPathTranslation.getLanguage()).capacity(trainingPathTranslation.getCapacity()).preRequest(trainingPathTranslation.getPreRequest())
                .trainingPathDuration(trainingPathTranslation.getTrainingPathDuration()).moduleList(moduleDtoList).build();
    }

    private TrainingPathTranslationDto getTrainingPathTranslationDto(TrainingPathTranslation trainingPathTranslation) {
        return TrainingPathTranslationDto.builder()
                .description(trainingPathTranslation.getDescription())
                .preRequest(trainingPathTranslation.getPreRequest())
                .build();
    }
}
