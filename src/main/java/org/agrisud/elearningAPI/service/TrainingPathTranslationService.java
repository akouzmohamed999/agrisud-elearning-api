package org.agrisud.elearningAPI.service;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.dao.TrainingPathDao;
import org.agrisud.elearningAPI.dao.TrainingPathTranslationDao;
import org.agrisud.elearningAPI.dto.TrainingPathDto;
import org.agrisud.elearningAPI.dto.TrainingPathTranslationDto;
import org.agrisud.elearningAPI.enums.Language;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.model.TrainingPathTranslation;
import org.agrisud.elearningAPI.util.TemplateGenerationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class TrainingPathTranslationService {
    @Autowired
    private TrainingPathTranslationDao trainingPathTranslationDao;
    @Autowired
    private TrainingPathDao trainingPathDao;
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
        // TODO converting transtation to DTO, instead of having DTO from the get go
        TrainingPathTranslationDto trainingPathTranslationDto = TrainingPathTranslationDto.builder()
                .description(trainingPathTranslation.getDescription())
                .preRequest(trainingPathTranslation.getPreRequest())
                .build();
        TrainingPath trainingPath = trainingPathDao.getTrainingPathById(trainingPathTranslation.getTrainingPathID()).orElseThrow(() -> new RuntimeException("Training Path not found"));
        TrainingPathDto trainingPathDto = TrainingPathDto.builder().imageUrl(trainingPath.getImageUrl()).build();
        trainingPathTranslation.setTemplate(TemplateGenerationHelper.generateTrainingPathTemplate(trainingPathDto, trainingPathTranslationDto));
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

    public void updateTrainingPathTranslationTemplate(Long trainingPathTranslationId, String content) {
        trainingPathTranslationDao.updateTrainingPathTranslationTemplate(trainingPathTranslationId, content);
    }

    public String getTrainingPathTranslationTemplate(Long trainingPathTranslationId) {
        return trainingPathTranslationDao.getTrainingPathTranslationTemplate(trainingPathTranslationId);
    }

    public String getTrainingPathTranslationTemplate(Long trainingPathId, Language currentLang) {
        return trainingPathTranslationDao.getTrainingPathTranslationTemplate(trainingPathId, currentLang);
    }


}
