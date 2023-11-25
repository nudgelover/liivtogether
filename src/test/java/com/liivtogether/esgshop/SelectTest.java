package com.liivtogether.esgshop;



import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.liivtogether.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class SelectEsgShop {

		@Autowired
	    ItemService service;

	    @Test
	    void contextLoads() {
	        try {
	        	service.get();
	        	System.out.println(service.get());
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    }

}
