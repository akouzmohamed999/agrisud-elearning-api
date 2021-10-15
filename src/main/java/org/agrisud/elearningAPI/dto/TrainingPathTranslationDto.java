package org.agrisud.elearningAPI.dto;

import lombok.*;
import org.agrisud.elearningAPI.enums.Language;

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
    private String capacity;
    private String preRequest;
    private Language language;
    private Long trainingPathID;
    private List<ModuleDto> moduleList;
    private String trainingPathDuration;
}
