package org.agrisud.elearningAPI.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.agrisud.elearningAPI.enums.CourseType;
import org.agrisud.elearningAPI.enums.Language;

import java.sql.ResultSet;
import java.sql.SQLException;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    private Long id;
    private String title;
    private CourseType courseType;
    private Language language;
    private Long moduleId;

    public static Course baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        Course event = new Course();
        event.setId(resultSet.getLong("course_id"));
        event.setTitle(resultSet.getString("course_title"));
        event.setCourseType(CourseType.valueOf(resultSet.getString("course_type")));
        event.setLanguage(Language.valueOf(resultSet.getString("course_language")));
        event.setModuleId(resultSet.getLong("module_id"));
        return event;
    }
}
