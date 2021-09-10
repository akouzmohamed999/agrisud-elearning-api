package org.agrisud.elearningAPI.clouddao;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.aarboard.nextcloud.api.filesharing.Share;
import org.aarboard.nextcloud.api.filesharing.SharePermissions;
import org.aarboard.nextcloud.api.filesharing.ShareType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.File;

@Repository
public class HomeCoverImageCloudDao {

    @Autowired
    private NextcloudConnector connector;

    public String uploadHomeCoverImage(File file, String path) {
        connector.uploadFile(file, path);
        return getHomeCoverImage(path);
    }

    private String getHomeCoverImage(String path) {
        SharePermissions permissions = new SharePermissions(SharePermissions.SingleRight.READ);
        Share share = connector.doShare(path, ShareType.PUBLIC_LINK, null, false, null, permissions);
        return share.getUrl() + "/preview";
    }
}
