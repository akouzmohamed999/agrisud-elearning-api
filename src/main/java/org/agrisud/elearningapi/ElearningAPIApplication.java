package org.agrisud.elearningapi;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Profile;

import javax.annotation.PostConstruct;

@SpringBootApplication
public class ElearningAPIApplication {

	public static void main(String[] args) {
		SpringApplication.run(ElearningAPIApplication.class, args);
	}

}
