package org.agrisud.elearningAPI.clouddao;

import lombok.extern.slf4j.Slf4j;
import org.aarboard.nextcloud.api.NextcloudConnector;
import org.aarboard.nextcloud.api.filesharing.Share;
import org.aarboard.nextcloud.api.filesharing.SharePermissions;
import org.aarboard.nextcloud.api.filesharing.ShareType;
import org.agrisud.elearningAPI.dto.FileDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.io.File;

@Slf4j
@Repository
public class CourseCloudDao {

    @Autowired
    NextcloudConnector connector;

    @Value("${cloud.server.name}")
    String serverName;

    @Value("${cloud.server.download-url}")
    String downloadUrl;

    public FileDto uploadCourseSupport(File file, String fullFilePath) {
        log.info("Starting UPLOAD.....");
        connector.uploadFile(file, fullFilePath);
        return FileDto.builder().fileUrl(getCourseSupport(fullFilePath))
                .filePath(fullFilePath).build();
    }

    public void deleteCourseSupport(String fullFilePath) {
        log.info("Starting DELETE.....");
        connector.deleteFolder(fullFilePath);
    }

    public String getCourseSupport(String path) {
        log.info("Starting SHARE LINK.....");
        SharePermissions permissions = new SharePermissions(SharePermissions.SingleRight.READ);
        Share share = connector.doShare(path, ShareType.PUBLIC_LINK, null, false, null, permissions);
        return share.getUrl().replace(serverName, downloadUrl);
    }
}
