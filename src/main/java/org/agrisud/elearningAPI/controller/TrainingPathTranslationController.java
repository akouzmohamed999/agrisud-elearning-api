package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.service.ModuleService;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/trainingPathTranslation")
public class TrainingPathTranslationController {
    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;
    @Autowired
    private ModuleService moduleService;
    public static final String PAGE = "0";
    public static final String SIZE = "8";

    @GetMapping
    public List<TrainingPathTranslation> getTrainingPathTranslationList() {
        return trainingPathTranslationService.getTrainingPathTranslationList();
    }

    @GetMapping("/trainingPath/{trainingPathID}")
    public List<TrainingPathTranslation> getTrainingPathTranslationListByTrainingPathID(@PathVariable Long trainingPathID) {
        return this.trainingPathTranslationService.getTrainingPathTranslationListByTrainingPathID(trainingPathID);
    }

    @GetMapping("/trainingPath/perPage/{trainingPathID}")
    public Page<TrainingPathTranslation> getTrainingPathTranslationListByTrainingPathIDPerPage(@PathVariable Long trainingPathID,
                                                                                               @RequestParam(name = "page", defaultValue = PAGE) int page,
                                                                                               @RequestParam(name = "size", defaultValue = SIZE) int size) {
        return this.trainingPathTranslationService.getTrainingPathTranslationListByTrainingPathIDPerPage(trainingPathID, page, size);
    }

    @GetMapping("/{trainingPathTranslationID}")
    public Optional<TrainingPathTranslation> getTrainingPathTranslationById(@PathVariable Long trainingPathTranslationID) {
        return this.trainingPathTranslationService.getTrainingPathTranslationById(trainingPathTranslationID);
    }

    @PostMapping
    public long createNewTrainingPathTranslation(@RequestBody TrainingPathTranslation trainingPathTranslation) {
        return this.trainingPathTranslationService.createNewTrainingPathTranslation(trainingPathTranslation);
    }

    @PutMapping
    public void updateTrainingPathTranslation(@RequestBody TrainingPathTranslation trainingPathTranslation) {
        this.trainingPathTranslationService.updateTrainingPathTranslation(trainingPathTranslation);
    }

    @DeleteMapping("/{trainingPathTranslationID}")
    public void deleteTrainingPathTranslationByID(@PathVariable Long trainingPathTranslationID) {
        this.trainingPathTranslationService.deleteTrainingPathTranslation(trainingPathTranslationID);
    }

    @DeleteMapping("/trainingPath/{trainingPathID}")
    public void deleteTrainingPathTranslationByTrainingPathID(@PathVariable Long trainingPathID) {
        this.trainingPathTranslationService.deleteTrainingPathTranslationByTrainingPathID(trainingPathID);
    }
}
