package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.ModuleDao;
import org.agrisud.elearningAPI.model.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ModuleService {

    @Autowired
    private ModuleDao moduleDao;

    public List<Module> getModuleList() {
        return moduleDao.getModuleList();
    }

    public List<Module> getModuleListByTrainingPathTranslationID(Long trainingPathTranslationID) {
        return this.moduleDao.getModuleListByTrainingPathTranslationID(trainingPathTranslationID);
    }

    public Page<Module> getModuleListByTrainingPathTranslationIDPerPage(Long trainingPathTranslationID, int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return this.moduleDao.getModuleListByTrainingPathTranslationIDPerPage(trainingPathTranslationID, pageRequest);
    }

    public Optional<Module> getModuleById(Long moduleID) {
        return this.moduleDao.getModuleById(moduleID);
    }

    public long createNewModule(Module module) {
        return this.moduleDao.createNewModule(module);
    }

    public void updateModule(Module module) {
        this.moduleDao.updateModule(module);
    }

    public void deleteModule(Long moduleID) {
        this.moduleDao.deleteModule(moduleID);
    }

    public void deleteModuleByTrainingPathTranslationID(Long trainingPathTranslationID) {
        this.moduleDao.deleteModulesByTrainingPathTranslationID(trainingPathTranslationID);
    }

    public void updateDuration(Long moduleId, String courseTimeString) {
        this.moduleDao.updateDuration(moduleId,courseTimeString);
    }
}
