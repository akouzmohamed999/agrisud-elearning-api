package org.agrisud.elearningAPI.controller;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.cloudservice.TrainingPathCloudService;
import org.agrisud.elearningAPI.dto.CourseDto;
import org.agrisud.elearningAPI.dto.FileDto;
import org.agrisud.elearningAPI.dto.TrainingPathCreationDto;
import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.enums.SortColumn;
import org.agrisud.elearningAPI.model.Course;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.service.CourseService;
import org.agrisud.elearningAPI.service.ModuleService;
import org.agrisud.elearningAPI.service.TrainingPathService;
import org.agrisud.elearningAPI.service.TrainingPathTranslationService;
import org.agrisud.elearningAPI.util.TemplateGenerationHelper;
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
    public static final String SIZE_USER = "10000";
    @Autowired
    private TrainingPathService trainingPathService;
    @Autowired
    private TrainingPathCloudService trainingPathCloudService;
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
        long trainingPathID = this.trainingPathService.createNewTrainingPath(TrainingPath.builder().imageUrl(trainingPathCreationDto.getTrainingPathDto().getImageUrl())
                .fullImagePath(trainingPathCreationDto.getTrainingPathDto().getFullImagePath())
                .status(false).archived(false).build());

        trainingPathCreationDto.getTrainingPathTranslationDto().forEach(trainingPathTranslationDto -> {

            int hours = trainingPathTranslationDto.getModuleList().stream().map(moduleDto ->
                    moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseHours).reduce(0, Integer::sum)).reduce(0, Integer::sum);
            int minutes = trainingPathTranslationDto.getModuleList().stream().map(moduleDto ->
                    moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseMinutes).reduce(0, Integer::sum)).reduce(0, Integer::sum);

            hours += minutes / 60;
            minutes = minutes % 60;


            long trainingPathTranslationID = this.trainingPathTranslationService.createNewTrainingPathTranslation(TrainingPathTranslation.builder()
                    .title(trainingPathTranslationDto.getTitle())
                    .description(trainingPathTranslationDto.getDescription())
                    .preRequest(trainingPathTranslationDto.getPreRequest())
                    .language(trainingPathTranslationDto.getLanguage())
                    .capacity(trainingPathTranslationDto.getCapacity())
                    .trainingPathDuration(getCourseTimeString(hours, minutes))
                    .trainingPathID(trainingPathID).template(TemplateGenerationHelper.generateTrainingPathTemplate(trainingPathCreationDto.getTrainingPathDto(), trainingPathTranslationDto)).build());

            AtomicInteger order = new AtomicInteger(1);
            trainingPathTranslationDto.getModuleList().forEach(moduleDto -> {
                int moduleHours = moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseHours).reduce(0, Integer::sum);
                int moduleMinutes = moduleDto.getCourseDtoList().stream().map(CourseDto::getCourseMinutes).reduce(0, Integer::sum);
                moduleHours += moduleMinutes / 60;
                moduleMinutes = moduleMinutes % 60;
                long moduleID = this.moduleService.createNewModule(Module.builder().title(moduleDto.getTitle()).orderOnPath(order.getAndIncrement())
                        .moduleDuration(getCourseTimeString(moduleHours, moduleMinutes)).trainingPathTranslationID(trainingPathTranslationID).build());
                moduleDto.getCourseDtoList().forEach(courseDto -> {
                    courseService.createNewCourse(Course.builder().title(courseDto.getTitle()).courseHours(courseDto.getCourseHours())
                            .courseMinutes(courseDto.getCourseMinutes()).courseType(courseDto.getCourseType())
                            .supportUrl(courseDto.getSupportUrl()).supportPath(courseDto.getSupportPath()).moduleId(moduleID).build());
                });
            });
        });
        return trainingPathID;
    }

    private String getCourseTimeString(int courseHours, int courseMinutes) {
        if (courseHours == 0) {
            return courseMinutes + " min ";
        } else if (courseMinutes == 0) {
            return courseMinutes + " h ";
        } else {
            return courseHours + " h " + courseMinutes + " min ";
        }
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
                this.trainingPathCloudService.deleteTrainingPathPicture(trainingPath.getFullImagePath())
        );
        this.trainingPathService.deleteTrainingPath(trainingPathID);
    }

    @PostMapping(value = "/picture", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public FileDto uploadTrainingPathPicture(@RequestParam MultipartFile file) {
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
