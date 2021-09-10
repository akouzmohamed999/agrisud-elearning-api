package org.agrisud.elearningAPI.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TrainingPathCreationDto {
    private TrainingPathDto trainingPathDto;
    private List<TrainingPathTranslationDto> trainingPathTranslationDto;
}
