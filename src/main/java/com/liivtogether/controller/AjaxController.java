package com.liivtogether.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Cust;
import com.liivtogether.service.CustService;

@RestController
public class AjaxController {

	@Autowired
	CustService custService;
	
	//id 중복확인 로직. 사용가능 1, 중복 0
	@RequestMapping("/idcheck")
	public int idcheck(String cust_id) throws Exception {
		int result = 0;
		Cust cust = null;
		try {
			cust = custService.get(cust_id);
		} catch (Exception e) {
			throw new Exception("id check error");
		}
		
		//입력받은 id로 select한 결과 null이면 1을 반환해 사용가능하다고 알림.
		if(cust == null) {
			result = 1;
		}
		return result;
		
	}
}
