package org.agrisud.elearningAPI.cloudservice;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningAPI.clouddao.TrainingPathCloudDao;
import org.agrisud.elearningAPI.dto.PictureDto;
import org.agrisud.elearningAPI.util.CloudFileHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@Service
@Slf4j
public class TrainingPathCloudService {

    @Autowired
    private TrainingPathCloudDao trainingPathCloudDao;

    public PictureDto uploadTrainingPathPicture(MultipartFile file) {
        Optional<File> fileOptional = Optional.ofNullable(CloudFileHelper.getTempFileFromMultiPartFile(file));
        AtomicReference<PictureDto> pictureDto = new AtomicReference<>(new PictureDto());
        fileOptional.ifPresent(file1 -> {
            pictureDto.set(trainingPathCloudDao.uploadTrainingPathPicture(file1, getFileName(Objects.requireNonNull(file.getOriginalFilename()))));
            file1.delete();
        });
        return pictureDto.get();
    }

    public void deleteTrainingPathPicture(String fullImagePath){
        trainingPathCloudDao.deleteTrainingPathPicture(fullImagePath);
    }

    public String getTrainingPathPictureUrl(String path) {
        return this.trainingPathCloudDao.getTrainingPathPicture(path);
    }

    private String getFileName(String originalFilename) {
        String fileName = originalFilename.substring(0, originalFilename.indexOf('.')) + CloudFileHelper.generateKey(10);
        return "/TrainingPathPictures/" + fileName + originalFilename.substring(originalFilename.indexOf('.'));
    }
}
