package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/faq")
public class FaqController {
	
    String dir = "faq/";
    @RequestMapping("")
    public String seminar(Model model) throws Exception {
    	 model.addAttribute("center", dir + "faqlist");
        return "index";
    }
 
}