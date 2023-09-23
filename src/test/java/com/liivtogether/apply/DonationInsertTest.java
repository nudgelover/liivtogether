package com.liivtogether.apply;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.liivtogether.LiivtogetherApplication;
import com.liivtogether.dto.Apply;
import com.liivtogether.service.ApplyService;

@SpringBootTest
class DonationInsertTest {

	@Autowired
	ApplyService service;
	
	@Test
	void contextLoads() throws Exception{
		Apply apply = new Apply( 0, "1", "D", "1234", null,"기부기부", "Y");
		service.register(apply);
	}
}
