package com.library.controller;

@Controller
public class LibraryController {

    @RequestMapping("/")
    public String home() {
        return "home";
    }
}