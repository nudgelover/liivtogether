package com.liivtogether.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.liivtogether.dto.*;
import com.liivtogether.service.*;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/donation")
public class DonationController {
    @Autowired
    DonationService Donationservice;
    
    String dir = "donation/";
    @RequestMapping("")
    public String donation(Model model) throws Exception {
    	List<Donation> list = Donationservice.get();
    	
    	log.info("=================="+list);
    	
    	 model.addAttribute("center", dir + "main");
    	 model.addAttribute("dlist", list);
        return "index";
    }
 
    @RequestMapping("/detail")
    public String detail(Model model) throws Exception {
    	 model.addAttribute("center", dir + "detail");
        return "index";
    }
}