package com.job.user.member.login.service.impl;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;

@Service("memLoginUserService")
public class MemLoginUserServiceImpl implements MemLoginUserService{
	
	@Resource(name="memLoginUserDAO")
	private MemLoginUserDAO memLoginUserDAO;

	/*개인 로그인*/
	@Override
	public MemLoginUserVO user(MemLoginUserVO vo) throws Exception {
		return memLoginUserDAO.user(vo);
	}

	/*개인 로그인 체크*/
	@Override
	public int loginCheck(MemLoginUserVO vo) throws Exception {
		int result= memLoginUserDAO.loginCheck(vo);
		return result;
	}

	/*개인 아이디 찾기*/
	@Override
	public String memFindId(HttpServletResponse response,MemLoginUserVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String id=memLoginUserDAO.memFindId(vo);
		System.out.println("id:"+id);
		if(id==null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	
	/*개인 비밀번호 변경을 위한 아이디, 이메일 일치 여부*/
	@Override
	public int memPassCheck(MemLoginUserVO vo) throws Exception {
		int result=memLoginUserDAO.memPassCheck(vo);
		return result;
	}
	
	/*개인 비밀번호 찾기 후 변경*/
	@Override
	public void memPassChange(Map<String, Object> map, MemLoginUserVO vo) throws Exception {
		memLoginUserDAO.memPassChange(map,vo);
		
	}



	
}
