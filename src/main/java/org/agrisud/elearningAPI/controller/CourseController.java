package org.agrisud.elearningAPI.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.cloudservice.CourseCloudService;
import org.agrisud.elearningAPI.dto.FileDto;
import org.agrisud.elearningAPI.enums.CourseType;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.service.CourseService;
import org.agrisud.elearningAPI.service.ModuleService;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@Slf4j
@RestController
@RequestMapping("/course")
public class CourseController {
    public static final String PAGE = "0";
    public static final String SIZE = "10";

    @Autowired
    private CourseService courseService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;

    @Autowired
    private CourseCloudService courseCloudService;

    @GetMapping("/ByModule/PerPage/{moduleID}")
    public Page<Course> getCoursesByModulePerPage(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                  @RequestParam(name = "size", defaultValue = SIZE) int size,
                                                  @PathVariable Long moduleID) {
        return this.courseService.getCoursesByModulePerPage(page, size, moduleID);
    }

    @GetMapping("/ByModule/{moduleID}")
    public List<Course> getCoursesByModule(@PathVariable Long moduleID) {
        return this.courseService.getCoursesByModule(moduleID);
    }

    @GetMapping("/{courseID}")
    public Optional<Course> getCoursesByID(@PathVariable Long courseID) {
        return this.courseService.getCoursesByID(courseID);
    }

    @PostMapping
    public long createNewCourse(@RequestBody Course course) {
        long courseID = this.courseService.createNewCourse(course);
        UpdateDuration(course.getModuleId());
        return courseID;
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

    @PutMapping
    public void updateCourse(@RequestBody Course course) {
        this.courseService.updateCourse(course);
        UpdateDuration(course.getModuleId());
    }

    @DeleteMapping("/{courseID}")
    public void deleteCourse(@PathVariable Long courseID) {
        this.courseService.getCoursesByID(courseID).ifPresent(course -> {
            if (course.getCourseType() != CourseType.VIDEO) {
                this.courseCloudService.deleteCourseSupport(course.getSupportPath());
            }
            this.courseService.deleteCourse(courseID);
            UpdateDuration(course.getModuleId());
        });
    }

    @DeleteMapping("/ByModule/{moduleID}")
    public void deleteCourseByModule(@PathVariable Long moduleID) {
        this.courseService.getCoursesByModule(moduleID).forEach(course -> this.courseCloudService.deleteCourseSupport(course.getSupportPath()));
        this.courseService.deleteCourseByModule(moduleID);
        UpdateDuration(moduleID);
    }

    @PostMapping("/AddCourse/{courseID}")
    public void addCourseToUser(@PathVariable Long courseID) {
        this.courseService.addCourseToUser(courseID);
    }

    @PostMapping("/AddCourse/{moduleID}")
    public ResponseEntity<Boolean> isModuleFinished(@PathVariable Long moduleID) {
        Boolean finished = this.courseService.isModuleFinished(moduleID);
        return ResponseEntity.ok().body(finished);
    }

    @PostMapping(value = "/support/{supportType}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public AtomicReference<FileDto> uploadCourseSupport(@RequestParam MultipartFile support, @PathVariable String supportType) {
        log.info("Starting .....");
        return this.courseCloudService.uploadCourseSupport(support, CourseType.valueOf(supportType));
    }

    @DeleteMapping("/support")
    public void deleteCourseSupport(@RequestParam String filePath) {
        this.courseCloudService.deleteCourseSupport(filePath);
    }

    private void UpdateDuration(long moduleID) {
        moduleService.getModuleById(moduleID).ifPresent(moduleDto -> {
            long trainingPathTranslationID = moduleDto.getTrainingPathTranslationID();
            List<Module> modules = moduleService.getModuleListByTrainingPathTranslationID(trainingPathTranslationID);
            int hours = modules.stream().map(module ->
                    courseService.getCoursesByModule(module.getId()).stream().map(Course::getCourseHours)
                            .reduce(0, Integer::sum)).reduce(0, Integer::sum);
            int minutes = modules.stream().map(module ->
                    courseService.getCoursesByModule(module.getId()).stream().map(Course::getCourseMinutes)
                            .reduce(0, Integer::sum)).reduce(0, Integer::sum);
            hours += minutes / 60;
            minutes = minutes % 60;
            trainingPathTranslationService.updateDuration(trainingPathTranslationID, getCourseTimeString(hours, minutes));

            List<Course> courses = courseService.getCoursesByModule(moduleID);
            int moduleHours = courses.stream().map(Course::getCourseHours).reduce(0, Integer::sum);
            int moduleMinutes = courses.stream().map(Course::getCourseMinutes).reduce(0, Integer::sum);
            moduleHours += moduleMinutes / 60;
            moduleMinutes = moduleMinutes % 60;
            moduleService.updateDuration(moduleID, getCourseTimeString(moduleHours, moduleMinutes));
        });

    }
}
