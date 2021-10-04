package org.agrisud.elearningAPI.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.agrisud.elearningAPI.enums.CourseType;

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
}
