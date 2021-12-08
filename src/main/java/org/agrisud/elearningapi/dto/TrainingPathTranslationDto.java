package org.agrisud.elearningapi.dto;

import lombok.*;
import org.agrisud.elearningapi.enums.Language;
import org.agrisud.elearningapi.model.TrainingPathTranslation;

import java.util.List;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TrainingPathTranslationDto {
    private Long id;
    private String title;
    private String description;
    private String supportUrl;
    private String supportPath;
    private String capacity;
    private String preRequest;
    private Language language;
    private Long trainingPathID;
    private List<ModuleDto> moduleList;
    private String trainingPathDuration;

    public TrainingPathTranslationDto(TrainingPathTranslation trainingPathTranslation, List<ModuleDto> modules) {
        this.title = trainingPathTranslation.getTitle();
        this.description = trainingPathTranslation.getDescription();
        this.capacity = trainingPathTranslation.getCapacity();
        this.preRequest = trainingPathTranslation.getPreRequest();
        this.language = trainingPathTranslation.getLanguage();
        this.trainingPathID = trainingPathTranslation.getTrainingPathID();
        this.moduleList = modules;
    }
}
