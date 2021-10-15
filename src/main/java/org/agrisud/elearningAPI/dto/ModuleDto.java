package org.agrisud.elearningAPI.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Builder
public class ModuleDto {
    private Long id;
    private String title;
    private int orderOnPath;
    private String moduleDuration;
    private Long trainingPathTranslationID;
    private List<CourseDto> courseDtoList;
}
