package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
    String dir = "mypage/";
    @RequestMapping("")
    public String donation(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
 
}