package com.liivtogether.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Review;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {

	String dir = "review/";

	@Autowired
	ApplyService applyService;

	@Autowired
	ReviewService reviewService;

	@RequestMapping("")
	public String review(Model model) throws Exception {
		List<Review> reviewcontent = reviewService.get();
		List<String> contentList = new ArrayList<>();

		for (Review review : reviewcontent) {
			String content = review.getReviewContents();
			contentList.add(content);
		}
		model.addAttribute("reviewcontent", reviewcontent);
		model.addAttribute("contentList", contentList);
		model.addAttribute("center", dir + "main");
		return "index";
	}

	@RequestMapping("/add")
    public String add(Model model, HttpSession session) throws Exception {
	    
    	Cust cust = (Cust) session.getAttribute("logincust");
    	String custId = cust.getCustId();

		List<Apply> myApplyList = applyService.getMyList(custId, "");
		log.info(myApplyList.toString());
		model.addAttribute("myApplyList", myApplyList);
        model.addAttribute("center", dir + "add");
        return "index";
    }
}