package org.agrisud.elearningapi.cloudservice;

import org.agrisud.elearningapi.clouddao.HomeCoverImageCloudDao;
import org.agrisud.elearningapi.util.CloudFileHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@Service
public class HomeCoverImageCloudService {

    @Autowired
    HomeCoverImageCloudDao homeCoverImageCloudDao;

    public String uploadHomeCoverImage(MultipartFile file) {
        Optional<File> fileOptional = Optional.ofNullable(CloudFileHelper.getTempFileFromMultiPartFile(file));
        AtomicReference<String> url = new AtomicReference<>("");
        fileOptional.ifPresent(f -> {
            url.set(homeCoverImageCloudDao.uploadHomeCoverImage(f,
                    getFileName(Objects.requireNonNull(file.getOriginalFilename()))));
        });
        return url.get();
    }

    private String getFileName(String originalFilename) {
        String fileName = originalFilename.substring(0, originalFilename.indexOf('.')) + CloudFileHelper.generateKey(10);
        return "/Elearning/HomeCover/Pictures/" + fileName + originalFilename.substring(originalFilename.indexOf('.'));
    }
}
