package org.agrisud.elearningAPI.model;

import lombok.Getter;
import lombok.Setter;
import org.agrisud.elearningAPI.enums.Language;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter
@Setter
public class TrainingPath {
    private Long id;
    private String title;
    private String imageUrl;
    private String description;
    private String capacity;
    private int trainingPathTime;
    private String preRequest;
    private Boolean status;
    private Language language;

    public static TrainingPath baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        TrainingPath event = new TrainingPath();
        event.setId(resultSet.getLong("training_path_id"));
        event.setTitle(resultSet.getString("training_path_title"));
        event.setImageUrl(resultSet.getString("image_url"));
        event.setDescription(resultSet.getString("training_path_description"));
        event.setCapacity(resultSet.getString("capacity"));
        event.setTrainingPathTime(resultSet.getInt("training_path_time"));
        event.setPreRequest(resultSet.getString("pre_request"));
        event.setStatus(resultSet.getBoolean("training_path_status"));
        event.setLanguage(Language.valueOf(resultSet.getString("training_path_language")));
        return event;
    }
}
