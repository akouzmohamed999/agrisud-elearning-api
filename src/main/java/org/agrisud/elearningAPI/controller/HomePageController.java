package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.service.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/homepage")
public class HomePageController {

    @Autowired
    HomePageService homePageService;

    @PostMapping("/image/upload")
    public ResponseEntity<Map<String, String>> upload(@RequestParam("file") MultipartFile file) throws IllegalStateException {
        HashMap<String, String> response = new HashMap<>();
        String uri = homePageService.downloadImage(homePageService.uploadImage(file));
        response.put("uploaded", "true");
        response.put("url", uri);
        response.put("default", uri);
        return ResponseEntity.ok().body(response);
    }

}
