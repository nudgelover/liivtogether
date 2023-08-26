package com.liivtogether.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liivtogether.dto.Seminar;
import com.liivtogether.service.SeminarService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/seminar")
public class SeminarController {

	String dir = "seminar/";

	@Autowired
	SeminarService seminarService;

	@RequestMapping("")
	public String seminar(Model model) throws Exception {

		// 광고에 띄울꺼 리스트로 보내기
		model.addAttribute("center", dir + "main");

		return "index";
	}

	
	@RequestMapping("/detail")
	public String detail(Model model,Integer id) throws Exception {
		Seminar seminar = seminarService.get(id);
		LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
		LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
		int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
		seminar.setdDay(daysUntil);
		
		//함꼐보면 좋을 세미나 리스트로 보내기
		//기예약한 건인지 아닌지..!!! 

		model.addAttribute("seminar", seminar);
		model.addAttribute("center", dir + "detail");
		return "index";
	}
	
	@RequestMapping("/join")
	public String join(Model model,Integer id) throws Exception {
		Seminar seminar = seminarService.get(id);
		LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
		LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
		int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
		seminar.setdDay(daysUntil);

		model.addAttribute("seminar", seminar);
		model.addAttribute("center", dir + "join");

		return "index";
	}

}