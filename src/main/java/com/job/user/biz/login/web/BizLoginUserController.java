package com.job.user.biz.login.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BizLoginUserController {
	
	@RequestMapping(value="/user/biz/login/bizLogin.do")
	public String bizLogin() {
		return "user/main/main";
	}
	
	@RequestMapping(value="/user/biz/login/bizLogout.do")
	public String bizLogout(HttpSession session) {
		session.invalidate();
		return "user/main/main";
	}
}
