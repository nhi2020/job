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
	
	/*기업로그인*/
	@RequestMapping(value="/user/biz/login/bizLoginForm.do")
	public String bizLoginForm() {
		return "user/biz/login/bizLoginForm";
	}
	
	/*기업회원가입*/
	@RequestMapping(value="/user/biz/join/bizJoinForm.do")
	public String bizJoinForm() {
		return "user/biz/join/bizJoinForm";
	}
	
	/*개인로그인*/
	@RequestMapping(value="/user/member/login/memLoginForm.do")
	public String memLoginForm() {
		return "user/member/login/memLoginForm";
	}
	
	/*개인회원가입*/
	@RequestMapping(value="/user/member/join/memJoinForm.do")
	public String memJoinForm() {
		return "user/member/join/memJoinForm";
	}
}
