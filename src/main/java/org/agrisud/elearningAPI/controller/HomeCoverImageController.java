package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.cloudservice.HomeCoverImageCloudService;
import org.agrisud.elearningAPI.model.HomeCover;
import org.agrisud.elearningAPI.model.HomeCoverImage;
import org.agrisud.elearningAPI.service.HomeCoverImageService;
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
    public ResponseEntity<Void> uploadHomeCoverImage(@RequestParam("file") MultipartFile file, @RequestParam("homeCoverID") long homeCoverID) {
        HomeCoverImage homeCoverImage = new HomeCoverImage();
        homeCoverImage.setUrl(homeCoverImageCloudService.uploadHomeCoverImage(file));
        HomeCover homeCover = new HomeCover();
        homeCover.setId(homeCoverID);
        homeCoverImage.setHomeCover(homeCover);
        homeCoverImageService.insertHomeCoverImage(homeCoverImage);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
