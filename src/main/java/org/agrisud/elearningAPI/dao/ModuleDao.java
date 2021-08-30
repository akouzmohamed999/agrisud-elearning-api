package org.agrisud.elearningAPI.dao;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.model.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Properties;

@Repository
@Slf4j
public class ModuleDao {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    Properties sqlProperties;

    public List<Module> getModuleList() {
        return jdbcTemplate.query(sqlProperties.getProperty("module.get.all"), Module::baseMapper);
    }

    public List<Module> getModuleListByTrainingPathID(Long trainingPathID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("training_path_id", trainingPathID);
        return jdbcTemplate.query(sqlProperties.getProperty("module.get.all.training-path-id"), namedParameters, Module::baseMapper);
    }

    public Optional<Module> getModuleById(Long moduleID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("module_id", moduleID);
        Module module = null;
        try {
            module = jdbcTemplate.queryForObject(sqlProperties.getProperty("module.get.one"), namedParameters, Module::baseMapper);
        } catch (DataAccessException dataAccessException) {
            log.info("Module does not exist" + moduleID);
        }
        return Optional.ofNullable(module);
    }

    public long createNewModule(Module module) {
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource sqlParameterSource = this.initParams(module);
        int insert = jdbcTemplate.update(sqlProperties.getProperty("module.create"), sqlParameterSource, holder);
        if (insert == 1) {
            log.info("New Module created :" + module.getTitle());
            return holder.getKey().longValue();
        } else {
            log.error("Can not create module");
            return 0;
        }
    }

    public void updateModule(Module module) {
        SqlParameterSource sqlParameterSource = this.initParams(module);
        int update = jdbcTemplate.update(sqlProperties.getProperty("module.update"), sqlParameterSource);
        if (update == 1) {
            log.info("Module updated :" + module.getTitle());
        }
    }

    public void deleteModule(Long moduleID) {
        SqlParameterSource namedParameters = new MapSqlParameterSource("module_id", moduleID);
        int delete = jdbcTemplate.update(sqlProperties.getProperty("module.delete"), namedParameters);
        if (delete == 1) {
            log.info("Module deleted :" + moduleID);
        }
    }

    private SqlParameterSource initParams(Module module) {
        return new MapSqlParameterSource()
                .addValue("module_id", module.getId())
                .addValue("module_title", module.getTitle())
                .addValue("order_on_path", module.getOrderOnPath())
                .addValue("training_path_id", module.getTrainingPathID());
    }
}
