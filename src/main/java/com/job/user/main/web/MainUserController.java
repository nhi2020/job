package com.job.user.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainUserController {
	
	/*메인페이지*/
	@RequestMapping(value="/user/main/main.do")
	public String main() {
		return  "user/main/main";
	}
	
}
