package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.cloudservice.TrainingPathCloudService;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.service.TrainingPathService;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/trainingPath")
public class TrainingPathController {
    public static final String PAGE = "0";
    public static final String SIZE = "8";

    @Autowired
    private TrainingPathService trainingPathService;

    @Autowired
    private TrainingPathCloudService trainingPathCloudService;

    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;

    @GetMapping
    public List<TrainingPath> getTrainingPathList() {
        return trainingPathService.getTrainingPathList();
    }

    @GetMapping("/perPage")
    public Page<TrainingPath> getTrainingPathListPerPage(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                         @RequestParam(name = "size", defaultValue = SIZE) int size) {
        return trainingPathService.getTrainingPathListPerPage(page, size);
    }

    @GetMapping("/{trainingPathID}")
    public Optional<TrainingPath> getTrainingPathByID(@PathVariable Long trainingPathID) {
        return this.trainingPathService.getTrainingPathByID(trainingPathID);
    }

    @PostMapping
    public long createNewTrainingPath(@RequestBody TrainingPath trainingPath) {
        return this.trainingPathService.createNewTrainingPath(trainingPath);
    }

    @PutMapping
    public void updateTrainingPath(@RequestBody TrainingPath trainingPath) {
        this.trainingPathService.updateTrainingPath(trainingPath);
    }

    @DeleteMapping("/{trainingPathID}")
    public void deleteTrainingPath(@PathVariable Long trainingPathID) {
        this.trainingPathService.getTrainingPathByID(trainingPathID).ifPresent(trainingPath -> {
            this.trainingPathCloudService.deleteTrainingPathPicture(trainingPath.getFullImagePath());
            this.trainingPathTranslationService.deleteTrainingPathTranslationByTrainingPathID(trainingPathID);
            this.trainingPathService.deleteTrainingPath(trainingPathID);
        });
    }

    @PostMapping(value = "/picture", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public PictureDto uploadTrainingPathPicture(@RequestParam MultipartFile file) {
        return trainingPathCloudService.uploadTrainingPathPicture(file);
    }

    @DeleteMapping("/picture")
    public void deleteTrainingPathPicture(@RequestParam String fullImagePath) {
        trainingPathCloudService.deleteTrainingPathPicture(fullImagePath);
    }
}
