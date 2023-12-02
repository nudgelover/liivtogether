package com.liivtogether.controller;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Review;
import com.liivtogether.service.CustService;
import com.liivtogether.service.KakaoLoginService;
import com.liivtogether.service.ReviewService;

@Controller
public class MainController {
	
	@Value("${app.kakaorest}")
	String kakaorest;	
	
	@Value("${app.kakaojs}")
	String kakaojs;
	
    @Value("${serviceserver}")
    private String serviceServer;

    
	@Autowired
	CustService custService = new CustService();
	
	@Autowired
	KakaoLoginService kakaoLoginService = new KakaoLoginService();
	
	@Autowired
	ReviewService reviewService;
	
	
    @RequestMapping("/")
    public String main(Model model) throws Exception{
    	List<Review> reviewcontent = reviewService.get();
     	model.addAttribute("reviewcontent", reviewcontent);
     	model.addAttribute("serviceServer", serviceServer);
        return "index";
    }
    
    @RequestMapping("/login")
    public String login(Model model){
    	model.addAttribute("kakaojs", kakaojs);
        return "login";
    }
    
    @RequestMapping("/logouts")
    public String logouts(Model model, HttpSession session){
    	model.addAttribute("center", "logout");
    	session.invalidate();
        return "index";
    }
    
    @RequestMapping("/register")
    public String register(Model model){
    	model.addAttribute("kakaojs", kakaojs);
    	model.addAttribute("center", "register");
        return "index";
    }
    
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust) throws Exception {
    	try {
			custService.register(cust);
			model.addAttribute("center", "center");
		} catch (Exception e) {
//			throw new Exception("registerimpl error");
			e.printStackTrace();
		}
    	return "index";
    }
    
    
    @RequestMapping("/chat")
    public String chat(Model model) throws Exception {
      	model.addAttribute("center", "chat");
    	return "index";
    }
    
    // 카카오 로그인창 호출(ajax로는 호출 안됨)
    @RequestMapping(value = "/login/getKakaoAuthUrl")
    public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
    	String reqUrl = "https://kauth.kakao.com/oauth/authorize?client_id="+kakaorest+"&redirect_uri=http://localhost/kakaoLogin&response_type=code";
    	return reqUrl;
    }

	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
    // 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
 	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		
		// 2번
		String access_Token = kakaoLoginService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		
		// 4번
		// 정보있는지 체크 -> 있으면 로그인, 없으면 회원가입 후 로그인
		String id = userInfo.get("email").toString();
		String name = userInfo.get("nickname").toString();
		String birthday = userInfo.get("birthday").toString();
		String pwd = UUID.randomUUID().toString();
		
		Cust cust = custService.get(id);
		
		//아이디가 있을 경우 바로 로그인
		if(cust != null) {
			id = cust.getCustId();
//			System.out.println("cust 기존 정보 보유");
//			System.out.println("id::::::::::"+id);
			session.setMaxInactiveInterval(3600);
            session.setAttribute("logincust", custService.get(id));
			return "redirect:/";
		}
		
		//아이디가 없을 경우 회원가입 후 로그인
		//(#{custId}, #{custPwd}, #{custName}, #{phoneNo}, #{birth}, #{img}, #{pointree}, #{starcoin}, #{isMaster})
		cust = new Cust(id, pwd, name, "0000000000", birthday, "default.jpg", 0, 0, "0");
		custService.register(cust);
//		System.out.println("cust 신규 등록 완료");
		session.setMaxInactiveInterval(3600);
        session.setAttribute("logincust", custService.get(id));
        
		return "redirect:/";

	}

  
}