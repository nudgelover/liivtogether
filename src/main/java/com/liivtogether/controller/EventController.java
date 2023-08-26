package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/event")
public class EventController {
	
    String dir = "event/";
    @RequestMapping("")
    public String event(Model model) throws Exception {
    	 model.addAttribute("center", dir + "main");
        return "index";
    }
 
    @RequestMapping("/card")
    public String card(Model model) throws Exception {
    	 model.addAttribute("center", dir + "card");
        return "index";
    }
    
    @RequestMapping("/whackamole")
    public String whackamole(Model model) throws Exception {
    	 model.addAttribute("center", dir + "whackamole");
        return "index";
    }
    


    @RequestMapping("/attend")
    public String attend(Model model) throws Exception {
    	 model.addAttribute("center", dir + "attend");
        return "index";
    }

    @RequestMapping("/ad")
    public String ad(Model model) throws Exception {
    	 model.addAttribute("center", dir + "ad");
        return "index";
    }
    

    @RequestMapping("/fourcut")
    public String fourcut(Model model) throws Exception {
    	 model.addAttribute("center", dir + "fourcut");
        return "index";
    }
}