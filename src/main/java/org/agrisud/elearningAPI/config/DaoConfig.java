package org.agrisud.elearningAPI.config;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.ClassPathResource;

@Configuration
public class DaoConfig {

    @Bean
    @Primary
    public PropertiesFactoryBean sqlQueries() {
        PropertiesFactoryBean prop = new PropertiesFactoryBean();
        ClassPathResource[] resources = new ClassPathResource[]{
                new ClassPathResource("sql/course.properties"),
                new ClassPathResource("sql/module.properties"),
                new ClassPathResource("sql/training-path.properties"),
                new ClassPathResource("sql/user.properties"),
                new ClassPathResource("sql/training-path-translation.properties"),
                new ClassPathResource("sql/home-cover.properties"),
                new ClassPathResource("sql/home-cover-image.properties")
        };
        prop.setLocations(resources);
        prop.setIgnoreResourceNotFound(true);
        return prop;
    }
}
