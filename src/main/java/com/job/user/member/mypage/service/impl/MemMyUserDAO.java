package com.job.user.member.mypage.service.impl;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.mypage.service.MemMyUserVO;

@Repository("memMyUserDAO")
public class MemMyUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemMyUserVO> memmylist() {
		System.out.println("startdao");
		List<MemMyUserVO> memmylist = sqlSessionTemplate.selectList("MemMyUser.memmyList");
		System.out.println(memmylist);
		return memmylist;

	}


	public MemMyUserVO memmySelect(HttpServletRequest request) {
		String id = "aaa12";
		// TODO Auto-generated method stub
		MemMyUserVO ss =  sqlSessionTemplate.selectOne("MemMyUser.memmySelect", id);
		System.out.println("=======================================");
		System.out.println(ss);
		System.out.println("=======================================");
		//return (HashMap) sqlSessionTemplate.selectOne("MemMyUser.memmySelect", id);
		return ss;
	}

}
