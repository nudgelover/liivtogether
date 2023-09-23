package com.liivtogether.controller;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Apply;
import com.liivtogether.service.ApplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class ApplyRestController {

	@Autowired
	ApplyService applyService;

	@GetMapping("/apply/pre-check")
	public Object applyprecheck(String contentsId, String topicBig, String custId) throws Exception {
		// 내가 해당 콘텐트를 참여한적이  있는 지 여부 체크
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
	
	
	@PostMapping("/apply/register")
	public Object applyregister(Apply apply) throws Exception {
		log.info("-----도착했니?");
		// 등록 하는거 
		int result = 0;
		try {
			applyService.register(apply);
			
			result = 1;

		} catch (Exception e) {
			result = 0;
		}
		System.out.print(result + "result");
		return result;
	}

}