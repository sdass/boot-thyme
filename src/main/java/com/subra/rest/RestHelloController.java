package com.subra.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.subra.model.Name;
import com.subra.model.Wrapper;

@RestController //redundant @ResponseBody
//@Controller //must need @ResponseBody
public class RestHelloController {

	Logger log = LoggerFactory.getLogger(RestHelloController.class);
	
	@RequestMapping("/hellojson")
	public Name helloSay(Model model, @RequestParam(value="yourname", required=false,defaultValue="anonymous") String name0) {
		log.debug("passed name=" + name0);

		Name tobesent = new Name();
		tobesent.setName(name0);
		return tobesent;
	}

	@RequestMapping("/hellowrapper")
	public @ResponseBody Wrapper helloWrap(Model model, @RequestParam(value="yourname", required=false,defaultValue="anonymous") String name0) {
	//public Wrapper helloWrap(Model model, @RequestParam(value="yourname", required=false,defaultValue="anonymous") String name0) {
		log.debug("passed name=" + name0);

		Name n1 = new Name();
		n1.setName(name0);
		Wrapper tobesent = new Wrapper(n1);
		
		log.debug("wrapped=" + tobesent);
		
		return tobesent;
		
	}	
	
	@RequestMapping(value="/hellowrapxml", produces= { "application/xml", "text/xml" })
	public @ResponseBody Wrapper helloWrapXML(Model model, @RequestParam(value="yourname", required=false,defaultValue="anonymous") String name0) {
		log.debug("hellowrapxml:passed name=" + name0);

		Name n1 = new Name();
		n1.setName(name0);
		Wrapper tobesent = new Wrapper(n1);
		
		log.debug("wrapped=" + tobesent);
		
		return tobesent;
		
	}
	
	@RequestMapping(value="/helloxml", produces= { "application/xml", "text/xml" })
	public @ResponseBody Name helloXML(Model model, @RequestParam(value="yourname", required=false,defaultValue="anonymous") String name0) {
		log.debug("helloxml:passed name=" + name0);

		Name n1 = new Name();
		n1.setName(name0);
		
		
		log.debug("name=" + n1);
		
		return n1;
		
	}
	
}
