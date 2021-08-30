package org.agrisud.elearningAPI.service;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public interface StorageService {

    Logger log = LoggerFactory.getLogger(StorageService.class);

    private void store(Path path, MultipartFile file, String fileName) {
        try {
            Files.copy(file.getInputStream(), path.resolve(fileName));
        } catch (Exception exception) {
            log.error("Store Error", exception);
        }
    }

    private String loadFile(Path path, String fileName) {
        return String.valueOf(path.resolve(fileName).toUri());
    }

    private String uploadImage(Path path, MultipartFile file) {
        store(path, file, file.getOriginalFilename());
        return file.getOriginalFilename();
    }

    private String downloadImage(Path path, String fileName) {
        fileName = fileName.substring(fileName.lastIndexOf('\\') + 1);
        return loadFile(path, fileName);
    }

    default String defaultUploadImageToFolder(MultipartFile file, String imageFolderName) {
        String filePath = FilenameUtils.getFullPath(imageFolderName)
                .concat(FilenameUtils.getName(imageFolderName));
        Path path = Paths.get(filePath);
        return uploadImage(path, file);
    }

    default String defaultDownloadImageToFolder(String fileName, String imageFolderName) {
        String filePath = FilenameUtils.getFullPath(imageFolderName)
                .concat(FilenameUtils.getName(imageFolderName));
        Path path = Paths.get(filePath);
        return downloadImage(path, fileName);
    }

    String downloadImage(String fileName);

    String uploadImage(MultipartFile file);
}
