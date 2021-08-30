package org.agrisud.elearningAPI.dao;

import org.agrisud.elearningAPI.model.Module;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Sql(scripts = {"classpath:dao/module-test.sql"},
        config = @SqlConfig(encoding = "utf-8", transactionMode = SqlConfig.TransactionMode.ISOLATED))
public class ModuleDaoTest {
    @Autowired
    private ModuleDao moduleDao;

    Module module = new Module();
    String module1 = "module 1";
    String module4 = "module 4";

    @BeforeEach
    public void setUp() throws Exception {
        module = Module.builder().id(4L).orderOnPath(1).title(module4).build();
    }


    @Test
    public void shouldReturnAllModules() {
        List<Module> moduleList = moduleDao.getModuleList();
        assertThat(moduleList).isNotEmpty();
        assertThat(moduleList).hasSize(3);
        assertThat(moduleList.get(0).getTitle()).isEqualTo(module1);
    }

    @Test
    public void shouldReturnModulesByTrainingPathID() {
        List<Module> moduleList = moduleDao.getModuleListByTrainingPathID(100L);
        assertThat(moduleList).isNotEmpty();
        assertThat(moduleList).hasSize(2);
        assertThat(moduleList.get(0).getTitle()).isEqualTo(module1);
    }

    @Test
    public void shouldGetModuleByID() {
        Optional<Module> module = moduleDao.getModuleById(1L);
        assertThat(module).isNotNull();
        assertThat(module.get().getTitle()).isEqualTo(module1);
    }

    @Test()
    public void shouldGetModuleByIdThrowException() {
        Assertions.assertThrows(NoSuchElementException.class, () -> {
            Optional<Module> module = moduleDao.getModuleById(5L);
            assertThat(module).isNotNull();
            assertThat(module.get().getTitle()).isEqualTo(module1);
        });

    }

    @Test
    public void shouldCreateNewModule() {

        long id = moduleDao.createNewModule(module);
        assertThat(moduleDao.getModuleList()).hasSize(4);
        assertThat(moduleDao.getModuleById(id).get().getTitle()).isEqualTo(module4);
    }

    @Test
    public void shouldUpdateModule() {
        String moduleTitle = "module";
        Module module2 = Module.builder().id(1L).orderOnPath(1).title(moduleTitle).trainingPathID(100L).build();
        moduleDao.updateModule(module2);
        assertThat(moduleDao.getModuleList()).hasSize(3);
        assertThat(moduleDao.getModuleById(1L).get().getTitle()).isEqualTo(moduleTitle);
    }

    @Test
    public void shouldDeleteTrainingPath() {
        moduleDao.deleteModule(3L);
        assertThat(moduleDao.getModuleList()).hasSize(2);
    }
}
