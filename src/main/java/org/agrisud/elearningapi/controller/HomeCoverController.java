package org.agrisud.elearningapi.controller;

import org.agrisud.elearningapi.model.HomeCover;
import org.agrisud.elearningapi.service.HomeCoverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping
    public ResponseEntity<HomeCover> getHomeCover() {
        return homeCoverService.getHomeCover().map(ResponseEntity::ok).orElse(ResponseEntity.badRequest().build());
    }

}
