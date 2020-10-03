package com.job.user.member.join.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.user.member.join.service.MemJoinUserService;
import com.job.user.member.join.service.MemJoinUserVO;
import com.job.util.FileUtils;

@Controller
public class MemJoinUserController {
	@Resource(name="memJoinUserService")
	MemJoinUserService memJoinUserService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	/*개인회원가입 폼*/
	@RequestMapping(value="/user/member/join/memJoinForm.do")
	public String memJoinForm() {
		return "user/member/join/memJoinForm";
	}
	
	/*개인회원가입 post*/
	@RequestMapping(value="/user/member/join/memJoin.do")
	public String memJoin(HttpServletRequest request,MemJoinUserVO vo)throws Exception{
		int result=memJoinUserService.m_check(vo);
		fileUtils.parseInsertFileInfo(request);
		try {
			if(result==1) {
				return "user/member/join/memJoinForm";
			}else if(result==0) {
				memJoinUserService.insertJoin(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("MemJoinUserController join start...");
		
		return "user/member/login/memLoginForm";
	}
	/*아이디 중복체크*/
	@ResponseBody
	@RequestMapping(value="/m_check.do")
	public int m_check(MemJoinUserVO vo)throws Exception{
		int result=memJoinUserService.m_check(vo);
		System.out.println("아이디 중복체크");
		return result;
		
	}
	/*패스워드 유효성 검사*/
	@ResponseBody
	@RequestMapping(value="/memPwCheck.do")
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
