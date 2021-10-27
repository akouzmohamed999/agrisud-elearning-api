package org.agrisud.elearningAPI.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.agrisud.elearningAPI.enums.CourseType;
import org.agrisud.elearningAPI.model.Course;

@Getter
@Setter
@Builder
public class CourseDto {
    private Long id;
    private String title;
    private int courseHours;
    private int courseMinutes;
    private String supportUrl;
    private String supportPath;
    private CourseType courseType;
    private Long moduleId;

    public CourseDto(Course course) {
        this.title = course.getTitle();
        this.courseHours = course.getCourseHours();
        this.courseMinutes = course.getCourseMinutes();
        this.supportUrl = course.getSupportUrl();
        this.supportPath = course.getSupportPath();
        this.courseType = course.getCourseType();
        this.moduleId = course.getModuleId();
    }
}
