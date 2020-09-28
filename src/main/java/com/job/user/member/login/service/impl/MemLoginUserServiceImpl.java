package com.job.user.member.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;

@Service("memLoginUserService")
public class MemLoginUserServiceImpl implements MemLoginUserService {

	@Resource(name = "memLoginUserDAO")
	MemLoginUserDAO memLoginUserDAO;

	/*개인회원가입*/
	@Override
	public void join(MemLoginUserVO vo) {
		memLoginUserDAO.join(vo);

	}
	
	/*아이디 중복체크*/
	@Override
	public int m_check(MemLoginUserVO vo) throws Exception {
		int result=memLoginUserDAO.m_check(vo);
		return result;
	}

}
