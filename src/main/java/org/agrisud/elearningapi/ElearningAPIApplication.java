package org.agrisud.elearningapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ElearningAPIApplication {


//	@PostConstruct
//	@Profile("!test")
//	public void initCloudFolders() {
//		if(!connector.folderExists("/Elearning")){
//			connector.createFolder("/Elearning");
//		}
//
//		if(!connector.folderExists("/Elearning/Course")){
//			connector.createFolder("/Elearning/Course");
//		}
//
//		if(!connector.folderExists("/Elearning/Course/PDF")){
//			connector.createFolder("/Elearning/Course/PDF");
//		}
//
//		if(!connector.folderExists("/Elearning/TrainingPath")){
//			connector.createFolder("/Elearning/TrainingPath");
//		}
//
//		if(!connector.folderExists("/Elearning/TrainingPath/Pictures")){
//			connector.createFolder("/Elearning/TrainingPath/Pictures");
//		}
//	}

	public static void main(String[] args) {
		SpringApplication.run(ElearningAPIApplication.class, args);
	}

}
