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