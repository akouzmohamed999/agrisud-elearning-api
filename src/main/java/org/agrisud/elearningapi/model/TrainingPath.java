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
public class TrainingPath {
    private Long id;
    private String imageUrl;
    private String fullImagePath;
    private Boolean status;
    private Boolean archived;

    public static TrainingPath baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        TrainingPath trainingPath = new TrainingPath();
        trainingPath.setId(resultSet.getLong("training_path_id"));
        trainingPath.setImageUrl(resultSet.getString("image_url"));
        trainingPath.setFullImagePath(resultSet.getString("full_image_path"));
        trainingPath.setStatus(resultSet.getBoolean("training_path_status"));
        trainingPath.setArchived(resultSet.getBoolean("archived"));
        return trainingPath;
    }
}
