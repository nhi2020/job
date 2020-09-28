package com.job.user.member.login.service;

public interface MemLoginUserService {
	/*개인회원가입*/
	public void join(MemLoginUserVO vo);
	/*아이디 중복체크*/
	public int m_check(MemLoginUserVO vo) throws Exception;
}
