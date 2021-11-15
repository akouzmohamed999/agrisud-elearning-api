package org.agrisud.elearningAPI.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StatisticsData {
    private String label;
    private int key;
    private int value;

    public static StatisticsData fullMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        StatisticsData statisticsData = new StatisticsData();
        statisticsData.setLabel(resultSet.getString("label"));
        statisticsData.setKey(resultSet.getInt("dataKey"));
        statisticsData.setValue(resultSet.getInt("value"));
        return statisticsData;
    }

    public static StatisticsData labelValueMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        StatisticsData statisticsData = new StatisticsData();
        statisticsData.setLabel(resultSet.getString("label"));
        statisticsData.setValue(resultSet.getInt("value"));
        return statisticsData;
    }

    public static StatisticsData keyValueMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        StatisticsData statisticsData = new StatisticsData();
        statisticsData.setKey(resultSet.getInt("dataKey"));
        statisticsData.setValue(resultSet.getInt("value"));
        return statisticsData;
    }
}
