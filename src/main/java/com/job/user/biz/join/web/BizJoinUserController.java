package com.job.user.biz.join.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.user.biz.join.service.BizJoinUserService;
import com.job.user.biz.join.service.BizJoinUserVO;

@Controller
public class BizJoinUserController {

	@Resource(name = "bizJoinUserService")
	private BizJoinUserService bizJoinUserService;

	/* 기업회원가입 post*/
	@RequestMapping(value="/user/biz/join/bizJoin.do")
	public String bizJoin(BizJoinUserVO vo) throws Exception{
		int result=bizJoinUserService.bsm_no_check(vo);
		try {
			if(result==1) {
				return"user/biz/join/bizJoinForm";
			}else if(result==0) {
				bizJoinUserService.insertJoin(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("BizJoinUserController join start...");
		return "user/biz/login/bizLoginForm";
	}
	
	
	/*사업자번호 중복체크*/
	@ResponseBody
	@RequestMapping(value="/bsm_no_check.do")
	public int bsm_no_check(BizJoinUserVO vo)throws Exception {
		int result=bizJoinUserService.bsm_no_check(vo);
		return result;
	}
	
	/*패스워드 유효성 검사*/
	@ResponseBody
	@RequestMapping(value="/bizPwCheck.do")
	public boolean pwCheck(String pass) {
		
		boolean check=false;
		String pw_check= "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{6,18}$";;
		Pattern pattern_symbol=Pattern.compile(pw_check);
		Matcher matcher_symbol=pattern_symbol.matcher(pass);
		if(matcher_symbol.find()) {
			check=true;
		}
		return check;
	}
	
	
	
}
