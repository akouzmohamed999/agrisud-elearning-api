package org.agrisud.elearningapi.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.agrisud.elearningapi.enums.Language;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrainingPathTranslation {
    private Long id;
    private String title;
    private String description;
    private String capacity;
    private String preRequest;
    private Language language;
    private String supportUrl;
    private String supportPath;
    private Long trainingPathID;
    private String template;
    private String trainingPathDuration;

    public static TrainingPathTranslation baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        TrainingPathTranslation trainingPathTranslation = new TrainingPathTranslation();
        trainingPathTranslation.setId(resultSet.getLong("training_path_translation_id"));
        trainingPathTranslation.setTitle(resultSet.getString("training_path_title"));
        trainingPathTranslation.setDescription(resultSet.getString("training_path_description"));
        trainingPathTranslation.setCapacity(resultSet.getString("capacity"));
        trainingPathTranslation.setPreRequest(resultSet.getString("pre_request"));
        trainingPathTranslation.setLanguage(Language.valueOf(resultSet.getString("language")));
        trainingPathTranslation.setSupportUrl(resultSet.getString("tpt_support_url"));
        trainingPathTranslation.setSupportPath(resultSet.getString("tpt_support_path"));
        trainingPathTranslation.setTrainingPathID(resultSet.getLong("training_path_id"));
        trainingPathTranslation.setTrainingPathDuration(resultSet.getString("training_path_duration"));
        return trainingPathTranslation;
    }
}
