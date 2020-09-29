package com.job.user.member.join.service;

public interface MemJoinUserService {
	/*개인회원가입*/
	public void insertJoin(MemJoinUserVO vo);
	/*아이디 중복체크*/
	public int m_check(MemJoinUserVO vo) throws Exception;
}
