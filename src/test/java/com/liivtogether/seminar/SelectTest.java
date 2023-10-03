package com.liivtogether.seminar;


import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.liivtogether.dto.Seminar;
import com.liivtogether.service.SeminarService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class Selectdeadline {

	  @Autowired
	    SeminarService service;


	    @Test
	    void contextLoads() {
	        try {
	            //List<Seminar> seminarList = service.getDeadlineOrder("", "2023-08-19");
	            //log.info("Seminar List: {}", seminarList.toString());
	            // seminarList를 적절히 활용하거나 로깅 등을 수행
	        } catch (Exception e) {
	            log.error("select error-----------------------------", e);
	        }
	    }

}
