package org.agrisud.elearningAPI.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;

import java.util.List;
import java.util.stream.Collectors;

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

    public ModuleDto(Module module, List<Course> courses) {
        this.title = module.getTitle();
        this.orderOnPath = module.getOrderOnPath();
        this.moduleDuration = module.getModuleDuration();
        this.trainingPathTranslationID = module.getTrainingPathTranslationID();
        this.courseDtoList = courses.stream().map(CourseDto::new).collect(Collectors.toList());
    }
}
