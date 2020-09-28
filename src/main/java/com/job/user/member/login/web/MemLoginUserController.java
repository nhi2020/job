package com.job.user.member.login.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;

@Controller
public class MemLoginUserController {
	@Resource(name="memLoginUserService")
	MemLoginUserService memLoginUserService;
	
	/*개인회원가입 get*/
	@RequestMapping(value="/user/login/member/memjoin.do", method=RequestMethod.GET)
	public void join() throws Exception {
		System.out.println("MemLoginUserController join start...");
	}
	
	/*개인회원가입 post*/
	@RequestMapping(value="/user/login/member/memlogin.do",method=RequestMethod.POST)
	public String join2(MemLoginUserVO vo)throws Exception{
		int result=memLoginUserService.m_check(vo);
		try {
			if(result==1) {
				return "user/login/member/memjoin";
			}else if(result==0) {
				memLoginUserService.join(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("MemLoginUserController join2 start...");
		
		return "user/login/member/memlogin";
	}
	/*아이디 중복체크*/
	@ResponseBody
	@RequestMapping(value="/m_check",method=RequestMethod.POST)
	public int m_check(MemLoginUserVO vo)throws Exception{
		int result=memLoginUserService.m_check(vo);
		return result;
		
	}

}
