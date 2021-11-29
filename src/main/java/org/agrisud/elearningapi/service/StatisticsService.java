package org.agrisud.elearningapi.service;

import org.agrisud.elearningapi.dao.StatisticsDao;
import org.agrisud.elearningapi.model.StatisticsData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsService {

    @Autowired
    private StatisticsDao statisticsDao;

    public Integer getNumberOfRegisteredUsers(int year) {
        return statisticsDao.getNumberOfRegisteredUsers(year);
    }

    public List<StatisticsData> getNbrUsersByNbrTrainingPaths(int year) {
        return statisticsDao.getNbrUsersByNbrTrainingPaths(year);
    }

    public List<StatisticsData> getNbrUsersByCompletedTrainingPaths(String language, int year) {
        return statisticsDao.getNbrUsersByCompletedTrainingPaths(language, year);
    }

    public Map<String, List<StatisticsData>> getUsersIndicators(int year) {
        return new HashMap<>() {{
            put("signup_nationality", statisticsDao.getNbrUsersByNationality(year));
            put("age", statisticsDao.getNbrUsersByAge(year));
            put("signup_genre", statisticsDao.getNbrUsersByGenre(year));
            put("signup_occupation", statisticsDao.getNbrUsersByOccupation(year));
            put("establishment", statisticsDao.getNbrUsersByEstablishment(year));
        }};
    }

    public Map<String, List<StatisticsData>> getTrainingPathsIndicators(String language, int year) {
        return new HashMap<>() {{
            put("training_path", statisticsDao.getNbrUsersByTrainingPath(language, year));
            put("registered_users_by_nationality", statisticsDao.getNbrRegisteredUsersByNationality(year));
        }};
    }

    public Map<String, List<StatisticsData>> getNbrRegisteredUsersByMonth(int year) {
        return new HashMap<>() {{
            put("all", statisticsDao.getNbrRegisteredUsersByMonth(year));
            put("by_nationality", statisticsDao.getNbrRegisteredUsersByMonthByNationality(year));
        }};
    }
}
