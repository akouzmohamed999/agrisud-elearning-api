package org.agrisud.elearningapi.model;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Module {
    private Long id;
    private String title;
    private int orderOnPath;
    private String moduleDuration;
    private Long trainingPathTranslationID;

    public static Module baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        Module module = new Module();
        module.setId(resultSet.getLong("module_id"));
        module.setTitle(resultSet.getString("module_title"));
        module.setOrderOnPath(resultSet.getInt("order_on_path"));
        module.setTrainingPathTranslationID(resultSet.getLong("training_path_translation_id"));
        module.setModuleDuration(resultSet.getString("module_duration"));
        return module;
    }
}
