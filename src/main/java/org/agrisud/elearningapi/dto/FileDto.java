package org.agrisud.elearningapi.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FileDto {
    private String fileUrl;
    private String filePath;
}
