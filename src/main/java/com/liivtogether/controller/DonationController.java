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

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/donation")
public class DonationController {
    @Autowired
    DonationService Donationservice;
    @Autowired
    ApplyService Applyservice;
    
	@Autowired
	CustService custService;
    
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
    public String detail(Model model, int id, HttpSession session) throws Exception {

    	 Cust logincust = (Cust) session.getAttribute("logincust");
    	 String custId = logincust.getCustId();
    	 Cust cust = custService.get(custId);
    	 
    	 Donation donation = Donationservice.get(id);
    	 List<Donation> list = Donationservice.getrecommend();
    	 
    	 LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
 		 LocalDate ddate = LocalDate.parse(donation.getDdate()); // ddate 형식 2023-08-10
 		 int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
 		 donation.setdDay(daysUntil);
 		
 		 log.info("++++recomend"+list);
 		 
 	     model.addAttribute("cust", cust);
    	 model.addAttribute("donation", donation);
    	 model.addAttribute("rlist", list);
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
	
	@RequestMapping("/success")
	public String success(Model model, String custId,Integer contentsId) throws Exception {
		Donation donation = Donationservice.get(contentsId);
		Apply apply = Applyservice.getJoinComplete(custId, contentsId);
		
		model.addAttribute("donation", donation);
		model.addAttribute("apply", apply);
		model.addAttribute("center", dir + "success");
		return "index";
	}
	
}