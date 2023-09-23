package com.liivtogether.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.liivtogether.dto.*;
import com.liivtogether.service.*;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
    	
    	
    	LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
    	
    	for(Donation donation : list) {
    		 LocalDate ddate = LocalDate.parse(donation.getDdate()); // ddate 형식 2023-08-10
     		 int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
     		 log.info("++++++++++++++++++"+daysUntil);
     		 donation.setdDay(daysUntil);
     		 log.info("+++++++++++++"+donation);
    	}
    	log.info("=================="+list);
    	 model.addAttribute("center", dir + "main");
    	 model.addAttribute("dlist", list);
        return "index";
    }
 
    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
    	 Donation donation = Donationservice.get(id);
    	 
    	 LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
 		 LocalDate ddate = LocalDate.parse(donation.getDdate()); // ddate 형식 2023-08-10
 		 int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
 		 donation.setdDay(daysUntil);
 		log.info("+++++++++++++"+donation);
    	 model.addAttribute("donation", donation);
    	 model.addAttribute("center", dir + "detail");
        return "index";
    }
    
	@RequestMapping("/join")
	public String join(Model model,Integer id) throws Exception {
		Donation donation = Donationservice.get(id);
		
		LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
		LocalDate ddate = LocalDate.parse(donation.getDdate()); // edate 형식 2023-08-10
		int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
		donation.setdDay(daysUntil);

		model.addAttribute("donation", donation);
		model.addAttribute("center", dir + "join");

		return "index";
	}
	
	
}