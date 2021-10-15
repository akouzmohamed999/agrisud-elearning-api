package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/module")
public class ModuleController {
    public static final String PAGE = "0";
    public static final String SIZE = "100";
    @Autowired
    private ModuleService moduleService;

    @GetMapping
    public List<Module> getModuleList() {
        return moduleService.getModuleList();
    }

    @GetMapping("/trainingPathTranslation/{trainingPathTranslationID}")
    public List<Module> getModuleListByTrainingPathTranslationID(@PathVariable Long trainingPathTranslationID) {
        return this.moduleService.getModuleListByTrainingPathTranslationID(trainingPathTranslationID);
    }

    @GetMapping("/trainingPathTranslation/perPage/{trainingPathTranslationID}")
    public Page<Module> getModuleListByTrainingPathTranslationIDPerPage(@PathVariable Long trainingPathTranslationID,
                                                                        @RequestParam(name = "page", defaultValue = PAGE) int page,
                                                                        @RequestParam(name = "size", defaultValue = SIZE) int size) {
        return this.moduleService.getModuleListByTrainingPathTranslationIDPerPage(trainingPathTranslationID, page, size);
    }

    @GetMapping("/{moduleID}")
    public Optional<Module> getModuleById(@PathVariable Long moduleID) {
        return this.moduleService.getModuleById(moduleID);
    }

    @PostMapping
    public long createNewModule(@RequestBody Module module) {
        return this.moduleService.createNewModule(module);
    }

    @PutMapping
    public void updateModule(@RequestBody Module module) {
        this.moduleService.updateModule(module);
    }

    @DeleteMapping("/{moduleID}")
    public void deleteModule(@PathVariable Long moduleID) {
        this.moduleService.deleteModule(moduleID);
    }

    @DeleteMapping("/trainingPathTranslation/{trainingPathTranslationID}")
    public void deleteModuleByTrainingPathTranslationID(@PathVariable Long trainingPathTranslationID) {
        this.moduleService.deleteModuleByTrainingPathTranslationID(trainingPathTranslationID);
    }
}
