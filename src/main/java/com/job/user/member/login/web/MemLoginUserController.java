package com.job.user.member.login.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;

@Controller
public class MemLoginUserController {
	@Resource(name="memLoginUserService")
	MemLoginUserService memLoginUserService;
	
	@RequestMapping(value="/user/member/login/memLogin.do")
	public String memLogin(HttpSession session, MemLoginUserVO vo) {
		/*MemLoginUserVO user=memLoginUserService.loginCheck();
		session.setAttribute("login", login);*/
		return "user/main/main";
	}
	
	@RequestMapping(value="/user/member/login/memLogout.do")
	public String memLogout(HttpSession session) {
		session.invalidate();
		return "user/main/main";
	}
}
