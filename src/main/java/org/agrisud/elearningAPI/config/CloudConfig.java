package org.agrisud.elearningAPI.config;


import org.aarboard.nextcloud.api.NextcloudConnector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CloudConfig {

    @Value("${cloud.server.name}")
    String cloudServerName;

    @Value("${cloud.server.username}")
    String cloudServerUsername;

    @Value("${cloud.server.password}")
    String cloudServerPassword;

    @Bean
    public NextcloudConnector cloudConnector() {
        return new NextcloudConnector(cloudServerName, cloudServerUsername, cloudServerPassword);
    }
}
