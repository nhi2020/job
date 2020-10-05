package com.job.user.member.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MemMyUserService {

	/* 개인회원 리스트 */
	public List<MemMyUserVO> memMyList();

	/* 개인정보 */
	public MemMyUserVO memMySelect(MemMyUserVO vo);

	/* 개인정보 업데이트 */
	public int memMyUpdate(MemMyUserVO vo) throws Exception;

	/* 개인정보 업데이트1 */
	public int myUpdate(MemMyUserVO vo);

	/* 개인회원 탈퇴 */
	public void memMyDelete(MemMyUserVO vo) throws Exception;
	
	/*패스워드 체크*/
	public int myPassChk(MemMyUserVO vo) throws Exception;
	
	/* 비밀번호 업데이트 */
	public int myUpdatePassChng(MemMyUserVO vo);
	
}
