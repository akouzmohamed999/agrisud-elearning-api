package org.agrisud.elearningapi.cloudservice;

import lombok.extern.slf4j.Slf4j;
import org.agrisud.elearningapi.clouddao.FileCloudDao;
import org.agrisud.elearningapi.dto.FileDto;
import org.agrisud.elearningapi.enums.SupportMode;
import org.agrisud.elearningapi.util.CloudFileHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Service
@Slf4j
public class FileCloudService {

    Map<SupportMode, String> supportMap = new HashMap<>();

    @Value("${cloud.trainingPath.pictures}")
    String trainingPathPictureFolder;
    @Value("${cloud.trainingPath.course.pdf}")
    String trainingPathCoursePDFFolder;
    @Value("${cloud.trainingPath.evaluation.pdf}")
    String trainingPathEvaluationPDFFolder;

    @PostConstruct
    public void init() {
        supportMap.put(SupportMode.IMAGE, trainingPathPictureFolder);
        supportMap.put(SupportMode.PDF, trainingPathCoursePDFFolder);
        supportMap.put(SupportMode.EVALUATION, trainingPathEvaluationPDFFolder);
    }

    @Autowired
    private FileCloudDao fileCloudDao;

    public FileDto uploadFile(MultipartFile file, SupportMode supportMode) {
        Optional<File> fileOptional = Optional.ofNullable(CloudFileHelper.getTempFileFromMultiPartFile(file));
        return fileOptional.map(storedFile -> {
            FileDto fileDto = fileCloudDao.uploadFile(storedFile,
                    getFileName(Objects.requireNonNull(file.getOriginalFilename()), supportMap.get(supportMode)),supportMode.equals(SupportMode.IMAGE));
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
                    getFileName(Objects.requireNonNull(file.getOriginalFilename()), supportMap.get(SupportMode.IMAGE)),true).getFileUrl();
            storedFile.delete();
            return url;
        }).orElseThrow(() -> new RuntimeException("Error while storing image/retrieve it's url"));
    }

    private String getFileName(String originalFilename, String path) {
        String fileName = originalFilename.substring(0, originalFilename.indexOf('.')) + CloudFileHelper.generateKey(10)
                + originalFilename.substring(originalFilename.indexOf('.'));
        return path.concat(fileName);
    }
}
