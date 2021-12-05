package org.agrisud.elearningapi.service;

import org.agrisud.elearningapi.dao.StatisticsDao;
import org.agrisud.elearningapi.dao.UserDao;
import org.agrisud.elearningapi.model.StatisticsData;
import org.agrisud.elearningapi.model.TrainingPathTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class StatisticsService {

    @Autowired
    private StatisticsDao statisticsDao;
    @Autowired
    private UserDao userDao;

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

    public List<StatisticsData> getTheAverageTimeSpentByUsersToCompleteATrainingPath(String language, int year) {
        List<TrainingPathTranslation> trainingPathTranslationList = statisticsDao.getTrainingPathTranslationByYearAndLanguage(language, year);
        return trainingPathTranslationList.stream().map(trainingPathTranslation -> new StatisticsData(
                        trainingPathTranslation.getTitle(), 0,
                        userDao.getTheAverageTimeSpentByUsersToCompleteATrainingPath(trainingPathTranslation.getTrainingPathID()))
        ).collect(Collectors.toList());
    }
}
