package org.agrisud.elearningAPI.config;


import lombok.extern.slf4j.Slf4j;
import org.aarboard.nextcloud.api.NextcloudConnector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@Slf4j
public class CloudConfig {

    @Value("${cloud.server.name}")
    String cloudServerName;

    @Value("${cloud.server.username}")
    String cloudServerUsername;

    @Value("${cloud.server.password}")
    String cloudServerPassword;

    @Profile("!prod")
    @Bean
    public NextcloudConnector cloudConnector() {
        return new NextcloudConnector(cloudServerName, cloudServerUsername, cloudServerPassword);
    }

    @Profile("prod")
    @Bean
    public NextcloudConnector prodCloudConnector() {
        log.info("CLOUD PROD is BEING USED");
        return new NextcloudConnector("agrisud-cloud", false, 80, cloudServerUsername, cloudServerPassword);
    }
}
