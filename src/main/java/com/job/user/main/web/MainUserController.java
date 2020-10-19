package com.job.user.main.web;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.main.service.MainUserService;

@Controller
public class MainUserController {
	
	@Resource(name="mainUserService")
	private MainUserService mainUserServie;
	
	/*메인페이지*/
	@RequestMapping(value="/user/main/main.do")
	public String main() {
		return  "user/main/main";
	}
	
	
}
