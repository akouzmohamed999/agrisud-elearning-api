package org.agrisud.elearningapi.model;

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
public class TrainingPathsUsers {
    private int nbrTrainingPaths;
    private int nbrUsers;

    public static TrainingPathsUsers baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        TrainingPathsUsers trainingPathsUsers = new TrainingPathsUsers();
        trainingPathsUsers.setNbrTrainingPaths(resultSet.getInt("number_training_paths"));
        trainingPathsUsers.setNbrUsers(resultSet.getInt("number_users"));
        return trainingPathsUsers;
    }
}
