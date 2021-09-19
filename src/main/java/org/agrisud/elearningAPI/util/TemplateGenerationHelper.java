package org.agrisud.elearningAPI.util;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.dto.TrainingPathDto;
import org.agrisud.elearningAPI.dto.TrainingPathTranslationDto;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.*;

@Slf4j
public class TemplateGenerationHelper {
    public static String generateTrainingPathTemplate(TrainingPathDto trainingPathDto, TrainingPathTranslationDto trainingPathTranslationDto) {
        return fillTemplateTrainingPathPlaceHolders(trainingPathDto, trainingPathTranslationDto, getTemplateHtmlFile());
    }

    private static String getTemplateHtmlFile() {
        StringBuilder contentBuilder = new StringBuilder();
        try {
            InputStream inputStream = new ClassPathResource("template/training_path_fr.html").getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            String str;
            while ((str = in.readLine()) != null) {
                contentBuilder.append(str);
            }
            in.close();
        } catch (IOException e) {
            log.error("error reading template file " + e);
        }
        return contentBuilder.toString();
    }

    private static String fillTemplateTrainingPathPlaceHolders(TrainingPathDto trainingPathDto, TrainingPathTranslationDto trainingPathTranslationDto, String templateContent) {
        templateContent = templateContent.replace("[tpt_image]", trainingPathDto.getImageUrl());
        templateContent = templateContent.replace("[tpt_description]", trainingPathTranslationDto.getDescription());
        templateContent = templateContent.replace("[tpt_prerequest]", trainingPathTranslationDto.getPreRequest());
        return templateContent;
    }
}
