package com.job.user.member.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface MemLoginUserService {

	/*개인 로그인*/
	public MemLoginUserVO user(MemLoginUserVO vo) throws Exception;
	
	/*개인 로그인 체크*/
	public int loginCheck(MemLoginUserVO vo) throws Exception;
	
	/*개인 아이디 찾기*/
	public String memFindId(HttpServletResponse response,MemLoginUserVO vo)throws Exception;
	
	/*개인 비밀번호 변경을 위한 아이디, 이메일 일치 여부*/
	public int memPassCheck(MemLoginUserVO vo)throws Exception;

	/*개인 비밀번호 찾기 후 변경*/
	public void memPassChange(Map<String, Object> map, MemLoginUserVO vo)throws Exception;

	
}
