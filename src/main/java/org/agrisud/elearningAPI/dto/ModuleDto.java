package org.agrisud.elearningAPI.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ModuleDto {
    private Long id;
    private String title;
    private int orderOnPath;
    private Long trainingPathTranslationID;
}
