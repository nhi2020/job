package com.job.user.biz.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;

@Controller
public class BizLoginUserController {
	
	@Resource(name="bizLoginUserService")
	private BizLoginUserService bizLoginUserService;
	
	
	/*기업 로그인 & 체크*/
	@RequestMapping(value="/user/biz/login/bizLogin.do")
	public String bizLogin(HttpSession session, BizLoginUserVO vo) throws Exception{
		int result= bizLoginUserService.b_LoginCheck(vo);
		String url= "user/main/main";
		if(result==1) {
			BizLoginUserVO b_user=bizLoginUserService.b_login(vo);
			session.setAttribute("b_user", b_user);
			url= "user/main/main";
		}else {
			url= "user/biz/login/bizLoginForm";
		}
		return url;
	}
	
	/*기업 로그아웃*/
	@RequestMapping(value="/user/biz/login/bizLogout.do")
	public String bizLogout(HttpSession session) {
		session.invalidate();
		return "user/main/main";
	}
}
