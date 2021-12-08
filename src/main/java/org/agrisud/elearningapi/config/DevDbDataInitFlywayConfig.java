package org.agrisud.elearningapi.config;

import org.flywaydb.core.api.callback.Callback;
import org.flywaydb.core.api.callback.Context;
import org.flywaydb.core.api.callback.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.flyway.FlywayConfigurationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.datasource.init.ScriptUtils;

import javax.sql.DataSource;

@Profile("dev")
@Configuration
public class DevDbDataInitFlywayConfig {

    @Autowired
    private ResourceLoader resourceLoader;

    @Autowired
    DataSource dataSource;

    @Bean
    public FlywayConfigurationCustomizer flywayConfigurationCustomizer() {
        return configuration -> configuration.callbacks(new DevDbDataInitFlywayCallback());
    }

    public class DevDbDataInitFlywayCallback implements Callback {

        @Override
        public boolean canHandleInTransaction(Event event, Context context) {
            return supports(event, context);
        }

        @Override
        public void handle(Event arg0, Context arg1) {
            ScriptUtils.executeSqlScript(DataSourceUtils.getConnection(dataSource),
                    resourceLoader.getResource("classpath:db/dev/dev-data.sql"));
        }

        @Override
        public String getCallbackName() {
            return "dev";
        }

        @Override
        public boolean supports(Event event, Context context) {
            return event == Event.AFTER_MIGRATE;
        }
    }
}
