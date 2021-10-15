package org.agrisud.elearningAPI.cloudservice;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.clouddao.FileCloudDao;
import org.agrisud.elearningAPI.dto.FileDto;
import org.agrisud.elearningAPI.util.CloudFileHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Objects;
import java.util.Optional;

@Service
@Slf4j
public class FileCloudService {

    @Autowired
    private FileCloudDao fileCloudDao;

    public FileDto uploadFile(MultipartFile file, Boolean isImage) {
        Optional<File> fileOptional = Optional.ofNullable(CloudFileHelper.getTempFileFromMultiPartFile(file));
        return fileOptional.map(storedFile -> {
            FileDto fileDto = fileCloudDao.uploadFile(storedFile,
                    getFileName(Objects.requireNonNull(file.getOriginalFilename()), isImage),isImage);
            storedFile.delete();
            return fileDto;
        }).orElseThrow(() -> new RuntimeException("Error while storing image/retrieve it's url"));
    }

    public void deleteFile(String fullImagePath) {
        fileCloudDao.deleteFile(fullImagePath);
    }

    public String uploadTrainingPathEditorImage(MultipartFile file) {
        Optional<File> fileOptional = Optional.ofNullable(CloudFileHelper.getTempFileFromMultiPartFile(file));
        return fileOptional.map(storedFile -> {
            String url = fileCloudDao.uploadFile(storedFile,
                    getFileName(Objects.requireNonNull(file.getOriginalFilename()), true),true).getFileUrl();
            storedFile.delete();
            return url;
        }).orElseThrow(() -> new RuntimeException("Error while storing image/retrieve it's url"));
    }

    private String getFileName(String originalFilename, Boolean isImage) {
        String fileName = originalFilename.substring(0, originalFilename.indexOf('.')) + CloudFileHelper.generateKey(10)
                + originalFilename.substring(originalFilename.indexOf('.'));
        if (isImage) {
            return "/Elearning/TrainingPath/Pictures/" + fileName;
        } else {
            return "/Elearning/Course/PDF/" + fileName;
        }
    }
}
