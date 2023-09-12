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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.liivtogether.dto.Event;
import com.liivtogether.dto.Seminar;
import com.liivtogether.service.EventService;
import com.liivtogether.service.SeminarService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
public class EventRestController {


	@Autowired
	EventService eventService;

	
	@GetMapping("/api/event/eventdata")
	@ResponseBody // JSON 응답을 위한 어노테이션 추가
	public ResponseEntity<Object> geteventdata( @RequestParam String loginCust,@RequestParam String eventName, @RequestParam String thisMonth){
		
	    try {
	        List<Event> list = eventService.getEventData(loginCust, eventName, thisMonth);

	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	        for (Event event : list) {
	            LocalDateTime recordDatetime = LocalDateTime.parse(event.getRecordDatetime(), formatter);

	            int year = recordDatetime.getYear();
	            int month = recordDatetime.getMonthValue();
	            int day = recordDatetime.getDayOfMonth();

	            event.setYear(year);
	            event.setMonth(month);
	            event.setDay(day);
	        }

	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonString = objectMapper.writeValueAsString(list);
	        log.info("jsonString"+jsonString);

	        return new ResponseEntity<>(jsonString, HttpStatus.OK);
	    } catch (Exception e) {
	        log.error("이벤트 조회 중 오류 발생:", e);
	        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	@PostMapping("/api/event/eventdata")
    public ResponseEntity<Event> inserteventdata(@RequestParam String loginCust, @RequestParam String eventName,@RequestParam int pointsAwarded) throws Exception {
    
      try {
    	  eventService.insertEventData(loginCust,eventName,pointsAwarded);
    	  return new ResponseEntity<Event>(HttpStatus.OK);
      }catch (Exception e) {
    	  log.error("이벤트 입력 중 오류 발생:", e);
    	  return new ResponseEntity<Event>(HttpStatus.INTERNAL_SERVER_ERROR);
	  }
      
  }
	
	
	@GetMapping("/api/event/check-today-do")
    public Object checktodaydo(String loginCust, String eventName,String today) throws Exception {
	 
      int result;
      try {
    	  result= eventService.checkTodayDo(loginCust,eventName,today);
      	 
      }catch (Exception e) {
      	 result = -1;
		}
      return result;
  }
	
	
	@GetMapping("/api/event/thismonth")
    public Object checkthismonthdo(String loginCust, String eventName,String thisMonth) throws Exception {

      int result;
      try {
    	  result= eventService.checkThisMonthDo(loginCust,eventName,thisMonth);
      	 
      }catch (Exception e) {
      	 result = -1;
      }

      return result;
  }
	
}