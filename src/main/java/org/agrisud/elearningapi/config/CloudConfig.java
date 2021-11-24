package org.agrisud.elearningapi.config;


import lombok.extern.slf4j.Slf4j;
import org.aarboard.nextcloud.api.NextcloudConnector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class CloudConfig {

    @Value("${cloud.server.name}")
    String cloudServerName;

    @Value("${cloud.server.username}")
    String cloudServerUsername;

    @Value("${cloud.server.password}")
    String cloudServerPassword;

    @Bean
    public NextcloudConnector cloudConnector() {
        NextcloudConnector connector = new NextcloudConnector(cloudServerName, cloudServerUsername, cloudServerPassword);
        connector.trustAllCertificates(true);
        return connector;
    }
}