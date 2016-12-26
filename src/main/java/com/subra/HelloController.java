package com.subra;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloController {

	Logger log = LoggerFactory.getLogger(HelloController.class);
	
	@RequestMapping("/hello")
	public String helloSay(Model model, @RequestParam(value="yourname", required=false,defaultValue="anonymous") String name0) {
		log.debug("passed name=" + name0);
		model.addAttribute("name", name0);
		return "hellov";
	}

}
