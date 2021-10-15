package org.agrisud.elearningAPI.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TrainingPathDto {
    private Long id;
    private String imageUrl;
    private String fullImagePath;
    private boolean status;
    private boolean archived;
}
