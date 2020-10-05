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
	public List<MemMyUserVO> memMyList() {
		System.out.println("start service");
		return memMyUserDAO.memMyList();
	}

	// 개인정보
	@Override
	public MemMyUserVO memMySelect(MemMyUserVO vo) {
		return memMyUserDAO.memMySelect(vo);
	}
	//업데이트1
	@Override
	public int memMyUpdate(MemMyUserVO vo) throws Exception {
		int result = memMyUserDAO.memMyUpdate(vo);
		return result;
	}
	//업데이트2
	@Override
	public int myUpdate(MemMyUserVO vo) {
		return memMyUserDAO.myupdate(vo);
	}

}
