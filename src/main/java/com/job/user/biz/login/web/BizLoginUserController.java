package com.job.user.biz.login.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;

@Controller
public class BizLoginUserController {

	@Resource(name = "bizLoginUserService")
	private BizLoginUserService bizLoginUserService;

	/* 기업회원가입  get*/
	@RequestMapping(value = "/user/login/biz/bizjoin.do", method=RequestMethod.GET)
	public void join() throws Exception {
		System.out.println("BizLoginUserController join start...");
	}
	
	/* 기업회원가입 post*/
	@RequestMapping(value="/user/login/biz/bizlogin.do", method=RequestMethod.POST)
	public String join2(BizLoginUserVO vo) throws Exception{
		int result=bizLoginUserService.bsm_no_check(vo);
		try {
			if(result==1) {
				return"user/login/biz/bizjoin";
			}else if(result==0) {
				bizLoginUserService.join(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("BizLoginUserController join2 start...");
		return "user/login/biz/bizlogin";
	}
	
	/*사업자번호 중복체크*/
	@ResponseBody
	@RequestMapping(value="/bsm_no_check",method=RequestMethod.POST)
	public int bsm_no_check(BizLoginUserVO vo)throws Exception {
		int result=bizLoginUserService.bsm_no_check(vo);
		return result;
	}
	/*회원가입 취소 버튼시 메인페이지로 복귀*/
	@RequestMapping(value="/user/main/main.do")
	public String main()throws Exception{
		return "user/main/main";
	}
	
}
