package com.liivtogether.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Event;
import com.liivtogether.service.EventService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	EventService eventService;

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

	@RequestMapping("/admain")
	public String ad(Model model) throws Exception {
		model.addAttribute("center", dir + "admain");
		return "index";
	}
	

	@RequestMapping("/admain/ad1")
	public String ad1(Model model) throws Exception {
		model.addAttribute("center", dir + "/admain/ad1");
		return "index";
	}
	
	@RequestMapping("/admain/ad2")
	public String ad2(Model model) throws Exception {
		model.addAttribute("center", dir + "/admain/ad2");
		return "index";
	}
	
	@RequestMapping("/admain/ad3")
	public String ad3(Model model) throws Exception {
		model.addAttribute("center", dir + "/admain/ad3");
		return "index";
	}
	
	@RequestMapping("/admain/ad4")
	public String ad4(Model model) throws Exception {
		model.addAttribute("center", dir + "/admain/ad4");
		return "index";
	}
	
	@RequestMapping("/admain/ad5")
	public String ad5(Model model) throws Exception {
		model.addAttribute("center", dir + "/admain/ad5");
		return "index";
	}


	@RequestMapping("/fourcut")
	public String fourcut(Model model) throws Exception {
		model.addAttribute("center", dir + "fourcut");
		return "index";
	}
}