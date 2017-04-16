package com.subra;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;


public class ServletInitializer extends SpringBootServletInitializer {


	
	/*
	public ServletInitializer() {
		// TODO Auto-generated constructor stub
	}
	*/
	
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BootThymeApplication.class);
	}

	
}
