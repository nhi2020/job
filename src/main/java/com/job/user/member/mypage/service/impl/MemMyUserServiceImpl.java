package com.job.user.member.mypage.service.impl;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;

@Service("memMyUserService")
public class MemMyUserServiceImpl implements MemMyUserService {
	
	@Resource(name = "memMyUserDAO")
	private MemMyUserDAO memMyUserDAO;

	@Override
	public List<MemMyUserVO> memmylist() {
		System.out.println("start service");
		return memMyUserDAO.memmylist();
	}

	@Override
	public MemMyUserVO memmySelect(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return memMyUserDAO.memmySelect(request);
	}

	
}
