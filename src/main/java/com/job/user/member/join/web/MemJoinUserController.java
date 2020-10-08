package com.job.user.member.join.web;

import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.user.member.join.service.MemJoinUserService;
import com.job.user.member.join.service.MemJoinUserVO;
import com.job.util.JobFileUtils;
import com.job.util.JobFileVO;

@Controller
public class MemJoinUserController {
	@Resource(name="memJoinUserService")
	MemJoinUserService memJoinUserService;
	
	@Resource(name="jobFileUtils")
	private JobFileUtils jobFileUtils;
	
	/*개인회원가입 폼*/
	@RequestMapping(value="/user/member/join/memJoinForm.do")
	public String memJoinForm() {
		return "user/member/join/memJoinForm";
	}
	
	/*개인회원가입 post*/
	@RequestMapping(value="/user/member/join/memJoin.do")
	public String memJoin(HttpServletRequest request,MemJoinUserVO vo,HttpServletResponse response)throws Exception{
		int result=memJoinUserService.m_check(vo);
		String path="job\\src\\main\\webapp\\resources\\images\\upload\\member\\";
		List<JobFileVO> list= jobFileUtils.parseInsertFileInfo(request, path);
		try {
			if(result==1) {
				return "user/member/join/memJoinForm";
			}else if(result==0) {
				memJoinUserService.insertMemImage(list.get(0));
				memJoinUserService.insertJoin(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("MemJoinUserController join start...");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('회원가입되었습니다.');</script>");
		writer.flush();
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
	
	/*이메일 중복체크*/
	@ResponseBody
	@RequestMapping(value="/e_check.do")
	public int e_check(MemJoinUserVO vo) throws Exception{
		int result=memJoinUserService.e_check(vo);
		System.out.println("이메일 중복체크:"+result);
		return result;
	}
	
	/*패스워드 유효성 검사*/
	@ResponseBody
	@RequestMapping(value="/memPwCheck.do")
	public boolean pwCheck(String pass) {
		
		boolean check=false;
		String pw_check= "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{6,18}$";
		Pattern pattern_symbol=Pattern.compile(pw_check);
		Matcher matcher_symbol=pattern_symbol.matcher(pass);
		if(matcher_symbol.find()) {
			check=true;
		}
		return check;
	}
}
