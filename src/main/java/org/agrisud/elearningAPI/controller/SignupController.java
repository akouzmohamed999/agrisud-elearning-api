package org.agrisud.elearningAPI.controller;

import org.agrisud.elearningAPI.model.Registration;
import org.agrisud.elearningAPI.service.SignupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/signup")
public class SignupController {

    @Autowired
    SignupService signupService;

    @PostMapping
    public ResponseEntity<Void> registerNewUser(@RequestBody Registration registration) {
        signupService.createCandidateUser(registration);
        return ResponseEntity.ok().build();
    }
}
