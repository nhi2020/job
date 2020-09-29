package com.job.user.member.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.member.login.service.MemLoginUserService;

@Service("memLoginUserService")
public class MemLoginUserServiceImpl implements MemLoginUserService{
	
	@Resource(name="memLoginUserDAO")
	private MemLoginUserDAO memLoginUserDAO;
	
}
