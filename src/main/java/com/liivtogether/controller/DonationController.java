package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/donation")
public class DonationController {
	
    String dir = "donation/";
    @RequestMapping("")
    public String donation(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
    @RequestMapping("/detail")
    public String detail(Model model) throws Exception {
    	 model.addAttribute("center", dir + "detail");
        return "index";
    }
}