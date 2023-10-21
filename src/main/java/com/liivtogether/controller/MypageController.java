package com.liivtogether.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Cust;
import com.liivtogether.service.ApplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	ApplyService applyService;
	
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
 
    @RequestMapping("/attend")
    public String attend(Model model, HttpSession session) throws Exception {
    
    	Cust cust = (Cust) session.getAttribute("logincust");
    	String custId = cust.getCustId();

        List<Apply> dlist = applyService.getMyList(custId, "D");
        List<Apply> vlist = applyService.getMyList(custId, "V");
        List<Apply> slist = applyService.getMyList(custId, "S");
        log.info(slist.toString());
        model.addAttribute("dlist", dlist);
        model.addAttribute("vlist", vlist);
        model.addAttribute("slist", slist);
        model.addAttribute("center", dir + "attend");
        return "index";
    }

    @RequestMapping("/certificate")
    public String certificate(Model model) throws Exception {
    	model.addAttribute("center", dir + "certificate");
        return "index";
    }
    
    @RequestMapping("/chat")
    public String chat(Model model) throws Exception {
    	model.addAttribute("center", dir + "chat");
        return "index";
    }
 
}