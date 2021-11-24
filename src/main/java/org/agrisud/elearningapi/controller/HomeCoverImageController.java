package org.agrisud.elearningapi.controller;

import org.agrisud.elearningapi.cloudservice.HomeCoverImageCloudService;
import org.agrisud.elearningapi.model.HomeCover;
import org.agrisud.elearningapi.model.HomeCoverImage;
import org.agrisud.elearningapi.service.HomeCoverImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/homeCoverImage")
public class HomeCoverImageController {

    @Autowired
    HomeCoverImageCloudService homeCoverImageCloudService;

    @Autowired
    HomeCoverImageService homeCoverImageService;

    @Transactional
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> uploadHomeCoverImage(@RequestParam("file") MultipartFile file, @RequestParam("homeCoverID") long homeCoverID) {
        String url = homeCoverImageCloudService.uploadHomeCoverImage(file);
        HomeCoverImage homeCoverImage = new HomeCoverImage();
        homeCoverImage.setUrl(url);
        HomeCover homeCover = new HomeCover();
        homeCover.setId(homeCoverID);
        homeCoverImage.setHomeCover(homeCover);
        homeCoverImageService.insertHomeCoverImage(homeCoverImage);
        return new ResponseEntity<>(url, HttpStatus.OK);
    }
}
