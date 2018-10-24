package com.frame;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.frame")
public class ApplicationStart {
	
	public static void main(String[] args) {
		SpringApplication.run(ApplicationStart.class, args);
	}

}
