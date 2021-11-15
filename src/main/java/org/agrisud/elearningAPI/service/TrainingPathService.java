package org.agrisud.elearningAPI.service;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.dao.*;
import org.agrisud.elearningAPI.dto.*;
import org.agrisud.elearningAPI.enums.SortColumn;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.security.User;
import org.agrisud.elearningAPI.util.DurationGenerator;
import org.agrisud.elearningAPI.util.TemplateGenerationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Service
@Slf4j
public class TrainingPathService {
    @Autowired
    private TrainingPathDao trainingPathDao;
    @Autowired
    UserDao userDao;
    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;
    @Autowired
    private ModuleDao moduleDao;
    @Autowired
    private CourseDao courseDao;

    public List<TrainingPath> getTrainingPathList() {
        return this.trainingPathDao.getTrainingPathList();
    }

    public Page<TrainingPath> getTrainingPathListPerPageByOrder(int page, int size, String language, SortColumn sortColumn, Boolean asc, Boolean archived) {
        if (asc) {
            return trainingPathDao.getTrainingPathListPerPageByOrderASC(page, size, language, sortColumn, archived);
        } else {
            return trainingPathDao.getTrainingPathListPerPageByOrderDESC(page, size, language, sortColumn, archived);
        }
    }

    public Page<TrainingPath> getTrainingPathListPerPage(int page, int size, String language, Boolean archived) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return this.trainingPathDao.getTrainingPathListPerPage(pageRequest, language, archived);
    }

    public Optional<TrainingPath> getTrainingPathByID(Long trainingPathId) {
        return this.trainingPathDao.getTrainingPathById(trainingPathId);
    }

    public long createNewTrainingPath(TrainingPathCreationDto trainingPathCreationDto) {
        long trainingPathID = this.trainingPathDao.createNewTrainingPath(getTrainingPathEntity(trainingPathCreationDto.getTrainingPathDto()));

        trainingPathCreationDto.getTrainingPathTranslationDto().forEach(trainingPathTranslationDto -> {
            trainingPathTranslationDto.setTrainingPathID(trainingPathID);
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
        });
        return trainingPathID;
    }

    public void updateTrainingPath(TrainingPath trainingPath) {
        this.trainingPathDao.updateTrainingPath(trainingPath);
    }

    public void deleteTrainingPath(Long trainingPathId) {
        this.trainingPathDao.deleteTrainingPath(trainingPathId);
    }

    public Page<TrainingPath> getTrainingPathListByUser(int page, int size, String language, Boolean archived) {
        PageRequest pageRequest = PageRequest.of(page, size);
        User loggedInUser = User.getLoggedInUser();
        return this.trainingPathDao.getTrainingPathListByUser(pageRequest, loggedInUser.getUserId(), language, archived);
    }

    public Page<TrainingPath> getTrainingPathListNotUsers(int page, int size, String language, Boolean archived) {
        PageRequest pageRequest = PageRequest.of(page, size);
        User loggedInUser = User.getLoggedInUser();
        return this.trainingPathDao.getTrainingPathListNotUsers(pageRequest, loggedInUser.getUserId(), language, archived);
    }

    public void addTrainingPathToUser(Long trainingPathId) {
        User loggedInUser = User.getLoggedInUser();
        log.info(loggedInUser.getUserId() != null ? loggedInUser.getUserId() : "Nada");
        userDao.addTrainingPathToUser(trainingPathId, loggedInUser.getUserId());
    }

    private TrainingPath getTrainingPathEntity(TrainingPathDto trainingPathDto) {
        return TrainingPath.builder().imageUrl(trainingPathDto.getImageUrl())
                .fullImagePath(trainingPathDto.getFullImagePath())
                .status(false).archived(false).build();
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

    public void duplicateTrainingPath(Long trainingPathId) {
        trainingPathDao.getTrainingPathById(trainingPathId).ifPresent(trainingPath -> {
            TrainingPathDto trainingPathDto = TrainingPathDto.builder().imageUrl(trainingPath.getImageUrl())
                    .fullImagePath(trainingPath.getFullImagePath())
                    .archived(trainingPath.getArchived())
                    .build();
            List<TrainingPathTranslationDto> trainingPathTranslationDtos = trainingPathTranslationDao.getTrainingPathTranslationListByTrainingPathID(trainingPathId)
                    .stream().map(tpt -> {
                        List<Module> modules = moduleDao.getModuleListByTrainingPathTranslationID(tpt.getId());
                        List<ModuleDto> moduleDtos = modules.stream().map(module -> {
                            List<Course> courses = courseDao.getCoursesByModule(module.getId());
                            List<CourseDto> courseDtos = courses.stream().map(CourseDto::new).collect(Collectors.toList());
                            return new ModuleDto(module, courseDtos);
                        }).collect(Collectors.toList());
                        return new TrainingPathTranslationDto(tpt, moduleDtos);
                    }).collect(Collectors.toList());

            TrainingPathCreationDto trainingPathCreationDto = TrainingPathCreationDto.builder().trainingPathDto(trainingPathDto)
                    .trainingPathTranslationDto(trainingPathTranslationDtos)
                    .build();
            trainingPathCreationDto.getTrainingPathTranslationDto().forEach(tpc ->
                    tpc.setTitle(tpc.getTitle().concat(" ").concat("(bis)"))
            );
            createNewTrainingPath(trainingPathCreationDto);
        });
        trainingPathDao.deprecateTrainingPath(trainingPathId);
    }
}
