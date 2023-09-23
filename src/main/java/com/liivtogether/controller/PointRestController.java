package com.liivtogether.controller;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Point;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.PointService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class PointRestController {

	@Autowired
	PointService pointService;


	@GetMapping("/point/pre-check")
	public Object applyprecheck(String custId, String pointcoin) throws Exception {
		//내 포인트 또는 스타코인 몇개인지 체크
		int result = 0;
		try {
			
			//DB에서 해당 콘텐츠에 참여했는지 여부를 CNT로 가져옴. 세미나의 경우 1번참여만 가능하게 설정할 것이기에
			//result값이 1로 들어오면 세미나 참여를 막을 예정.
			result = pointService.preCheck(custId, pointcoin);
			
		} catch (Exception e) {
			
			result = -99999;
		}

		return result;
	}
	

}