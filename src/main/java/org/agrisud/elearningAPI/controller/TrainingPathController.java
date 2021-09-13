package org.agrisud.elearningAPI.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.cloudservice.TrainingPathCloudService;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.agrisud.elearningAPI.dto.TrainingPathCreationDto;
import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.service.ModuleService;
import org.agrisud.elearningAPI.service.TrainingPathService;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

@RestController
@RequestMapping("/trainingPath")
@Slf4j
public class TrainingPathController {

    public static final String PAGE = "0";
    public static final String SIZE = "10";
    @Autowired
    private TrainingPathService trainingPathService;

    @Autowired
    private TrainingPathCloudService trainingPathCloudService;

    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;

    @Autowired
    private ModuleService moduleService;

    @GetMapping
    public List<TrainingPath> getTrainingPathList() {
        return trainingPathService.getTrainingPathList();
    }

    @GetMapping("/perPage")
    public Page<TrainingPath> getTrainingPathListPerPage(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                         @RequestParam(name = "size", defaultValue = SIZE) int size) {
        return trainingPathService.getTrainingPathListPerPage(page, size);
    }

    @GetMapping("/byUser")
    public Page<TrainingPath> getTrainingPathListByUser(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                        @RequestParam(name = "size", defaultValue = SIZE) int size) {
        return trainingPathService.getTrainingPathListByUser(page, size);
    }

    @GetMapping("/notUsers")
    public Page<TrainingPath> getTrainingPathListNotUsers(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                          @RequestParam(name = "size", defaultValue = SIZE) int size) {
        return trainingPathService.getTrainingPathListNotUsers(page, size);
    }

    @GetMapping("/{trainingPathID}")
    public Optional<TrainingPath> getTrainingPathByID(@PathVariable Long trainingPathID) {
        return this.trainingPathService.getTrainingPathByID(trainingPathID);
    }

    @PostMapping
    public long createNewTrainingPath(@RequestBody TrainingPathCreationDto trainingPathCreationDto) {
        long trainingPathID = this.trainingPathService.createNewTrainingPath(TrainingPath.builder().imageUrl(trainingPathCreationDto.getTrainingPathDto().getImageUrl())
                .fullImagePath(trainingPathCreationDto.getTrainingPathDto().getFullImagePath())
                .status(false).trainingPathTime(trainingPathCreationDto.getTrainingPathDto().getTrainingPathTime())
                .build());

        trainingPathCreationDto.getTrainingPathTranslationDto().forEach(trainingPathTranslationDto -> {
            long trainingPathTranslationID = this.trainingPathTranslationService.createNewTrainingPathTranslation(TrainingPathTranslation.builder()
                    .title(trainingPathTranslationDto.getTitle())
                    .description(trainingPathTranslationDto.getDescription())
                    .preRequest(trainingPathTranslationDto.getPreRequest())
                    .language(trainingPathTranslationDto.getLanguage())
                    .capacity(trainingPathTranslationDto.getCapacity())
                    .trainingPathID(trainingPathID).build());
            AtomicInteger order = new AtomicInteger(1);
            trainingPathTranslationDto.getModuleList().forEach(moduleDto -> {
                this.moduleService.createNewModule(Module.builder().title(moduleDto.getTitle()).orderOnPath(order.getAndIncrement())
                        .trainingPathTranslationID(trainingPathTranslationID).build());
            });
        });
        return trainingPathID;
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
        log.info("Starting .....");
        return trainingPathCloudService.uploadTrainingPathPicture(file);
    }

    @DeleteMapping("/picture")
    public void deleteTrainingPathPicture(@RequestParam String fullImagePath) {
        trainingPathCloudService.deleteTrainingPathPicture(fullImagePath);
    }

    @PostMapping("/addTrainingPathToUser/{trainingPathId}")
    public void addTrainingPathToUser(@PathVariable Long trainingPathId) {
        this.trainingPathService.addTrainingPathToUser(trainingPathId);
    }

    @PostMapping("/editor/upload")
    public ResponseEntity<Map<String, String>> upload(@RequestParam("file") MultipartFile file) {
        HashMap<String, String> response = new HashMap<>();
        String uri = trainingPathCloudService.uploadTrainingPathEditorImage(file);
        response.put("uploaded", "true");
        response.put("url", uri);
        response.put("default", uri);
        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/{trainingPathId}/template")
    public String getTrainingPathTranslationTemplate(@PathVariable Long trainingPathId, @RequestParam Language currentLang) {
        return trainingPathTranslationService.getTrainingPathTranslationTemplate(trainingPathId, currentLang);
    }
}
