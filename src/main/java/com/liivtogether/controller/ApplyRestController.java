package com.liivtogether.controller;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Donation;
import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Point;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.PointService;
import com.liivtogether.service.DonationService;
import com.liivtogether.service.CustService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class ApplyRestController {

	@Autowired
	ApplyService applyService;
	@Autowired
	PointService pointService;
	@Autowired
	DonationService donationService;
	@Autowired
	CustService custService;

	@GetMapping("/apply/pre-check")
	public Object applyprecheck(String contentsId, String topicBig, String custId) throws Exception {
		// 내가 해당 콘텐트를 참여한적이  있는 지 여부 체크
		log.info("프리췍");
		int result = 0;
		try {
			
			//DB에서 해당 콘텐츠에 참여했는지 여부를 CNT로 가져옴. 세미나의 경우 1번참여만 가능하게 설정할 것이기에
			//result값이 1로 들어오면 세미나 참여를 막을 예정.
			result = applyService.preCheck(contentsId,topicBig,custId);
			
		} catch (Exception e) {
			
			result = 999;
		}

		return result;
	}
	
	


    @Transactional(rollbackFor = Exception.class) 
	@PostMapping("/apply/process")
	public Object applyprocess(Apply apply, Point point) throws Exception {
		String result;
		try {
			applyService.register(apply);
			pointService.register(point);
			pointService.modify(point);
			
			result = "success";

		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		    throw e;
		}
		System.out.print(result + "result");
		return result;
	}

	
    @Transactional(rollbackFor = Exception.class) 
	@PostMapping("/apply/donation")
	public Object applydonation(Apply apply, Point point, Donation donation) throws Exception {

		// 등록 하는거 
		int result = 0;
		
		try {				
			//기부신청 내역
			applyService.register(apply);							
			//기부콘텐츠 모금액(모금액 증가)
			donationService.modify(donation);			
			//기부포인트리 히스토리
			pointService.register(point);			
			//고객보유 포인트리(보유포인트리 차감)
			pointService.modify(point);
					
			//기부 스타코인
			
			Point starcoin = (Point) point.clone();
			starcoin.setPointcoin("COIN");
			starcoin.setGplace("D");
			starcoin.setUplace(null);
			starcoin.setMount(5);
			
			
			//기부스타코인 히스토리
			pointService.register(starcoin);
			//고객보유 스타코인(스타코인 적립)
			pointService.modify(starcoin);
		
			result = 1;

		} catch (Exception e) {
			result = 0;
		}
		return result;
	}

}