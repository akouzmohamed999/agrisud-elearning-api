package org.agrisud.elearningapi.dto;

import lombok.*;
import org.agrisud.elearningapi.model.Module;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ModuleDto {
    private Long id;
    private String title;
    private int orderOnPath;
    private String moduleDuration;
    private Long trainingPathTranslationID;
    private List<CourseDto> courseDtoList;

    public ModuleDto(Module module, List<CourseDto> courses) {
        this.title = module.getTitle();
        this.orderOnPath = module.getOrderOnPath();
        this.moduleDuration = module.getModuleDuration();
        this.trainingPathTranslationID = module.getTrainingPathTranslationID();
        this.courseDtoList = courses;
    }
    public ModuleDto(Module module) {
        this.title = module.getTitle();
        this.orderOnPath = module.getOrderOnPath();
        this.moduleDuration = module.getModuleDuration();
        this.trainingPathTranslationID = module.getTrainingPathTranslationID();
    }
}
