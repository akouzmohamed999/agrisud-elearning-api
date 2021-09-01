package org.agrisud.elearningAPI.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Random;

public class CloudFileHelper {

    private static final Random RANDOM = new SecureRandom();
    private static final String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

    public static File getTempFileFromMultiPartFile(MultipartFile multipartFile) {
        String fullFileName = multipartFile.getOriginalFilename();
        File file = null;
        try {
            String fileName = fullFileName.substring(0, fullFileName.indexOf('.')) + generateKey(10);
            String extension = fullFileName.substring(fullFileName.indexOf('.') + 1);
            file = File.createTempFile(fileName, extension);
            multipartFile.transferTo(file);
        } catch (IOException e) {
//            log.error("Error while trying to get file from multiPartFile", e);
        }
        return file;
    }

    public static String generateKey(int stringSize) {
        StringBuilder returnValue = new StringBuilder("_");

        for (int i = 0; i < stringSize; i++) {
            returnValue.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
        }
        return new String(returnValue);
    }
}
