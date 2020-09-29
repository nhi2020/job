package com.job.user.member.login.service;

public interface MemLoginUserService {

	/*개인 로그인*/
	public MemLoginUserVO user(MemLoginUserVO vo) throws Exception;
	
	/*개인 로그인 체크*/
	public int loginCheck(MemLoginUserVO vo) throws Exception;
	
	
	
}
