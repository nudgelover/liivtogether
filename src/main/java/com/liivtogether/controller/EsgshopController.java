package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/esgshop")
public class EsgshopController {
	
    String dir = "esgshop/";
    @RequestMapping("")
    public String esgshop(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
    @RequestMapping("/detail")
    public String detail(Model model) throws Exception {
    	 model.addAttribute("center", dir + "detail");
        return "index";
    }
}