package org.agrisud.elearningAPI.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter
@Setter
public class Course {
    private Long id;
    private String title;
    private String description;

    public static Course baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        Course event = new Course();
        event.setId(resultSet.getLong("course_id"));
        event.setTitle(resultSet.getString("course_title"));
        event.setDescription(resultSet.getString("course_description"));
        return event;
    }

}
