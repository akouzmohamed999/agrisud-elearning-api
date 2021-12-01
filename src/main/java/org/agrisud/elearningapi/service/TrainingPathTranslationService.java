package org.agrisud.elearningapi.service;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningapi.dao.CourseDao;
import org.agrisud.elearningapi.dao.ModuleDao;
import org.agrisud.elearningapi.dao.TrainingPathDao;
import org.agrisud.elearningapi.dao.TrainingPathTranslationDao;
import org.agrisud.elearningapi.dto.*;
import org.agrisud.elearningapi.enums.Language;
import org.agrisud.elearningapi.model.Course;
import org.agrisud.elearningapi.model.Module;
import org.agrisud.elearningapi.model.TrainingPath;
import org.agrisud.elearningapi.model.TrainingPathTranslation;
import org.agrisud.elearningapi.util.DurationGenerator;
import org.agrisud.elearningapi.util.TemplateGenerationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
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

    public long createNewTrainingPathTranslation(TrainingPathCreationDto trainingPathCreationDto) {
        TrainingPathTranslationDto trainingPathTranslationDto = trainingPathCreationDto.getTrainingPathTranslationDto().get(0);
        long trainingPathTranslationID = this.trainingPathTranslationDao.createNewTrainingPathTranslation(
                getTrainingPathTranslationEntity(trainingPathTranslationDto, trainingPathCreationDto.getTrainingPathDto()));

        AtomicInteger order = new AtomicInteger(1);
        trainingPathTranslationDto.getModuleList().forEach(moduleDto -> {
            moduleDto.setTrainingPathTranslationID(trainingPathTranslationID);
            long moduleID = this.moduleDao.createNewModule(getModuleEntity(moduleDto, order.getAndIncrement()));
            List<Course> courseList = moduleDto.getCourseDtoList().stream().map(courseDto -> {
                courseDto.setModuleId(moduleID);
                return getCourseEntity(courseDto);
            }).collect(Collectors.toList());

            courseDao.createCoursesList(courseList);
        });

        return trainingPathTranslationID;
    }

    private TrainingPathTranslation getTrainingPathTranslationEntity(TrainingPathTranslationDto trainingPathTranslationDto, TrainingPathDto trainingPathDto) {
        return TrainingPathTranslation.builder()
                .title(trainingPathTranslationDto.getTitle())
                .description(trainingPathTranslationDto.getDescription())
                .preRequest(trainingPathTranslationDto.getPreRequest())
                .language(trainingPathTranslationDto.getLanguage())
                .capacity(trainingPathTranslationDto.getCapacity())
                .trainingPathDuration(DurationGenerator.getTrainingPathDuration(trainingPathTranslationDto))
                .trainingPathID(trainingPathTranslationDto.getTrainingPathID()).template(TemplateGenerationHelper.generateTrainingPathTemplate(trainingPathDto, trainingPathTranslationDto)).build();
    }

    private Module getModuleEntity(ModuleDto moduleDto, int order) {
        return Module.builder().title(moduleDto.getTitle()).orderOnPath(order)
                .moduleDuration(DurationGenerator.getModuleDuration(moduleDto)).trainingPathTranslationID(moduleDto.getTrainingPathTranslationID()).build();
    }

    private Course getCourseEntity(CourseDto courseDto) {
        return Course.builder().title(courseDto.getTitle()).courseHours(courseDto.getCourseHours())
                .courseMinutes(courseDto.getCourseMinutes()).courseType(courseDto.getCourseType())
                .supportUrl(courseDto.getSupportUrl()).supportPath(courseDto.getSupportPath()).moduleId(courseDto.getModuleId()).build();
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
                .supportPath(trainingPathTranslation.getSupportPath()).supportUrl(trainingPathTranslation.getSupportUrl())
                .language(trainingPathTranslation.getLanguage()).capacity(trainingPathTranslation.getCapacity()).preRequest(trainingPathTranslation.getPreRequest())
                .trainingPathDuration(trainingPathTranslation.getTrainingPathDuration()).moduleList(moduleDtoList).build();
    }

    private TrainingPathTranslationDto getTrainingPathTranslationDto(TrainingPathTranslation trainingPathTranslation) {
        List<Module> modules = moduleDao.getModuleListByTrainingPathTranslationID(trainingPathTranslation.getId());
        return new TrainingPathTranslationDto(trainingPathTranslation, modules.stream().map(ModuleDto::new).collect(Collectors.toList()));
    }
}
