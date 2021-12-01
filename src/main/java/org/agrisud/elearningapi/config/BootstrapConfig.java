package org.agrisud.elearningapi.config;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.annotation.PostConstruct;

@Configuration
@Profile("!test")
public class BootstrapConfig {
    @Value("${cloud.elearning.base-folder}")
    String cloudElearningBaseFolder;

    @Value("${cloud.elearning.training-path.base-folder}")
    String cloudElearningTrainingPathBaseFolder;

    @Value("${cloud.elearning.training-path.course.base-folder}")
    String cloudElearningTrainingPathCourseBaseFolder;

    @Value("${cloud.elearning.training-path.evaluation.base-folder}")
    String cloudElearningTrainingPathEvaluationBaseFolder;

    @Value("${cloud.elearning.training-path.pictures}")
    String cloudElearningTrainingPathPictureFolder;

    @Value("${cloud.elearning.training-path.course.pdf}")
    String cloudElearningTrainingPathCoursePDFFolder;

    @Value("${cloud.elearning.training-path.evaluation.pdf}")
    String cloudElearningTrainingPathEvaluationPDFFolder;

    @Autowired
    NextcloudConnector connector;

    @PostConstruct
    public void initCloudFolders() {
        if(!connector.folderExists(cloudElearningBaseFolder)){
            connector.createFolder(cloudElearningBaseFolder);
        }

        if(!connector.folderExists(cloudElearningTrainingPathBaseFolder)){
            connector.createFolder(cloudElearningTrainingPathBaseFolder);
        }

        if(!connector.folderExists(cloudElearningTrainingPathCourseBaseFolder)){
            connector.createFolder(cloudElearningTrainingPathCourseBaseFolder);
        }

        if(!connector.folderExists(cloudElearningTrainingPathEvaluationBaseFolder)){
            connector.createFolder(cloudElearningTrainingPathEvaluationBaseFolder);
        }

        if(!connector.folderExists(cloudElearningTrainingPathPictureFolder)){
            connector.createFolder(cloudElearningTrainingPathPictureFolder);
        }

        if(!connector.folderExists(cloudElearningTrainingPathCoursePDFFolder)){
            connector.createFolder(cloudElearningTrainingPathCoursePDFFolder);
        }

        if(!connector.folderExists(cloudElearningTrainingPathEvaluationPDFFolder)){
            connector.createFolder(cloudElearningTrainingPathEvaluationPDFFolder);
        }
    }
}
