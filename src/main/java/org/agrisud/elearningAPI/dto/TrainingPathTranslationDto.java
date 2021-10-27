package org.agrisud.elearningAPI.dto;

import lombok.*;
import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;

import java.util.List;
import java.util.stream.Collectors;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TrainingPathTranslationDto {
    private Long id;
    private String title;
    private String description;
    private String capacity;
    private String preRequest;
    private Language language;
    private Long trainingPathID;
    private List<ModuleDto> moduleList;
    private String trainingPathDuration;

    public TrainingPathTranslationDto(TrainingPathTranslation trainingPathTranslation, List<Module> modules) {
        this.title = trainingPathTranslation.getTitle();
        this.description = trainingPathTranslation.getDescription();
        this.capacity = trainingPathTranslation.getCapacity();
        this.preRequest = trainingPathTranslation.getPreRequest();
        this.language = trainingPathTranslation.getLanguage();
        this.trainingPathID = trainingPathTranslation.getTrainingPathID();
        this.moduleList = modules.stream().map(ModuleDto::new).collect(Collectors.toList());
    }
}
