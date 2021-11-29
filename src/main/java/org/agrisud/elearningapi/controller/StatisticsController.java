package org.agrisud.elearningapi.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningapi.model.StatisticsData;
import org.agrisud.elearningapi.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/statistics")
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @GetMapping("/registeredUsers")
    public Integer getNumberOfRegisteredUsers(@RequestParam int year) {
        return statisticsService.getNumberOfRegisteredUsers(year);
    }

    @GetMapping("/nbrUsersByNbrTrainingPaths")
    public List<StatisticsData> getNbrUsersByNbrTrainingPaths(@RequestParam int year) {
        return statisticsService.getNbrUsersByNbrTrainingPaths(year);
    }

    @GetMapping("/nbrUsersByCompletedTrainingPaths")
    public List<StatisticsData> getNbrUsersByCompletedTrainingPaths(@RequestParam String language, @RequestParam int year) {
        return statisticsService.getNbrUsersByCompletedTrainingPaths(language, year);
    }

    @GetMapping("/usersIndicators")
    public Map<String, List<StatisticsData>> getUsersIndicators(@RequestParam int year) {
        return statisticsService.getUsersIndicators(year);
    }

    @GetMapping("/trainingPathsIndicators")
    public Map<String, List<StatisticsData>> getTrainingPathsIndicators(@RequestParam String language, @RequestParam int year) {
        return statisticsService.getTrainingPathsIndicators(language, year);
    }

    @GetMapping("/registeredUsersByMonth")
    public Map<String, List<StatisticsData>> getNbrRegisteredUsersByMonth(@RequestParam int year) {
        return statisticsService.getNbrRegisteredUsersByMonth(year);
    }
}
