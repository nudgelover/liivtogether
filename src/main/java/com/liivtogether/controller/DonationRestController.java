package com.liivtogether.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.liivtogether.dto.Event;
import com.liivtogether.dto.Likes;
import com.liivtogether.dto.Volunteer;
import com.liivtogether.service.DonationService;
import com.liivtogether.service.EventService;
import com.liivtogether.service.LikesService;
import com.liivtogether.service.VolunteerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class DonationRestController {

   @Autowired
    DonationService donationService;

	@Autowired
	LikesService likesService;

	@PostMapping("/donation/update-views")
	public Object updateviews(int id) throws Exception {
		int result = 0;
		try {
			donationService.updateViews(id);
			result = 1;

		} catch (Exception e) {
			result = 0;
		}
		System.out.print(result + "result");
		return result;
	}

	@PostMapping("/donation/check-likes")
	public Object checkLikes(int contentsId, String custId) throws Exception {
		int result = 0; // 초기화

		Likes likes = likesService.checkLikes(contentsId, custId);

		if (likes != null) {
			// 좋아요 데이터가 있을 경우
			if ("Y".equals(likes.getIsLike())) { // 문자열 비교 시에는 equals 메서드를 사용
				result = 1; // 좋아요한 경우
			} else if ("N".equals(likes.getIsLike())) { // "else if"를 사용하여 다음 조건을 검사
				result = 2; // 좋아요하지 않은 경우
			}

			log.info(likes.toString());
		}

		System.out.print(result + " result");
		return result;
	}

	@PostMapping("/donation/reg-like")
	public Object regLike(Likes likes) throws Exception {
		String result;
		try {
			likesService.register(likes);
			result = "succ";

		} catch (Exception e) {
			result = "fail";
		}
		System.out.print(result + "result");
		return result;
	}
	

	@PostMapping("/donation/update-like")
	public Object updateLike(Likes likes) throws Exception {
		String result;
		try {
			likesService.modify(likes);
			result = "succ";

		} catch (Exception e) {
			result = "fail";
		}
		System.out.print(result + "result");
		return result;
	}
	
	

}