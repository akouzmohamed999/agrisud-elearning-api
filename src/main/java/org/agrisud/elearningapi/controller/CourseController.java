package org.agrisud.elearningapi.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningapi.cloudservice.FileCloudService;
import org.agrisud.elearningapi.dto.FileDto;
import org.agrisud.elearningapi.enums.CourseType;
import org.agrisud.elearningapi.enums.SupportMode;
import org.agrisud.elearningapi.model.Course;
import org.agrisud.elearningapi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Slf4j
@RestController
@RequestMapping("/course")
public class CourseController {
    public static final String PAGE = "0";
    public static final String SIZE = "10";
    @Autowired
    private CourseService courseService;
    @Autowired
    private FileCloudService fileCloudService;

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
        this.courseService.getCoursesByID(courseID).ifPresent(course -> {
            if (course.getCourseType() != CourseType.VIDEO) {
                this.fileCloudService.deleteFile(course.getSupportPath());
            }
            this.courseService.deleteCourse(courseID);
        });
    }

    @DeleteMapping("/ByModule/{moduleID}")
    public void deleteCourseByModule(@PathVariable Long moduleID) {
        this.courseService.getCoursesByModule(moduleID).forEach(course -> this.fileCloudService.deleteFile(course.getSupportPath()));
        this.courseService.deleteCourseByModule(moduleID);
    }

    @PostMapping("/AddCourse/{courseID}")
    public void addCourseToUser(@PathVariable Long courseID) {
        this.courseService.addCourseToUser(courseID);
    }

    @GetMapping("/isModuleFinished/{moduleID}")
    public ResponseEntity<Boolean> isModuleFinished(@PathVariable Long moduleID) {
        Boolean finished = this.courseService.isModuleFinished(moduleID);
        return ResponseEntity.ok().body(finished);
    }

    @GetMapping("/isCourseFinished/{courseId}")
    public ResponseEntity<Boolean> isCourseFinished(@PathVariable Long courseId) {
        Boolean finished = this.courseService.isCourseFinished(courseId);
        return ResponseEntity.ok().body(finished);
    }

    @PostMapping(value = "/support", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public FileDto uploadCourseSupport(@RequestParam MultipartFile support) {
        log.info("Starting .....");
        return this.fileCloudService.uploadFile(support, SupportMode.PDF);
    }

    @DeleteMapping("/support")
    public void deleteCourseSupport(@RequestParam String filePath) {
        this.fileCloudService.deleteFile(filePath);
    }
}
