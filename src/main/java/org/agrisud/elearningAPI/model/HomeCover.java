package org.agrisud.elearningAPI.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@EqualsAndHashCode
public class HomeCover {
    private long id;
    private String titre;
    private String description;
    private String type;
    private List<HomeCoverImage> homeCoverImages;

    public static HomeCover baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        HomeCover homeCover = new HomeCover();
        homeCover.setId(resultSet.getLong("home_cover_id"));
        homeCover.setTitre(resultSet.getString("home_cover_titre"));
        homeCover.setDescription(resultSet.getString("home_cover_description"));
        homeCover.setType(resultSet.getString("home_cover_type"));
        homeCover.setHomeCoverImages(new ArrayList<>());
        return homeCover;
    }
}
