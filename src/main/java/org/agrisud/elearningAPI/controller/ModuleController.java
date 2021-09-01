package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/module")
public class ModuleController { 

    @Autowired
    private ModuleService moduleService;

    @GetMapping
    public List<Module> getModuleList() {
        return moduleService.getModuleList();
    }

    @GetMapping("/trainingPath/{trainingPathID}")
    public List<Module> getModuleListByTrainingPathID(@PathVariable Long trainingPathID) {
        return this.moduleService.getModuleListByTrainingPathID(trainingPathID);
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

    @DeleteMapping("/trainingPath/{trainingPathID}")
    public void deleteModulesByTrainingPathID(@PathVariable Long trainingPathID) {
        this.moduleService.deleteModuleByTrainingPathID(trainingPathID);
    }
}
