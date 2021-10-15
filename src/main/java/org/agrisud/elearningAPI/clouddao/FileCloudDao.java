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

@Repository
@Slf4j
public class FileCloudDao {

    @Autowired
    private NextcloudConnector connector;

    @Value("${cloud.server.name}")
    String serverName;

    @Value("${cloud.server.download-url}")
    String downloadUrl;

    public FileDto uploadFile(File file, String fullFilePath, Boolean isImage) {
        log.info("Starting UPLOAD.....");
        connector.uploadFile(file, fullFilePath);
        return FileDto.builder().fileUrl(getFileUrl(fullFilePath,isImage))
                .filePath(fullFilePath).build();
    }

    public void deleteFile(String fullFilePath) {
        connector.deleteFolder(fullFilePath);
    }

    public String getFileUrl(String path,Boolean isImage) {
        log.info("Starting SHARE LINK.....");
        SharePermissions permissions = new SharePermissions(SharePermissions.SingleRight.READ);
        Share share = connector.doShare(path, ShareType.PUBLIC_LINK, null, false, null, permissions);
        if(isImage) {
            return share.getUrl().replace(serverName, downloadUrl) + "/preview";
        }else{
            return share.getUrl().replace(serverName, downloadUrl);
        }
    }
}
