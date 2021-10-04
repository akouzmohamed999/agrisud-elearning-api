package org.agrisud.elearningAPI.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.cloudservice.CourseCloudService;
import org.agrisud.elearningAPI.dto.FileDto;
import org.agrisud.elearningAPI.enums.CourseType;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.service.CourseService;
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
        return this.courseService.createNewCourse(course);
    }

    @PutMapping
    public void updateCourse(@RequestBody Course course) {
        this.courseService.updateCourse(course);
    }

    @DeleteMapping("/{courseID}")
    public void deleteCourse(@PathVariable Long courseID) {
        this.courseService.getCoursesByID(courseID).ifPresent(course ->this.courseCloudService.deleteCourseSupport(course.getSupportPath()));
        this.courseService.deleteCourse(courseID);
    }

    @DeleteMapping("/ByModule/{moduleID}")
    public void deleteCourseByModule(@PathVariable Long moduleID) {
        this.courseService.getCoursesByModule(moduleID).forEach(course -> this.courseCloudService.deleteCourseSupport(course.getSupportPath()));
        this.courseService.deleteCourseByModule(moduleID);
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
}
