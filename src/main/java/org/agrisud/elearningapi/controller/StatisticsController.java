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
    public Integer getNumberOfRegisteredUsers() {
        return statisticsService.getNumberOfRegisteredUsers();
    }

    @GetMapping("/nbrUsersByNbrTrainingPaths")
    public List<StatisticsData> getNbrUsersByNbrTrainingPaths() {
        return statisticsService.getNbrUsersByNbrTrainingPaths();
    }

    @GetMapping("/nbrUsersByCompletedTrainingPaths")
    public List<StatisticsData> getNbrUsersByCompletedTrainingPaths(@RequestParam String language) {
        return statisticsService.getNbrUsersByCompletedTrainingPaths(language);
    }

    @GetMapping("/usersIndicators")
    public Map<String, List<StatisticsData>> getUsersIndicators() {
        return statisticsService.getUsersIndicators();
    }

    @GetMapping("/trainingPathsIndicators")
    public Map<String, List<StatisticsData>> getTrainingPathsIndicators(@RequestParam String language) {
        return statisticsService.getTrainingPathsIndicators(language);
    }

    @GetMapping("/registeredUsersByMonth")
    public Map<String, List<StatisticsData>> getNbrRegisteredUsersByMonth() {
        return statisticsService.getNbrRegisteredUsersByMonth();
    }
}
