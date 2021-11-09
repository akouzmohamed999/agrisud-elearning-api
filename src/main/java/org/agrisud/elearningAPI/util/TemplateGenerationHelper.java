package org.agrisud.elearningAPI.util;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.dto.TrainingPathDto;
import org.agrisud.elearningAPI.dto.TrainingPathTranslationDto;
import org.agrisud.elearningAPI.enums.Language;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.*;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

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
        templateContent = templateContent.replace("[tpt_title]", trainingPathTranslationDto.getTitle());
        templateContent = templateContent.replace("[tpt_description]", trainingPathTranslationDto.getDescription());
        templateContent = templateContent.replace("[tpt_prerequest]", trainingPathTranslationDto.getPreRequest());
        return fillTemplateModuleLangPlaceholder(trainingPathTranslationDto, templateContent);
    }

    private static String fillTemplateModuleLangPlaceholder(TrainingPathTranslationDto trainingPathTranslationDto, String templateContent) {
        String moduleTitle = "";
        if (trainingPathTranslationDto.getLanguage() == Language.EN) {
            moduleTitle = "This module is divided to " + trainingPathTranslationDto.getModuleList().size() + " modules:";
        } else {
            moduleTitle = "Ce Parcours est divisé en " + trainingPathTranslationDto.getModuleList().size() + " modules:";
        }
        AtomicInteger index = new AtomicInteger();
        index.set(0);
        String spans = trainingPathTranslationDto.getModuleList().stream().map(moduleDto -> "<p style=\"margin-left:auto;margin-bottom:0;font-size: 1.5em;\"><span class=\"text-big\">" + index.incrementAndGet() + "- " + moduleDto.getTitle() + "</span></p>")
                .reduce(String::concat).orElseThrow(() -> new RuntimeException("Error while generating modules spans for template"));
        templateContent = templateContent.replace("[tpt_module_title]", moduleTitle);
        templateContent = templateContent.replace("[tpt_module_content]", spans);
        return templateContent;
    }
}
