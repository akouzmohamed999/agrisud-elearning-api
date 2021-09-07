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
public class TrainingPath {
    private Long id;
    private String imageUrl;
    private String fullImagePath;
    private int trainingPathTime;
    private Boolean status;

    public static TrainingPath baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        TrainingPath trainingPath = new TrainingPath();
        trainingPath.setId(resultSet.getLong("training_path_id"));
        trainingPath.setImageUrl(resultSet.getString("image_url"));
        trainingPath.setFullImagePath(resultSet.getString("full_image_path"));
        trainingPath.setTrainingPathTime(resultSet.getInt("training_path_time"));
        trainingPath.setStatus(resultSet.getBoolean("training_path_status"));
        return trainingPath;
    }
}
