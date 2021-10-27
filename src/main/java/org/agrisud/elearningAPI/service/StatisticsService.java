package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.StatisticsDao;
import org.agrisud.elearningAPI.model.StatisticsData;
import org.agrisud.elearningAPI.model.TrainingPathsUsers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsService {

    @Autowired
    private StatisticsDao statisticsDao;

    public Integer getNumberOfRegisteredUsers() {
        return statisticsDao.getNumberOfRegisteredUsers();
    }

    public List<TrainingPathsUsers> getNbrUsersByNbrTrainingPaths() {
        return statisticsDao.getNbrUsersByNbrTrainingPaths();
    }

    public Map<String, List<StatisticsData>> getUsersIndicators() {
        return new HashMap<>() {{
            put("nationality", statisticsDao.getNbrUsersByNationality());
            put("genre", statisticsDao.getNbrUsersByGenre());
            put("occupation", statisticsDao.getNbrUsersByOccupation());
            put("establishment", statisticsDao.getNbrUsersByEstablishment());
        }};
    }

    public Map<String, List<StatisticsData>> getTrainingPathsIndicators(String language) {
        return new HashMap<>() {{
            put("trainingPath", statisticsDao.getNbrUsersByTrainingPath(language));
            put("registredUsersByNationality", statisticsDao.getNbrRegistredUsersByNationality());
        }};
    }
}
