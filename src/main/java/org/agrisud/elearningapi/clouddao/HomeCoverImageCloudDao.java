package org.agrisud.elearningapi.clouddao;

import lombok.extern.slf4j.Slf4j;
import org.aarboard.nextcloud.api.NextcloudConnector;
import org.aarboard.nextcloud.api.filesharing.Share;
import org.aarboard.nextcloud.api.filesharing.SharePermissions;
import org.aarboard.nextcloud.api.filesharing.ShareType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.io.File;

@Repository
@Slf4j
public class HomeCoverImageCloudDao {

    @Autowired
    private NextcloudConnector connector;

    @Value("${cloud.server.name}")
    String serverName;

    @Value("${cloud.server.download-url}")
    String downloadUrl;

    public String uploadHomeCoverImage(File file, String path) {
        connector.uploadFile(file, path);
        return getHomeCoverImage(path);
    }

    private String getHomeCoverImage(String path) {
        SharePermissions permissions = new SharePermissions(SharePermissions.SingleRight.READ);
        Share share = connector.doShare(path, ShareType.PUBLIC_LINK, null, false, null, permissions);
        return share.getUrl().replace(serverName, downloadUrl) + "/preview";
    }
}
