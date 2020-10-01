package com.job.user.member.login.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			url="user/member/login/memLoginForm";
		}	
		return url;
	}
	
	/*개인 로그아웃*/
	@RequestMapping(value="/user/member/login/memLogout.do")
	public String memLogout(HttpSession session) {
		session.invalidate();
		return "user/main/main";
	}
	/*개인 아이디 찾기 폼*/
	@RequestMapping(value="/user/member/login/memFindIdForm.do")
	public String memFindIdForm() throws Exception{
		return"/user/member/login/memFindIdForm";
	}
	
	/*개인 아이디 찾기*/
	@RequestMapping(value="/user/member/login/memFindId.do")
	public String memFindId(HttpServletResponse response,MemLoginUserVO vo, Model model) throws Exception{
		model.addAttribute("id", memLoginUserService.memFindId(response,vo));
		return "/user/member/login/memFindId";
	}
}
