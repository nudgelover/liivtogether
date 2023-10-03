package com.liivtogether.controller;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Point;
import com.liivtogether.dto.Review;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.CustService;
import com.liivtogether.service.PointService;
import com.liivtogether.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class ReviewRestController {

	@Autowired
	ReviewService reviewService;

	
	@GetMapping("/review/precheck")
	public Object reviewprecheck(Integer applyId) throws Exception {

		int result = 0;
		try {
			//cnt로 해당 신청건에 대한 리뷰를 쓴적 있는지 확인, 0이어야지만 리뷰작성가
			result = reviewService.preCheck(applyId);
			log.info("result"+result);
		} catch (Exception e) {
			e.printStackTrace();
			result = 999;
		}

		return result;
	}

	
	
	@PostMapping("/review/register")
	public Object reviewregister(Review review) throws Exception {

		String result;
		try {
			reviewService.register(review);
			result= "succ";
		} catch (Exception e) {
			e.printStackTrace();
			result= "fail";
		}

		return result;
	}
	
	
	
	@PostMapping("/review/delete")
	public Object reviewdelete(String reviewId) throws Exception {
		String result;
		try {
			reviewService.remove(reviewId);
			result= "succ";
		} catch (Exception e) {
			e.printStackTrace();
			result= "fail";
		}

		return result;
	}
}