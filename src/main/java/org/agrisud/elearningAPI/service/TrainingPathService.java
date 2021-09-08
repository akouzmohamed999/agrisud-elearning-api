package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.TrainingPathDao;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TrainingPathService {

    @Autowired
    private TrainingPathDao trainingPathDao;

    public List<TrainingPath> getTrainingPathList() {
        return this.trainingPathDao.getTrainingPathList();
    }

    public Page<TrainingPath> getTrainingPathListPerPage(int page,int size){
        PageRequest pageRequest = PageRequest.of(page, size);
        return this.trainingPathDao.getTrainingPathListPerPage(pageRequest);
    }


    public Optional<TrainingPath> getTrainingPathByID(Long trainingPathId) {
        return this.trainingPathDao.getTrainingPathById(trainingPathId);
    }

    public long createNewTrainingPath(TrainingPath trainingPath) {
        return this.trainingPathDao.createNewTrainingPath(trainingPath);
    }

    public void updateTrainingPath(TrainingPath trainingPath) {
        this.trainingPathDao.updateTrainingPath(trainingPath);
    }

    public void deleteTrainingPath(Long trainingPathId) {
        this.trainingPathDao.deleteTrainingPath(trainingPathId);
    }
}
