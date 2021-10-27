package org.agrisud.elearningAPI.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.StatisticsData;
import org.agrisud.elearningAPI.model.TrainingPathsUsers;
import org.agrisud.elearningAPI.service.StatisticsService;
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
    public List<TrainingPathsUsers> getNbrUsersByNbrTrainingPaths() {
        return statisticsService.getNbrUsersByNbrTrainingPaths();
    }

    @GetMapping("/usersIndicators")
    public Map<String, List<StatisticsData>> getUsersIndicators() {
        return statisticsService.getUsersIndicators();
    }

    @GetMapping("/trainingPathsIndicators")
    public Map<String, List<StatisticsData>> getTrainingPathsIndicators(@RequestParam String language) {
        return statisticsService.getTrainingPathsIndicators(language);
    }
}
