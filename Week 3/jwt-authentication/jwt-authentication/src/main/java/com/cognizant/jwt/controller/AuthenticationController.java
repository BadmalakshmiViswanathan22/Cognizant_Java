package com.cognizant.jwt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.jwt.model.AuthenticationResponse;
import com.cognizant.jwt.util.JwtUtil;

@RestController
public class AuthenticationController {

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/authenticate")
    public AuthenticationResponse authenticate() {

        String token = jwtUtil.generateToken("user");

        return new AuthenticationResponse(token);
    }
}