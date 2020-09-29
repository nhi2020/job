package com.job.user.member.join.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.member.join.service.MemJoinUserService;
import com.job.user.member.join.service.MemJoinUserVO;

@Service("memJoinUserService")
public class MemJoinUserServiceImpl implements MemJoinUserService {

	@Resource(name = "memJoinUserDAO")
	MemJoinUserDAO memJoinUserDAO;

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

}
