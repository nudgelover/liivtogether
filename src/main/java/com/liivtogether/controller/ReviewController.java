package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/review")
public class ReviewController {
	
    String dir = "review/";
    @RequestMapping("")
    public String review(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
    @RequestMapping("/detail")
    public String detail(Model model) throws Exception {
    	 model.addAttribute("center", dir + "detail");
        return "index";
    }
}