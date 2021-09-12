package org.agrisud.elearningAPI.model;

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
    private Long trainingPathTranslationID;

    public static Module baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        Module module = new Module();
        module.setId(resultSet.getLong("module_id"));
        module.setTitle(resultSet.getString("module_title"));
        module.setOrderOnPath(resultSet.getInt("order_on_path"));
        module.setTrainingPathTranslationID(resultSet.getLong("training_path_translation_id"));
        return module;
    }
}
