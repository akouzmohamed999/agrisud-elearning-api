package org.agrisud.elearningAPI.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.cloudservice.FileCloudService;
import org.agrisud.elearningAPI.dto.FileDto;
import org.agrisud.elearningAPI.dto.TrainingPathCreationDto;
import org.agrisud.elearningAPI.dto.TrainingPathTranslationDto;
import org.agrisud.elearningAPI.enums.SupportMode;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/trainingPathTranslation")
@Slf4j
public class TrainingPathTranslationController {
    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;

    @Autowired
    private FileCloudService fileCloudService;

    @GetMapping
    public List<TrainingPathTranslation> getTrainingPathTranslationList() {
        return trainingPathTranslationService.getTrainingPathTranslationList();
    }

    @GetMapping("/trainingPath/{trainingPathID}")
    public List<TrainingPathTranslationDto> getTrainingPathTranslationListByTrainingPathID(@PathVariable Long trainingPathID) {
        return this.trainingPathTranslationService.getTrainingPathTranslationListByTrainingPathID(trainingPathID);
    }

    @GetMapping("/{trainingPathTranslationID}")
    public Optional<TrainingPathTranslation> getTrainingPathTranslationById(@PathVariable Long trainingPathTranslationID) {
        return this.trainingPathTranslationService.getTrainingPathTranslationById(trainingPathTranslationID);
    }

    @PostMapping
    public long createNewTrainingPathTranslation(@RequestBody TrainingPathCreationDto trainingPathTranslationDto) {
        return this.trainingPathTranslationService.createNewTrainingPathTranslation(trainingPathTranslationDto);
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

    @PutMapping("/{trainingPathTranslationId}/template")
    public void updateTrainingPathTranslationTemplate(@PathVariable Long trainingPathTranslationId, @RequestBody String content) {
        this.trainingPathTranslationService.updateTrainingPathTranslationTemplate(trainingPathTranslationId, content);
    }

    @GetMapping("/{trainingPathTranslationId}/template")
    public String getTrainingPathTranslationTemplate(@PathVariable Long trainingPathTranslationId) {
        return trainingPathTranslationService.getTrainingPathTranslationTemplate(trainingPathTranslationId);
    }

    @PostMapping(value = "/support", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public FileDto uploadEvaluationSupport(@RequestParam MultipartFile support) {
        log.info("Starting pdf evaluation .....");
        return this.fileCloudService.uploadFile(support, SupportMode.EVALUATION);
    }
}
