package org.agrisud.elearningapi.controller;

import org.agrisud.elearningapi.model.Registration;
import org.agrisud.elearningapi.service.SignupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/signup")
public class SignupController {

    @Autowired
    SignupService signupService;

    @PostMapping
    public ResponseEntity<Void> registerNewUser(@RequestParam(required = false) Long trainingPathId, @RequestBody Registration registration) {
        signupService.createCandidateUser(trainingPathId, registration);
        return ResponseEntity.ok().build();
    }
}
