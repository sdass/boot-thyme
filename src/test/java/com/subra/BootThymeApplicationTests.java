package com.subra;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import org.assertj.core.api.Assertions;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BootThymeApplicationTests {

	@Autowired
	HelloController helloController; 
	
	@Test
	public void contextLoads() {
		System.out.println("check 1");
		//Assertions.assertThat(helloController).isNull();
		Assertions.assertThat(helloController).isNotNull();
		
	}

}
