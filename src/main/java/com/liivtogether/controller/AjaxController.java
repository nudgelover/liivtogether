package com.liivtogether.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Search;
import com.liivtogether.dto.Seminar;
import com.liivtogether.service.CustService;
import com.liivtogether.service.SearchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AjaxController {

	@Autowired
	CustService custService;
	
	@Autowired
	SearchService searchService;
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

	// 0 아이디 없음, 1 정상 로그인, 2 비밀번호 불일치
	@RequestMapping("/logins")
	public int login(String custId, String custPwd, HttpSession session) throws Exception {
		int result = 0;
		Cust cust = null;
		try {
			cust = custService.get(custId);
			if(cust != null) {
				if(!custPwd.equals(cust.getCustPwd())){
//					log.info("custPwd={}", custPwd);
//					log.info("getCustPwd={}", cust.getCustPwd());
					result = 2; //패스워드 불일치
				} else {
		            session.setMaxInactiveInterval(3600);
		            session.setAttribute("logincust", cust);
					result = 1; //일치. 정상로그인
				}
			}
			return result;
		} catch (Exception e) {
			throw new Exception("login error");
		}
	}
	
	
	@RequestMapping("/search")
	public List<Search> search(String keyword) throws Exception {
		// log.info(keyword);
	    List<Search> searchList = searchService.getkewordList(keyword);

	    return searchList;
	}
	
	
	@RequestMapping("/autocomplete")
	public List<Search> autocomplete(String keyword) throws Exception {
	    log.info(keyword);

	    List<Search> searchList = searchService.getkewordList(keyword);

	    return searchList;
	}
	

}
