package org.agrisud.elearningAPI.model;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Module {
    private Long id;
    private String title;
    private int orderOnPath;
    private Long trainingPathID;

    public static Module baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        Module event = new Module();
        event.setId(resultSet.getLong("module_id"));
        event.setTitle(resultSet.getString("module_title"));
        event.setOrderOnPath(resultSet.getInt("order_on_path"));
        event.setTrainingPathID(resultSet.getLong("training_path_id"));
        return event;
    }
}
