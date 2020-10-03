package com.job.user.biz.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;

@Controller
public class BizLoginUserController {
	
	@Resource(name="bizLoginUserService")
	private BizLoginUserService bizLoginUserService;
	
	/*기업로그인*/
	@RequestMapping(value="/user/biz/login/bizLoginForm.do")
	public String bizLoginForm() {
		return "user/biz/login/bizLoginForm";
	}
	
	
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
	
	/*기업 사업자 번호 찾기 폼*/
	@RequestMapping(value="/user/biz/login/bizFindBsmForm.do")
	public String bizFindBsmForm() throws Exception {
		return "/user/biz/login/bizFindBsmForm";
	}
	
	/*기업 사업자 번호 찾기*/ 
	@RequestMapping(value="/user/biz/login/bizFindBsm.do")
	public String bizFindBsm(HttpServletResponse response,Model model, BizLoginUserVO vo) throws Exception{
		model.addAttribute("bsmno",bizLoginUserService.findBsmno(response, vo));
		return "/user/biz/login/bizFindBsm";
	}
	
}
