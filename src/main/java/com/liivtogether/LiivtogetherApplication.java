package com.liivtogether;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class LiivtogetherApplication {

	public static void main(String[] args) {
		SpringApplication.run(LiivtogetherApplication.class, args);
	}

}
