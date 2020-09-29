package com.job.user.member.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.mypage.service.MemMyUserVO;

@Repository("memMyUserDAO")
public class MemMyUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원정보리스트
	public List<MemMyUserVO> memmylist() {
		System.out.println("startdao");
		List<MemMyUserVO> memmylist = sqlSessionTemplate.selectList("MemMyUser.memmyList");
		System.out.println(memmylist);
		return memmylist;

	}

	// 개인정보
	public MemMyUserVO memmySelect(String id) {
		//String id = "aaa12";
		// TODO Auto-generated method stub
		MemMyUserVO ss = sqlSessionTemplate.selectOne("MemMyUser.memmySelect", id);
		System.out.println("=======================================");
		System.out.println(ss);
		System.out.println("=======================================");
		// return (HashMap) sqlSessionTemplate.selectOne("MemMyUser.memmySelect", id);
		return ss;
	}

	/* 개인정보 업데이트 */
	public int memmyUpdate(MemMyUserVO vo) throws Exception {
		//String id = "aaa12";
		return sqlSessionTemplate.update("MemMyUser.memmyUpdate", vo);
	}
	
	/*업데이트2*/
	public int myupdate(MemMyUserVO vo) {
		System.out.println("1111111111");
		int k =0;
			k=sqlSessionTemplate.update("MemMyUser.myupdate", vo);
			System.out.println("k : "+k);
		return k;
	}
	
	
}
