package com.job.mng.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mng/main/*")
public class MainMngController {

	@RequestMapping("main.do")
	public String mngMain() {
		
		System.out.println("MainMngController mngMain() ...");
		
		return "mng/main/main";
		
	}
	
	@RequestMapping("test.do")
	public String mngTest() {
		System.out.println("mainMngcontroller mngTest() .....");
		
		return "mng/main/test";
		
	}
	
	
}
