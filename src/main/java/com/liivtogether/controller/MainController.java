package com.liivtogether.controller;

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
    
    @RequestMapping("/logout")
    public String logout(Model model){
    	model.addAttribute("center", "logout");
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
		} catch (Exception e) {
//			throw new Exception("registerimpl error");
			e.printStackTrace();
		}
    	return "index";
    }
    
  
}