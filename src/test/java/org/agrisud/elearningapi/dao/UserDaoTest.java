package org.agrisud.elearningapi.dao;

import org.agrisud.elearningapi.model.Registration;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
class UserDaoTest {

    @Autowired
    NamedParameterJdbcTemplate jdbcTemplate;

     @Autowired
     UserDao userDao;

    @Test
    @Rollback
    public void shouldCreateUser() {

        assertThat(getUsersList()).isEmpty();

        Registration registration = new Registration();
        registration.setFirstName("Mohamed");
        registration.setLastName("akouz");
        registration.setBirthDate("1993-09-09");
        registration.setEmail("makouz@norsys.fr");
        registration.setNationality("MOROCCAN");
        registration.setOrganisation("Norsys");
        registration.setOccupation("Engineer");
        registration.setSex("MALE");
        userDao.createElearningUser("id_user", registration);

        assertThat(getUsersList()).isNotEmpty();
        assertThat(getUsersList()).hasSize(1);
    }

    private List<Map<String, Object>> getUsersList() {
        return jdbcTemplate.query("select * from elearning_user", (resultSet, i) -> {
            Map<String, Object> user = new HashMap<>();
            user.put("id", resultSet.getString("user_id"));
            return user;
        });
    }

}