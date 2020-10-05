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

	/* 개인회원 리스트 */
	@Override
	public List<MemMyUserVO> memMyList() {
		System.out.println("start service");
		return memMyUserDAO.memMyList();
	}

	/* 개인정보 */
	@Override
	public MemMyUserVO memMySelect(MemMyUserVO vo) {
		return memMyUserDAO.memMySelect(vo);
	}

	/* 개인정보 업데이트 */
	@Override
	public int memMyUpdate(MemMyUserVO vo) throws Exception {
		int result = memMyUserDAO.memMyUpdate(vo);
		return result;
	}

	/* 개인정보 업데이트1 */
	@Override
	public int myUpdate(MemMyUserVO vo) {
		return memMyUserDAO.myupdate(vo);
	}
	
	/*개인회원 탈퇴*/
	@Override
	public void memMyDelete(MemMyUserVO vo) throws Exception {
		memMyUserDAO.memMyDelete(vo);
		
	}

	/*패스워드 체크*/
	@Override
	public int myPassChk(MemMyUserVO vo) throws Exception {
		int result = memMyUserDAO.myPassChk(vo);
		return result;
	}
	
	/* 비밀번호 업데이트 */
	@Override
	public int myUpdatePassChng(MemMyUserVO vo) {
		int result = memMyUserDAO.myUpdatePassChng(vo);
		return result;
	}
	

}
