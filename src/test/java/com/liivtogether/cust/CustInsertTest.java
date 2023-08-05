package com.liivtogether.cust;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.liivtogether.LiivtogetherApplication;
import com.liivtogether.dto.Cust;
import com.liivtogether.service.CustService;

@SpringBootTest
class CustInsertTest {

	@Autowired
	CustService service;
	
	@Test
	void contextLoads() throws Exception{
		Cust cust = new Cust("id", "pwd", "name", "phoneno", "birth", "a.jpg", 1100, 1100, "Y");
		service.register(cust);
	}
}
