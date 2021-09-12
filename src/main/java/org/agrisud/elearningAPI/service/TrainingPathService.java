package org.agrisud.elearningAPI.service;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.dao.TrainingPathDao;
import org.agrisud.elearningAPI.dao.UserDao;
import org.agrisud.elearningAPI.model.TrainingPath;
import org.agrisud.elearningAPI.security.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class TrainingPathService {

    @Autowired
    private TrainingPathDao trainingPathDao;
    @Autowired
    UserDao userDao;

    public List<TrainingPath> getTrainingPathList() {
        return this.trainingPathDao.getTrainingPathList();
    }

    public Page<TrainingPath> getTrainingPathListPerPage(int page, int size) {
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

    public Page<TrainingPath> getTrainingPathListByUser(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        User loggedInUser = User.getLoggedInUser();
        return this.trainingPathDao.getTrainingPathListByUser(pageRequest, loggedInUser.getUserId());
    }

    public Page<TrainingPath> getTrainingPathListNotUsers(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        User loggedInUser = User.getLoggedInUser();
        return this.trainingPathDao.getTrainingPathListNotUsers(pageRequest, loggedInUser.getUserId());
    }

    public void addTrainingPathToUser(Long trainingPathId) {
        User loggedInUser = User.getLoggedInUser();
        log.info(loggedInUser.getUserId() != null ? loggedInUser.getUserId() : "Nada");
        userDao.addTrainingPathToUser(trainingPathId, loggedInUser.getUserId());
    }


}
