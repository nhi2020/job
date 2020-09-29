package com.job.user.member.login.service.impl;

import javax.annotation.Resource;

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

	
	

	
}
