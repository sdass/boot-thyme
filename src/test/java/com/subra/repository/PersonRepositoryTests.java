package com.subra.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.subra.model.Person;
import com.subra.model.PersonRepository;

@SpringBootTest
@RunWith(SpringRunner.class)
//@WebAppConfiguration
public class PersonRepositoryTests {
	
	@Autowired
	private PersonRepository personRepository;

	//private static Logger log = LoggerFactory.getLogger(PersonRepositoryTests.class);
	Logger log = LoggerFactory.getLogger(PersonRepositoryTests.class);
	
	@Test
	public void getCount_TEST(){
		long count = personRepository.count();
		  //
		log.info("number populated records are=" + count);
		
	}

			
}
