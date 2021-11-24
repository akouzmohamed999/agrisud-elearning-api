package org.agrisud.elearningapi.model;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter
@Setter
@EqualsAndHashCode
public class HomeCoverImage {
    private long id;
    private String url;
    private HomeCover homeCover;

    public static HomeCoverImage baseMapper(ResultSet resultSet, int rowNumber) throws SQLException {
        HomeCoverImage homeCoverImage = new HomeCoverImage();
        homeCoverImage.setId(resultSet.getLong("home_cover_image_id"));
        homeCoverImage.setUrl(resultSet.getString("home_cover_image_url"));
        HomeCover homeCover = new HomeCover();
        homeCover.setId(resultSet.getLong("home_cover_id"));
        homeCoverImage.setHomeCover(homeCover);
        return homeCoverImage;
    }
}
