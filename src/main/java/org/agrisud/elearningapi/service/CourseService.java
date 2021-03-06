package org.agrisud.elearningapi.service;

import org.agrisud.elearningapi.dao.CourseDao;
import org.agrisud.elearningapi.dao.ModuleDao;
import org.agrisud.elearningapi.dao.TrainingPathTranslationDao;
import org.agrisud.elearningapi.dao.UserDao;
import org.agrisud.elearningapi.dto.CourseDto;
import org.agrisud.elearningapi.dto.ModuleDto;
import org.agrisud.elearningapi.dto.TrainingPathTranslationDto;
import org.agrisud.elearningapi.model.Course;
import org.agrisud.elearningapi.model.Module;
import org.agrisud.elearningapi.model.TrainingPathTranslation;
import org.agrisud.elearningapi.security.User;
import org.agrisud.elearningapi.util.DurationGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CourseService {
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private ModuleDao moduleDao;
    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;
    @Autowired
    private UserDao userDao;

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
        Long trainingPathTranslationID = moduleDao.getModuleById(course.getModuleId()).orElseThrow(() -> new RuntimeException("Module not found"))
                .getTrainingPathTranslationID();
        updateTrainingPathDuration(trainingPathTranslationID);
        updateModuleDuration(course);
        return courseID;
    }

    public void createCourseList(List<Course> courses) {
        this.courseDao.createCoursesList(courses);
    }

    public void updateCourse(Course course) {
        this.courseDao.updateCourse(course);
        Long trainingPathTranslationID = moduleDao.getModuleById(course.getModuleId()).orElseThrow(() -> new RuntimeException("Module not found"))
                .getTrainingPathTranslationID();
        updateTrainingPathDuration(trainingPathTranslationID);
        updateModuleDuration(course);
    }

    public void deleteCourse(Long courseID) {
        this.courseDao.getCoursesByID(courseID).ifPresent(course -> {
            this.courseDao.deleteCourseUserStatus(courseID);
            this.courseDao.deleteCourse(courseID);
            Long trainingPathTranslationID = moduleDao.getModuleById(course.getModuleId()).orElseThrow(() -> new RuntimeException("Module not found"))
                    .getTrainingPathTranslationID();
            updateTrainingPathDuration(trainingPathTranslationID);
            updateModuleDuration(course);
        });
    }

    public void deleteCourseByModule(Long moduleID) {
        this.courseDao.getCoursesByModule(moduleID).forEach(course -> {
            courseDao.deleteCourseUserStatus(course.getId());
        });
        this.courseDao.deleteCourseByModule(moduleID);
    }

    public void addCourseToUser(Long courseID) {
        User loggedInUser = User.getLoggedInUser();
        if (isThisLastCourse(courseID)) {
            userDao.addEndTrainingPathDate(getTrainingPathID(courseID), loggedInUser.getUserId());
        }
        this.courseDao.addCourseToUser(courseID);
    }

    private boolean isThisLastCourse(Long courseID) {
        Optional<Course> course = courseDao.getCoursesByID(courseID);
        String errorMessage = "Error while testing if this" + courseID + "is the last course";
        return course.map(course1 -> {
            Optional<Module> module = moduleDao.getModuleById(course1.getModuleId());
            return module.map(module1 -> {
                List<Module> modules = moduleDao.getModuleListByTrainingPathTranslationID(module1.getTrainingPathTranslationID());
                List<Course> courseList = courseDao.getCoursesByModule(module1.getId());
                return module1.getOrderOnPath() == modules.size() &&
                        courseList.stream().allMatch(course2 -> course2.getId() <= courseID);
            }).orElseThrow(() -> new RuntimeException(errorMessage));
        }).orElseThrow(() -> new RuntimeException(errorMessage));
    }

    private long getTrainingPathID(Long courseID) {
        Optional<Course> course = courseDao.getCoursesByID(courseID);
        String errorMessage = "Error while getting training-path ID";
        return course.map(course1 -> {
            Optional<Module> module = moduleDao.getModuleById(course1.getModuleId());
            return module.map(module1 -> {
                Optional<TrainingPathTranslation> trainingPathTranslation = trainingPathTranslationDao.getTrainingPathTranslationById(module1.getTrainingPathTranslationID());
                return trainingPathTranslation.map(TrainingPathTranslation::getTrainingPathID).orElseThrow(() -> new RuntimeException(errorMessage));
            }).orElseThrow(() -> new RuntimeException(errorMessage));
        }).orElseThrow(() -> new RuntimeException(errorMessage));
    }

    public Boolean isModuleFinished(Long moduleID) {
        return this.courseDao.isModuleFinished(moduleID);
    }

    private void updateModuleDuration(Course course) {
        moduleDao.getModuleById(course.getModuleId()).ifPresent(module -> {
            moduleDao.updateDuration(module.getId(), DurationGenerator.getModuleDuration(getModuleDto(module, getCourseDtoList(module.getId()))));
        });
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

    public Boolean isCourseFinished(Long courseId) {
        return this.courseDao.isCourseFinished(courseId);
    }
}
