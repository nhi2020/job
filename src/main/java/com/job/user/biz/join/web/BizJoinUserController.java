package com.job.user.biz.join.web;

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

import com.job.user.biz.join.service.BizJoinUserService;
import com.job.user.biz.join.service.BizJoinUserVO;
import com.job.util.JobFileUtils;
import com.job.util.JobFileVO;

@Controller
public class BizJoinUserController {

	@Resource(name = "bizJoinUserService")
	private BizJoinUserService bizJoinUserService;
	
	@Resource(name="jobFileUtils")
	private JobFileUtils jobFileUtils;

	/*기업회원가입 폼*/
	@RequestMapping(value="/user/biz/join/bizJoinForm.do")
	public String bizJoinForm() {
		return "user/biz/join/bizJoinForm";
	}
	
	/* 기업회원가입 post*/
	@RequestMapping(value="/user/biz/join/bizJoin.do")
	public String bizJoin(BizJoinUserVO vo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int result=bizJoinUserService.bsm_no_check(vo);
		String path="job\\src\\main\\webapp\\resources\\images\\upload\\biz\\";
		List<JobFileVO> list=jobFileUtils.parseInsertFileInfo(request, path);
		try {
			if(result==1) {
				return"user/biz/join/bizJoinForm";
			}else if(result==0) {
				bizJoinUserService.insertBizImage(list.get(0));
				bizJoinUserService.insertJoin(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("BizJoinUserController join start...");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('회원가입되었습니다.');</script>");
		writer.flush();
		return "user/biz/login/bizLoginForm";
	}
	
	
	/*사업자번호 중복체크*/
	@ResponseBody
	@RequestMapping(value="/bsm_no_check.do")
	public int bsm_no_check(BizJoinUserVO vo)throws Exception {
		int result=bizJoinUserService.bsm_no_check(vo);
		System.out.println("사업자번호 중복체크");
		return result;
	}
	
	/*이메일 중복체크*/
	@ResponseBody
	@RequestMapping(value="/bsm_no_e_check.do")
	public int bsm_no_e_check(BizJoinUserVO vo)throws Exception{
		int result=bizJoinUserService.bsm_no_e_check(vo);
		System.out.println("이메일 중복체크 : " +result);
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
