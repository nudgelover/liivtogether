package com.liivtogether.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Volunteer;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.VolunteerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/volunteer")
public class VolunteerController {
	
	@Autowired
	VolunteerService Volunteerservice;
	
	@Autowired
	ApplyService applyService;
	
    String dir = "volunteer/";
    
    @RequestMapping("")
    public String volunteer(Model model) throws Exception {
    	List<Volunteer> list = Volunteerservice.get();
    	List<Volunteer> bannerList = Volunteerservice.getBannerList();
    	
    	LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
    	
    	for(Volunteer volunteer : list) {
    		 LocalDate ddate = LocalDate.parse(volunteer.getDdate()); // ddate 형식 2023-08-10
     		 int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
     		 volunteer.setdDay(daysUntil);
    	}
		 log.info("++++bannerList"+bannerList);
    	 model.addAttribute("center", dir + "main");
    	 model.addAttribute("vlist", list);
    	 model.addAttribute("bannerList", bannerList);

        return "index";
    }
 
    
    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
    	 Volunteer volunteer = Volunteerservice.get(id);
    	 List<Volunteer> list = Volunteerservice.getrecommend();
     	
    	 LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
 		 LocalDate ddate = LocalDate.parse(volunteer.getDdate()); // ddate 형식 2023-08-10
 		 int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
 		 volunteer.setdDay(daysUntil);
	
    	 model.addAttribute("volunteer", volunteer);
    	 model.addAttribute("rlist", list);
    	 model.addAttribute("center", dir + "detail");   	 
        return "index";
    }
    
	@RequestMapping("/join")
	public String join(Model model,Integer id) throws Exception {
		 Volunteer volunteer = Volunteerservice.get(id);
		
		LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
		LocalDate ddate = LocalDate.parse(volunteer.getDdate()); // edate 형식 2023-08-10
		int daysUntil = (int) ChronoUnit.DAYS.between(today, ddate);
		volunteer.setdDay(daysUntil);

		model.addAttribute("volunteer", volunteer);
		model.addAttribute("center", dir + "join");

		return "index";
	}
	
	@RequestMapping("/join-complete")
	public String joincomplete(Model model,String custId,Integer contentsId) throws Exception {
		Volunteer volunteer = Volunteerservice.get(contentsId);
		Apply apply = applyService.getJoinComplete(custId, contentsId);
		
		model.addAttribute("volunteer", volunteer);
		model.addAttribute("apply", apply);
		model.addAttribute("center", dir + "joincomplete");

		return "index";
	}
}