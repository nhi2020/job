package com.job.user.member.join.service;

import com.job.util.JobFileVO;

public interface MemJoinUserService {
	/*개인회원가입*/
	public void insertJoin(MemJoinUserVO vo);
	/*아이디 중복체크*/
	public int m_check(MemJoinUserVO vo) throws Exception;
	/*이메일 중복체크*/
	public int e_check(MemJoinUserVO vo) throws Exception;
	/*전화번호 중복체크*/
	public int p_check(MemJoinUserVO vo) throws Exception;
	/*개인 이미지 넣기*/
	public int insertMemImage(JobFileVO vo) throws Exception;
}
