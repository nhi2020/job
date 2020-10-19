package com.job.user.member.join.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.member.join.service.MemJoinUserService;
import com.job.user.member.join.service.MemJoinUserVO;
import com.job.util.JobFileVO;

@Service("memJoinUserService")
public class MemJoinUserServiceImpl implements MemJoinUserService {

	@Resource(name = "memJoinUserDAO")
	private MemJoinUserDAO memJoinUserDAO;

	/*개인회원가입*/
	@Override
	public void insertJoin(MemJoinUserVO vo) {
		memJoinUserDAO.insertJoin(vo);

	}
	
	/*아이디 중복체크*/
	@Override
	public int m_check(MemJoinUserVO vo) throws Exception {
		int result=memJoinUserDAO.m_check(vo);
		return result;
	}
	
	/*이메일 중복체크*/
	@Override
	public int e_check(MemJoinUserVO vo) throws Exception {
		int result=memJoinUserDAO.e_check(vo);
		return result;
	}

	/*전화번호 중복체크*/
	@Override
	public int p_check(MemJoinUserVO vo) throws Exception {
		int result=memJoinUserDAO.p_check(vo);
		return result;
	}

	
	/*개인 이미지 넣기*/
	@Override
	public int insertMemImage(JobFileVO vo) throws Exception {
		int result=memJoinUserDAO.insertMemImage(vo);
		return result;
	}

	


}
