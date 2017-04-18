package com.subra;

import org.h2.server.web.WebServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan
@EnableAutoConfiguration 
@EntityScan
@SpringBootApplication
public class BootThymeApplication {

	public static void main(String[] args) {
		System.out.println("check 2");
		SpringApplication.run(BootThymeApplication.class, args);
	}
	
	/* or by configuration in properties file
	@Bean
	public ServletRegistrationBean h2servletRegistration() {
	    ServletRegistrationBean registration = new ServletRegistrationBean(new WebServlet());
	    registration.addUrlMappings("/console/*");
	    registration.addInitParameter("webAllowOthers", "true");
	    return registration;
	}
	*/
}
