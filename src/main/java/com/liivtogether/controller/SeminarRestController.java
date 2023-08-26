package com.liivtogether.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.liivtogether.dto.Seminar;
import com.liivtogether.service.SeminarService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class SeminarRestController {

	@Autowired
	SeminarService seminarService;

//	@GetMapping("/seminar/brand-new-order")
//	public ResponseEntity<List<Seminar>> brandNewOrder(@RequestParam String topicSmall) {
//		try {
//			//List<Seminar> list = seminarService.getBrandNewOrder(topicSmall);
//
//			LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
//			for (Seminar seminar : list) {
//				LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
//				int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
//				seminar.setdDay(daysUntil);
//			}
//
//			//return ResponseEntity.ok(list);
//		} catch (Exception e) {
//			return ResponseEntity.status(500).build(); // Internal Server Error
//		}
//	}
//
//	@GetMapping("/seminar/popularorder")
//	public ResponseEntity<List<Seminar>> popularorder(@RequestParam String topicSmall) {
//		try {
//			//List<Seminar> list = seminarService.getPopularOrder(topicSmall);
//
//			LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
//			for (Seminar seminar : list) {
//				LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
//				int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
//				seminar.setdDay(daysUntil);
//			}
//
//			return ResponseEntity.ok(list);
//		} catch (Exception e) {
//			return ResponseEntity.status(500).build(); // Internal Server Error
//		}
//	}
//
//	@GetMapping("/seminar/deadlineorder")
//	public ResponseEntity<List<Seminar>> deadlineorder(@RequestParam String topicSmall,
//			@RequestParam String currentDate) {
//		try {
//
//			List<Seminar> list = seminarService.getDeadlineOrder(topicSmall, currentDate);
//
//			LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
//
//			for (Seminar seminar : list) {
//				LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
//				int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
//				seminar.setdDay(daysUntil);
//			}
//
//			return ResponseEntity.ok(list);
//		} catch (Exception e) {
//			return ResponseEntity.status(500).build(); // Internal Server Error
//		}
//	}
//
//	@GetMapping("/seminar/targetinorder")
//	public ResponseEntity<List<Seminar>> targetinorder(@RequestParam String topicSmall,
//			@RequestParam String currentDate, @RequestParam boolean includeClosed) {
//
//		try {
//
//			List<Seminar> list;
//
//			if (includeClosed) {
//				list = seminarService.getTargetInOrderWithClosed(topicSmall);
//			} else {
//				list = seminarService.getTargetInOrder(topicSmall, currentDate);
//			}
//
//			LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
//
//			for (Seminar seminar : list) {
//				LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
//				int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
//				seminar.setdDay(daysUntil);
//			}
//
//			return ResponseEntity.ok(list);
//		} catch (Exception e) {
//			return ResponseEntity.status(500).build(); // Internal Server Error
//		}
//	}
//
//	@GetMapping("/seminar/viewsorder")
//	public ResponseEntity<List<Seminar>> viewsorder(@RequestParam String topicSmall) {
//		try {
//			//List<Seminar> list = seminarService.getViewsOrder(topicSmall);
//
//			LocalDate today = LocalDate.now(); // 오늘 날짜 가져오기
//			for (Seminar seminar : list) {
//				LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
//				int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
//				seminar.setdDay(daysUntil);
//			}
//
//			return ResponseEntity.ok(list);
//		} catch (Exception e) {
//			return ResponseEntity.status(500).build(); // Internal Server Error
//		}
//	}
	@PostMapping("/seminar/update-views")
      public Object updateviews(int id) throws Exception {
        int result = 0;
        try {
            seminarService.updateViews(id);
        	result = 1;
        	 
        }catch (Exception e) {
        	 result = 0;
		}
        System.out.print(result+"result");
        return result;
    }

	@GetMapping("/seminar/order")
	public ResponseEntity<List<Seminar>> order(@RequestParam String topicSmall, @RequestParam String currentDate,
			@RequestParam boolean includeClosed, @RequestParam String order) {
		try {
			List<Seminar> list = null;
			LocalDate today = LocalDate.now();
			
			if (includeClosed) {
				// 마감 포함시
				switch (order) {
				case "brandNew":
					list = seminarService.getBrandNewOrderWithClosed(topicSmall);
					break;
				case "popular":
					list = seminarService.getPopularOrderWithClosed(topicSmall);
					break;
				case "deadline":
					list = seminarService.getDeadlineOrderWithClosed(topicSmall);
					break;
				case "targetIn":
					list = seminarService.getTargetInOrderWithClosed(topicSmall);
				
					break;
				case "views":
					list = seminarService.getViewsOrderWithClosed(topicSmall);
					break;

				}
			} else {
				// 마감 미포함
				switch (order) {
				case "brandNew":
					list = seminarService.getBrandNewOrder(topicSmall, currentDate);
					break;
				case "popular":
					list = seminarService.getPopularOrder(topicSmall, currentDate);
					break;
				case "deadline":
					list = seminarService.getDeadlineOrder(topicSmall, currentDate);
					break;
				case "targetIn":
					list = seminarService.getTargetInOrder(topicSmall, currentDate);
					break;
				case "views":
					list = seminarService.getViewsOrder(topicSmall, currentDate);
					break;

				}
			}
			for (Seminar seminar : list) {
				LocalDate edate = LocalDate.parse(seminar.getEdate()); // edate 형식 2023-08-10
				int daysUntil = (int) ChronoUnit.DAYS.between(today, edate);
				seminar.setdDay(daysUntil);
			}
			return ResponseEntity.ok(list);
			
		} catch (Exception e) {
			return ResponseEntity.status(500).build(); // Internal Server Error
		}
	}

}