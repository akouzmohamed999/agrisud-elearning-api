package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.HomeCover;
import org.agrisud.elearningAPI.service.HomeCoverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/homeCover")
public class HomeCoverController {

    @Autowired
    HomeCoverService homeCoverService;

    @Transactional
    @PostMapping
    public ResponseEntity<Long> insertHomeCover(@RequestBody HomeCover homeCover) {
        return homeCoverService.insertHomeCover(homeCover).map(ResponseEntity::ok).orElse(ResponseEntity.badRequest().build());
    }

}
