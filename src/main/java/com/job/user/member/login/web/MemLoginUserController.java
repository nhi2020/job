package com.job.user.member.login.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.SessionScope;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;

@Controller
public class MemLoginUserController {
	@Resource(name="memLoginUserService")
	MemLoginUserService memLoginUserService;
	
	/*개인 로그인 & 체크*/
	@RequestMapping(value="/user/member/login/memLogin.do")
	public String memLogin(HttpSession session, MemLoginUserVO  vo) throws Exception {
		int result=memLoginUserService.loginCheck(vo);
		String url="user/main/main";
		if(result==1) {
			MemLoginUserVO user=memLoginUserService.user(vo);
			session.setAttribute("user", user);
			url="user/main/main";
		}else {
			url="user/member/login/memLogin";
		}	
		return url;
	}
	
	@RequestMapping(value="/user/member/login/memLogout.do")
	public String memLogout(HttpSession session) {
		session.invalidate();
		return "user/main/main";
	}
}
