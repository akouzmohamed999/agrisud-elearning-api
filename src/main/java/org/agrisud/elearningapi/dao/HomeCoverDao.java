package org.agrisud.elearningapi.dao;

import org.agrisud.elearningapi.model.HomeCover;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Optional;
import java.util.Properties;

@Repository
public class HomeCoverDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public long insertHomeCover(HomeCover homeCover) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("homeCoverID", homeCover.getId())
                .addValue("homeCoverTitre", homeCover.getTitre())
                .addValue("homeCoverDescription", homeCover.getDescription())
                .addValue("homeCoverType", homeCover.getType());
        jdbcTemplate.update(sqlProperties.getProperty("insert.home.cover"), sqlParameterSource, keyHolder);
        return Optional.ofNullable(keyHolder.getKey()).map(Number::longValue).orElse(0L);
    }

    public Optional<HomeCover> getHomeCover() {
        return Optional.ofNullable(jdbcTemplate.queryForObject(sqlProperties.getProperty("get.home.cover"), new HashMap<>(), HomeCover::baseMapper));
    }
}
