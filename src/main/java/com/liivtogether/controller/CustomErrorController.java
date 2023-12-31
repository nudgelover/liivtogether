package com.liivtogether.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;



@ControllerAdvice
public class CustomErrorController {
    @ExceptionHandler(Exception.class)
    public String except(Exception e, Model model){
        model.addAttribute("msg",e.getMessage());
        model.addAttribute("center","errorpage");
        return "index";
    }
}