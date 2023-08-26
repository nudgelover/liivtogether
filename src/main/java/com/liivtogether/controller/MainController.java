package com.liivtogether.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liivtogether.dto.Cust;
import com.liivtogether.service.CustService;

@Controller
public class MainController {
	
	@Autowired
	CustService custService = new CustService();
	
    @RequestMapping("/")
    public String main(){
    	 
        return "index";
    }
    
    @RequestMapping("/login")
    public String login(Model model){
        return "login";
    }
    
    @RequestMapping("/logouts")
    public String logouts(Model model, HttpSession session){
    	model.addAttribute("center", "logout");
    	session.invalidate();
        return "index";
    }
    
    @RequestMapping("/register")
    public String register(Model model){
    	model.addAttribute("center", "register");
        return "index";
    }
    
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust) throws Exception {
    	try {
			custService.register(cust);
			model.addAttribute("center", "center");
		} catch (Exception e) {
//			throw new Exception("registerimpl error");
			e.printStackTrace();
		}
    	return "index";
    }
    
  
}