package org.agrisud.elearningAPI.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.agrisud.elearningAPI.enums.CourseType;

import java.sql.ResultSet;
import java.sql.SQLException;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    private Long id;
    private String title;
    private int courseHours;
    private int courseMinutes;
    private String supportUrl;
    private String supportPath;
    private CourseType courseType;
    private Long moduleId;

    public static Course baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        Course event = new Course();
        event.setId(resultSet.getLong("course_id"));
        event.setTitle(resultSet.getString("course_title"));
        event.setCourseHours(resultSet.getInt("course_hours"));
        event.setCourseMinutes(resultSet.getInt("course_minutes"));
        event.setSupportUrl(resultSet.getString("course_support_url"));
        event.setSupportPath(resultSet.getString("course_support_path"));
        event.setCourseType(CourseType.valueOf(resultSet.getString("course_type")));
        event.setModuleId(resultSet.getLong("module_id"));
        return event;
    }
}
