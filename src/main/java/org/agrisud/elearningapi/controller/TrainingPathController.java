package org.agrisud.elearningapi.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningapi.cloudservice.FileCloudService;
import org.agrisud.elearningapi.dto.FileDto;
import org.agrisud.elearningapi.dto.TrainingPathCreationDto;
import org.agrisud.elearningapi.enums.Language;
import org.agrisud.elearningapi.enums.SortColumn;
import org.agrisud.elearningapi.enums.SupportMode;
import org.agrisud.elearningapi.model.TrainingPath;
import org.agrisud.elearningapi.service.CourseService;
import org.agrisud.elearningapi.service.ModuleService;
import org.agrisud.elearningapi.service.TrainingPathService;
import org.agrisud.elearningapi.service.TrainingPathTranslationService;
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

@RestController
@RequestMapping("/trainingPath")
@Slf4j
public class TrainingPathController {

    public static final String PAGE = "0";
    public static final String SIZE = "10";
    public static final String SIZE_USER = "10000";
    @Autowired
    private TrainingPathService trainingPathService;
    @Autowired
    private FileCloudService fileCloudService;
    @Autowired
    private TrainingPathTranslationService trainingPathTranslationService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private CourseService courseService;

    @GetMapping
    public List<TrainingPath> getTrainingPathList() {
        return trainingPathService.getTrainingPathList();
    }

    @GetMapping("/perPage/byOrder")
    public Page<TrainingPath> getTrainingPathListPerPageByOrder(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                                @RequestParam(name = "size", defaultValue = SIZE) int size,
                                                                @RequestParam(name = "language") String language,
                                                                @RequestParam(name = "sortColumn") SortColumn sortColumn,
                                                                @RequestParam(name = "asc") Boolean asc,
                                                                @RequestParam(name = "archived") Boolean archived) {
        return trainingPathService.getTrainingPathListPerPageByOrder(page, size, language, sortColumn, asc, archived);
    }

    @GetMapping("/perPage")
    public Page<TrainingPath> getTrainingPathListPerPage(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                         @RequestParam(name = "size", defaultValue = SIZE) int size,
                                                         @RequestParam(name = "language") String language,
                                                         @RequestParam(name = "archived") Boolean archived) {
        return trainingPathService.getTrainingPathListPerPage(page, size, language, archived);
    }

    @GetMapping("/byUser")
    public Page<TrainingPath> getTrainingPathListByUser(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                        @RequestParam(name = "size", defaultValue = SIZE_USER) int size,
                                                        @RequestParam(name = "language") String language,
                                                        @RequestParam(name = "archived") Boolean archived) {
        return trainingPathService.getTrainingPathListByUser(page, size, language, archived);
    }

    @GetMapping("/notUsers")
    public Page<TrainingPath> getTrainingPathListNotUsers(@RequestParam(name = "page", defaultValue = PAGE) int page,
                                                          @RequestParam(name = "size", defaultValue = SIZE) int size,
                                                          @RequestParam(name = "language") String language,
                                                          @RequestParam(name = "archived") Boolean archived) {
        return trainingPathService.getTrainingPathListNotUsers(page, size, language, archived);
    }

    @GetMapping("/{trainingPathID}")
    public Optional<TrainingPath> getTrainingPathByID(@PathVariable Long trainingPathID) {
        return this.trainingPathService.getTrainingPathByID(trainingPathID);
    }

    @PostMapping
    public long createNewTrainingPath(@RequestBody TrainingPathCreationDto trainingPathCreationDto) {
        return this.trainingPathService.createNewTrainingPath(trainingPathCreationDto);
    }

    @PostMapping("/duplicate")
    public void duplicateTrainingPath(@RequestParam Long trainingPathId) {
        this.trainingPathService.duplicateTrainingPath(trainingPathId);
    }

    @PutMapping
    public void updateTrainingPath(@RequestBody TrainingPath trainingPath) {
        this.trainingPathService.updateTrainingPath(trainingPath);
    }

    @DeleteMapping("/{trainingPathID}")
    public void deleteTrainingPath(@PathVariable Long trainingPathID) {
        this.trainingPathTranslationService.getTrainingPathTranslationListByTrainingPathID(trainingPathID)
                .forEach(trainingPathTranslation -> {
                    this.moduleService.getModuleListByTrainingPathTranslationID(trainingPathTranslation.getId()).forEach(module ->
                            this.courseService.deleteCourseByModule(module.getId())
                    );
                    this.moduleService.deleteModuleByTrainingPathTranslationID(trainingPathTranslation.getId());
                });
        this.trainingPathTranslationService.deleteTrainingPathTranslationByTrainingPathID(trainingPathID);
        this.trainingPathService.getTrainingPathByID(trainingPathID).ifPresent(trainingPath ->
                this.fileCloudService.deleteFile(trainingPath.getFullImagePath())
        );
        this.trainingPathService.deleteTrainingPath(trainingPathID);
    }

    @PostMapping(value = "/picture", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public FileDto uploadTrainingPathPicture(@RequestParam MultipartFile file) {
        log.info("Starting .....");
        return fileCloudService.uploadFile(file, SupportMode.IMAGE);
    }

    @DeleteMapping("/picture")
    public void deleteTrainingPathPicture(@RequestParam String fullImagePath) {
        fileCloudService.deleteFile(fullImagePath);
    }

    @PostMapping("/addTrainingPathToUser/{trainingPathId}")
    public void addTrainingPathToUser(@PathVariable Long trainingPathId) {
        this.trainingPathService.addTrainingPathToUser(trainingPathId);
    }

    @PostMapping("/startTrainingPath/{trainingPathId}")
    public void startTrainingPath(@PathVariable Long trainingPathId) {
        this.trainingPathService.startTrainingPath(trainingPathId);
    }

    @GetMapping("/isAlreadyStarted/{trainingPathId}")
    public ResponseEntity<Boolean> isAlreadyStarted(@PathVariable Long trainingPathId) {
        Boolean isAlreadyStarted = this.trainingPathService.isAlreadyStarted(trainingPathId);
        return ResponseEntity.ok().body(isAlreadyStarted);
    }

    @PostMapping("/editor/upload")
    public ResponseEntity<Map<String, String>> upload(@RequestParam("file") MultipartFile file) {
        HashMap<String, String> response = new HashMap<>();
        String uri = fileCloudService.uploadTrainingPathEditorImage(file);
        response.put("uploaded", "true");
        response.put("url", uri);
        response.put("default", uri);
        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/{trainingPathId}/template")
    public String getTrainingPathTranslationTemplate(@PathVariable Long trainingPathId, @RequestParam Language currentLang) {
        return trainingPathTranslationService.getTrainingPathTranslationTemplate(trainingPathId, currentLang);
    }

    @PostMapping("/finishTrainingPath/{trainingPathId}")
    public void finishTrainingPath(@PathVariable Long trainingPathId) {
        trainingPathService.finishTrainingPath(trainingPathId);
    }
}
