package com.liivtogether.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Point;
import com.liivtogether.dto.PopularKeywords;
import com.liivtogether.dto.Search;
import com.liivtogether.dto.Seminar;
import com.liivtogether.dto.Volunteer;
import com.liivtogether.service.CustService;
import com.liivtogether.service.PointService;
import com.liivtogether.service.PopularService;
import com.liivtogether.service.SearchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AjaxController {

	@Autowired
	CustService custService;
	
	@Autowired
	SearchService searchService;
	
	@Autowired
	PointService pointService;
	
	@Autowired
	PopularService popularService;
	
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
	
	
	@RequestMapping("/add_keywords")
	public String popularKeywords(PopularKeywords popularKeywords) {
		log.info("인기검색어 저장하자");
	    String result = "fail"; // 기본값은 실패로 설정
	    
	    try {
	        popularService.register(popularKeywords);
	        result = "succ"; // 성공 시 결과값을 성공으로 변경
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 실패 시 예외 처리
	    }

	    return result;
	}
	
	
	@RequestMapping("/popular_keywords")
	public List<PopularKeywords> popularKeywords() throws Exception {

		List<PopularKeywords> popularKeywordsList = popularService.get();


	    return popularKeywordsList;
	}
	
	
	@Transactional(rollbackFor = Exception.class) 
	@PostMapping("/getTestMoney")
	public Object applyprocess(String loginCustId) throws Exception {
	    String result;
	    
	    try {
	       
	        Point point = new Point();
	        point.setCustId(loginCustId);
	        point.setGplace("테스트충전");
	        point.setPointcoin("POINTREE");
	        point.setMount(50000);

	        Point point2 = new Point();
	        point2.setCustId(loginCustId);
	        point2.setGplace("테스트충전");
	        point2.setPointcoin("COIN");
	        point2.setMount(100);

	        // Register and modify the points
	        pointService.register(point);
	        pointService.register(point2);
	        pointService.modify(point);
	        pointService.modify(point2);

	        result = "success";

	    } catch (Exception e) {
	        e.printStackTrace();
	        result = "fail";
	        throw e;
	    }
	    return result;
	}
}