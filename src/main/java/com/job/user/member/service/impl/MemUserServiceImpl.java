package com.job.user.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.member.service.MemUserService;
import com.job.user.member.service.MemUserVO;

@Service("memUserService")
public class MemUserServiceImpl implements MemUserService {

	@Resource(name = "memUserDAO")
	private MemUserDAO memUserDao;

	@Override
	public List<MemUserVO> list() throws Exception {

		return memUserDao.list();
	}

}
