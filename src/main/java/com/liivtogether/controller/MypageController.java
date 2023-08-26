package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
    String dir = "mypage/";
    @RequestMapping("")
    public String mypage(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
    
    @RequestMapping("/wish")
    public String wish(Model model) throws Exception {
    	 model.addAttribute("center", dir + "wish");
        return "index";
    }
 
 
}