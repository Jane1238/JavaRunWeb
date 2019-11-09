package com.shaoyujian.JavaRunWeb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.shaoyujian.JavaRunWeb.mapper")
public class JavaRunWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(JavaRunWebApplication.class, args);
	}

}
