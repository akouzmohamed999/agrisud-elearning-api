package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.StatisticsDao;
import org.agrisud.elearningAPI.model.StatisticsData;
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

    public List<StatisticsData> getNbrUsersByNbrTrainingPaths() {
        return statisticsDao.getNbrUsersByNbrTrainingPaths();
    }

    public List<StatisticsData> getNbrUsersByCompletedTrainingPaths(String language) {
        return statisticsDao.getNbrUsersByCompletedTrainingPaths(language);
    }

    public Map<String, List<StatisticsData>> getUsersIndicators() {
        return new HashMap<>() {{
            put("signup_nationality", statisticsDao.getNbrUsersByNationality());
            put("age", statisticsDao.getNbrUsersByAge());
            put("signup_genre", statisticsDao.getNbrUsersByGenre());
            put("signup_occupation", statisticsDao.getNbrUsersByOccupation());
            put("establishment", statisticsDao.getNbrUsersByEstablishment());
        }};
    }

    public Map<String, List<StatisticsData>> getTrainingPathsIndicators(String language) {
        return new HashMap<>() {{
            put("training_path", statisticsDao.getNbrUsersByTrainingPath(language));
            put("registered_users_by_nationality", statisticsDao.getNbrRegisteredUsersByNationality());
        }};
    }

    public Map<String, List<StatisticsData>> getNbrRegisteredUsersByMonth() {
        return new HashMap<>() {{
            put("all", statisticsDao.getNbrRegisteredUsersByMonth());
            put("by_nationality", statisticsDao.getNbrRegisteredUsersByMonthByNationality());
        }};
    }
}
