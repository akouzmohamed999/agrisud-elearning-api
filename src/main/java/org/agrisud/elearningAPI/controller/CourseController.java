package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.cloudservice.CourseCloudService;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/course")
public class CourseController {

    @Autowired
    CourseService courseService;

    @Autowired
    CourseCloudService courseCloudService;

    @GetMapping
    public List<Course> getEvents() {
        return courseService.getEvents();
    }

    @GetMapping("/files")
    public List<String> getFiles() {
        return courseCloudService.getFolders();
    }
}
