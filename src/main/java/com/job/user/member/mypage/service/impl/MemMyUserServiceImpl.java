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

	// 회원정보리스트
	@Override
	public List<MemMyUserVO> memmylist() {
		System.out.println("start service");
		return memMyUserDAO.memmylist();
	}

	// 개인정보
	@Override
	public MemMyUserVO memmySelect(String id) {
		// TODO Auto-generated method stub
		return memMyUserDAO.memmySelect(id);
	}
	//업데이트1
	@Override
	public int memmyUpdate(MemMyUserVO vo) throws Exception {
		int result = memMyUserDAO.memmyUpdate(vo);
		return result;
	}
	//업데이트2
	@Override
	public int myupdate(MemMyUserVO vo) {
		// TODO Auto-generated method stub
		System.out.println("222222222222");
		return memMyUserDAO.myupdate(vo);
	}

}
