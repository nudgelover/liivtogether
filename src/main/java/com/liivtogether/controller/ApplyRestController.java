package com.liivtogether.controller;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Point;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.CustService;
import com.liivtogether.service.PointService;
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
	PointService pointService;


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
	
	
	@PostMapping("/apply/register")
	public Object applyregister(Apply apply, Point point, int mount) throws Exception {
		log.info("-----도착했니?");
		log.info("-----도착했니?"+ point);
		// 등록 하는거 
		int result = 0;
		applyService.register(apply);
		try {
			log.info("-----도착했니?"+apply.getTopicBig());
			if(apply.getTopicBig()=="D") {
				log.info("-----되는거니??"+apply.getTopicBig());
				point.setPointcoin("pointree");
				point.setUplace("기부");
				point.setMount(mount);
				log.info("++++++++++++++++++++"+ point);
				pointService.register(point);
				
				point.setPointcoin("starcoin");
				point.setUplace("기부");
				point.setMount(5);
				log.info("====================="+ point);
				pointService.register(point);								
			}
			
			result = 1;
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
		return result;
	}

}