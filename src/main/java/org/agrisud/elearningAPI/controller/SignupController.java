package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.Registration;
import org.agrisud.elearningAPI.service.SignupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/signup")
public class SignupController {

    @Autowired
    SignupService signupService;

    @PostMapping
    public ResponseEntity<Void> registerNewUser(@RequestParam Long trainingPathId, @RequestBody Registration registration) {
        signupService.createCandidateUser(trainingPathId, registration);
        return ResponseEntity.ok().build();
    }
}
