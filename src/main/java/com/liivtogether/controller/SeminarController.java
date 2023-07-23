package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/seminar")
public class SeminarController {
	
    String dir = "seminar/";
    @RequestMapping("")
    public String seminar(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
    @RequestMapping("/detail")
    public String detail(Model model) throws Exception {
    	 model.addAttribute("center", dir + "detail");
        return "index";
    }
}