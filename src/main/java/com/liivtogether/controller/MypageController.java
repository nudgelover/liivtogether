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
import com.liivtogether.dto.Point;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.CustService;
import com.liivtogether.service.PointService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	ApplyService applyService;
	
	@Autowired
	PointService pointService;
	
	@Autowired
	CustService custService;
	
    String dir = "mypage/";
    @RequestMapping("")
    public String mypage(Model model,HttpSession session ) throws Exception {

    	Cust logincust = (Cust) session.getAttribute("logincust");
    	String custId = logincust.getCustId();
    	
        List<Apply> attendCount= applyService.getMyAttendCount(custId);
        Cust cust = custService.get(custId);
        model.addAttribute("attendCount", attendCount);
        model.addAttribute("cust", cust);
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
       
        model.addAttribute("dlist", dlist);
        model.addAttribute("vlist", vlist);
        model.addAttribute("slist", slist);
        model.addAttribute("center", dir + "attend");
        return "index";
    }

    @RequestMapping("/certificate")
    public String certificate(Model model,HttpSession session) throws Exception {
        
    	Cust cust = (Cust) session.getAttribute("logincust");
    	String custId = cust.getCustId();
    	
    	List<Apply> dlist = applyService.getMyList(custId, "D");
        model.addAttribute("dlist", dlist);
    	model.addAttribute("center", dir + "certificate");
        return "index";
    }
    
    @RequestMapping("/chat")
    public String chat(Model model) throws Exception {
    	model.addAttribute("center", dir + "chat");
        return "index";
    }
 
    @RequestMapping("/starcoin")
    public String starcoin(Model model, HttpSession session) throws Exception {
    	Cust cust = (Cust) session.getAttribute("logincust");
    	String custId = cust.getCustId();

        List<Point> MyStarcoinList = pointService.getMyList(custId,"COIN");
        Point totalStarcoin = pointService.getMyTotal(custId,"COIN");
        
        model.addAttribute("MyStarcoinList", MyStarcoinList);
        model.addAttribute("totalStarcoin", totalStarcoin);
    	model.addAttribute("center", dir + "starcoin");
        return "index";
    }
    
    @RequestMapping("/pointree")
    public String pointree(Model model, HttpSession session) throws Exception {
   

    	Cust cust = (Cust) session.getAttribute("logincust");
    	String custId = cust.getCustId();
    	

        List<Point> MyPointreeList = pointService.getMyList(custId,"POINTREE");
        Point totalPoint = pointService.getMyTotal(custId,"POINTREE");
        
     
        model.addAttribute("MyPointreeList", MyPointreeList);
        model.addAttribute("totalPoint", totalPoint);
     	model.addAttribute("center", dir + "pointree");
        return "index";
    }
}