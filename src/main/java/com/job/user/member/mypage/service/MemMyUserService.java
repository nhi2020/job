package com.job.user.member.mypage.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MemMyUserService {
	
	// 회원 정보리스트
	public List<MemMyUserVO> memmylist();
	//개인정보
	public MemMyUserVO memmySelect(String id);
	//업데이트
	public int memmyUpdate(MemMyUserVO vo)throws Exception;
	public int myupdate(MemMyUserVO vo); 
	

}
