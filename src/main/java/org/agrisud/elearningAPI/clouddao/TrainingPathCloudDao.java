package org.agrisud.elearningAPI.clouddao;

import org.aarboard.nextcloud.api.NextcloudConnector;
import org.aarboard.nextcloud.api.filesharing.Share;
import org.aarboard.nextcloud.api.filesharing.SharePermissions;
import org.aarboard.nextcloud.api.filesharing.ShareType;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.File;

@Repository
public class TrainingPathCloudDao {

    @Autowired
    private NextcloudConnector connector;

    public PictureDto uploadTrainingPathPicture(File file, String fullFilePath) {
        connector.uploadFile(file, fullFilePath);
        return PictureDto.builder().url(getTrainingPathPicture(fullFilePath))
                .fullImagePath(fullFilePath).build();
    }

    public void deleteTrainingPathPicture(String fullFilePath) {
        connector.deleteFolder(fullFilePath);
    }

    public String getTrainingPathPicture(String path) {
        SharePermissions permissions = new SharePermissions(SharePermissions.SingleRight.READ);
        Share share = connector.doShare(path, ShareType.PUBLIC_LINK, null, false, null, permissions);
        return share.getUrl() + "/preview";
    }


}
