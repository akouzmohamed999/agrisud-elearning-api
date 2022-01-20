package org.agrisud.elearningapi.util;

import org.agrisud.elearningapi.dto.CourseDto;
import org.agrisud.elearningapi.dto.ModuleDto;
import org.agrisud.elearningapi.dto.TrainingPathTranslationDto;

public class DurationGenerator {

    public static String getTrainingPathDuration(TrainingPathTranslationDto trainingPathTranslationDto) {
        int hours = trainingPathTranslationDto.getModuleList().stream()
                .filter(moduleDto -> moduleDto.getCourseDtoList() != null)
                .map(moduleDto ->
                        moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseHours).reduce(0, Integer::sum)).reduce(0, Integer::sum);
        int minutes = trainingPathTranslationDto.getModuleList().stream()
                .filter(moduleDto -> moduleDto.getCourseDtoList() != null)
                .map(moduleDto ->
                moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseMinutes).reduce(0, Integer::sum)).reduce(0, Integer::sum);

        hours += minutes / 60;
        minutes = minutes % 60;
        return DurationGenerator.getCourseTimeString(hours, minutes);
    }

    public static String getModuleDuration(ModuleDto moduleDto) {
        int moduleHours = moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseHours).reduce(0, Integer::sum);
        int moduleMinutes = moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseMinutes).reduce(0, Integer::sum);
        moduleHours += moduleMinutes / 60;
        moduleMinutes = moduleMinutes % 60;

        return DurationGenerator.getCourseTimeString(moduleHours, moduleMinutes);
    }

    public static String getCourseTimeString(int courseHours, int courseMinutes) {
        if (courseHours == 0) {
            return courseMinutes + " min ";
        } else if (courseMinutes == 0) {
            return courseHours + " h ";
        } else {
            return courseHours + " h " + courseMinutes + " min ";
        }
    }
}
