package org.agrisud.elearningAPI.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PictureDto {
    private String url;
    private String fullImagePath;
}
