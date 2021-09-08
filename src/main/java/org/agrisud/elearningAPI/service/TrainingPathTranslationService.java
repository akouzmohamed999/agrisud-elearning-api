package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.TrainingPathTranslationDao;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TrainingPathTranslationService {
    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;
    @Autowired
    private ModuleService moduleService;

    public List<TrainingPathTranslation> getTrainingPathTranslationList() {
        return trainingPathTranslationDao.getTrainingPathTranslationList();
    }

    public List<TrainingPathTranslation> getTrainingPathTranslationListByTrainingPathID(Long trainingPathID) {
        return this.trainingPathTranslationDao.getTrainingPathTranslationListByTrainingPathID(trainingPathID);
    }

    public Optional<TrainingPathTranslation> getTrainingPathTranslationById(Long trainingPathTranslationID) {
        return this.trainingPathTranslationDao.getTrainingPathTranslationById(trainingPathTranslationID);
    }

    public long createNewTrainingPathTranslation(TrainingPathTranslation trainingPathTranslation) {
        return this.trainingPathTranslationDao.createNewTrainingPathTranslation(trainingPathTranslation);
    }

    public void updateTrainingPathTranslation(TrainingPathTranslation trainingPathTranslation) {
        this.trainingPathTranslationDao.updateTrainingPathTranslation(trainingPathTranslation);
    }

    public void deleteTrainingPathTranslation(Long trainingPathTranslationID) {
        this.trainingPathTranslationDao.getTrainingPathTranslationById(trainingPathTranslationID).ifPresent(trainingPathTranslation -> {
            this.moduleService.deleteModuleByTrainingPathTranslationID(trainingPathTranslationID);
            this.trainingPathTranslationDao.deleteTrainingPathTranslation(trainingPathTranslationID);
        });
    }

    public void deleteTrainingPathTranslationByTrainingPathID(Long trainingPathID) {
        this.trainingPathTranslationDao.getTrainingPathTranslationListByTrainingPathID(trainingPathID)
                .forEach(trainingPathTranslation -> {
                    deleteTrainingPathTranslation(trainingPathTranslation.getId());
                });
    }
}
