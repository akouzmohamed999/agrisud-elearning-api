package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.service.TrainingPathService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/trainingPath")
public class TrainingPathController {

    @Autowired
    private TrainingPathService trainingPathService;

    @GetMapping("/list")
    public List<TrainingPath> trainingPathList() {
        return trainingPathService.getTrainingPathList();
    }

    @GetMapping("/{trainingPathID}")
    public Optional<TrainingPath> getTrainingPathByID(@PathVariable Long trainingPathID) {
        return this.trainingPathService.getTrainingPathByID(trainingPathID);
    }

    @PostMapping
    public void createNewTrainingPath(@RequestBody TrainingPath trainingPath) {
        this.trainingPathService.createNewTrainingPath(trainingPath);
    }

    @PutMapping
    public void updateTrainingPath(@RequestBody TrainingPath trainingPath) {
        this.trainingPathService.updateTrainingPath(trainingPath);
    }

    @DeleteMapping("/{trainingPathID}")
    public void deleteTrainingPath(@PathVariable Long trainingPathID) {
        this.trainingPathService.deleteTrainingPath(trainingPathID);
    }
}
