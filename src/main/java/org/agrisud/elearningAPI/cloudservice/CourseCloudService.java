package org.agrisud.elearningAPI.cloudservice;

import org.agrisud.elearningAPI.clouddao.CourseCloudDao;
import org.agrisud.elearningAPI.dto.FileDto;
import org.agrisud.elearningAPI.enums.CourseType;
import org.agrisud.elearningAPI.util.CloudFileHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@Service
public class CourseCloudService {

    @Autowired
    private CourseCloudDao courseCloudDao;

    public AtomicReference<FileDto> uploadCourseSupport(MultipartFile file, CourseType courseType) {
        Optional<File> fileOptional = Optional.ofNullable(CloudFileHelper.getTempFileFromMultiPartFile(file));
        AtomicReference<FileDto> fileDtoAtomicReference = new AtomicReference<>(new FileDto());
        return fileOptional.map(storedFile -> {
            fileDtoAtomicReference.set(courseCloudDao.uploadCourseSupport(storedFile, getFileName(Objects.requireNonNull(file.getOriginalFilename()), courseType)));
            storedFile.delete();
            return fileDtoAtomicReference;
        }).orElseThrow(() -> new RuntimeException("Error while storing support/retrieve it's url"));
    }

    public void deleteCourseSupport(String fullFilePath) {
        this.courseCloudDao.deleteCourseSupport(fullFilePath);
    }

    private String getFileName(String originalFilename, CourseType courseType) {
        String courseFolderName = "";
        switch (courseType) {
            case PDF -> {
                courseFolderName = "PDF/";
                break;
            }
            case VIDEO -> {
                courseFolderName = "Video/";
                break;
            }
            case POWER_POINT -> {
                courseFolderName = "PowerPoint/";
                break;
            }
            default -> {
                courseFolderName = "Presentation/";
                break;
            }
        }

        String fileName = originalFilename.substring(0, originalFilename.indexOf('.')) + CloudFileHelper.generateKey(10);
        return "/Elearning/Course/" + courseFolderName + fileName + originalFilename.substring(originalFilename.indexOf('.'));
    }
}
