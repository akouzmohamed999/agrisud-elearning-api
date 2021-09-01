package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.cloudservice.TrainingPathCloudService;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.service.TrainingPathService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/trainingPath")
public class TrainingPathController {

    @Autowired
    private TrainingPathService trainingPathService;

    @Autowired
    private TrainingPathCloudService trainingPathCloudService;

    @GetMapping
    public List<TrainingPath> trainingPathList() {
        return trainingPathService.getTrainingPathList();
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
        this.trainingPathService.deleteTrainingPath(trainingPathID);
    }

    @PostMapping(value = "/picture", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public PictureDto uploadTrainingPathPicture(@RequestParam MultipartFile file) {
        return trainingPathCloudService.uploadTrainingPathPicture(file);
    }

    @DeleteMapping("/picture/{fullImagePath}")
    public void deleteTrainingPathPicture(@PathVariable String fullImagePath) {
        trainingPathCloudService.deleteTrainingPathPicture(fullImagePath);
    }
}
