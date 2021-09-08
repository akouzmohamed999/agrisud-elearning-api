package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.HomeCoverImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
@Slf4j
public class HomeCoverImageDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public void insertHomeCoverImage(HomeCoverImage homeCoverImage) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("homeCoverImageID", homeCoverImage.getId())
                .addValue("homeCoverImageURL", homeCoverImage.getUrl())
                .addValue("homeCoverID", homeCoverImage.getHomeCover().getId());
        jdbcTemplate.update(sqlProperties.getProperty("insert.home.cover.image.with.data"), sqlParameterSource, keyHolder);
    }

    public Optional<List<HomeCoverImage>> getHomeCoverImages(long homeCoverID) {
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource("homeCoverID", homeCoverID);
        return Optional.of(jdbcTemplate.query(sqlProperties.getProperty("get.home.cover.images"), sqlParameterSource, HomeCoverImage::baseMapper));
    }
}
