package org.agrisud.elearningAPI.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class HomePageService implements StorageService {

    @Value("${storage.homepage.image.folder}")
    String homepageImageFolder;

    @Override
    public String downloadImage(String fileName) {
        return defaultDownloadImageToFolder(fileName, homepageImageFolder);
    }

    @Override
    public String uploadImage(MultipartFile file) {
        return defaultUploadImageToFolder(file, homepageImageFolder);
    }
}
