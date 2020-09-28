package com.job.user.member.mypage.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MemMyUserService {
	//public MemMyUserVO memmySelect(String id);

	public List<MemMyUserVO> memmylist();

	public MemMyUserVO memmySelect(HttpServletRequest request);
	

}
