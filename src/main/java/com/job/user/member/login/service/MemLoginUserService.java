package com.job.user.member.login.service;

import javax.servlet.http.HttpServletResponse;

public interface MemLoginUserService {

	/*개인 로그인*/
	public MemLoginUserVO user(MemLoginUserVO vo) throws Exception;
	
	/*개인 로그인 체크*/
	public int loginCheck(MemLoginUserVO vo) throws Exception;
	
	/*개인 아이디 찾기*/
	public String memFindId(HttpServletResponse response,MemLoginUserVO vo)throws Exception;

	


	
}
