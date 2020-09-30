package com.job.user.member.mypage.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.mypage.service.MemMyUserVO;

@Repository("memMyUserDAO")
public class MemMyUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원정보리스트
	public List<MemMyUserVO> memMyList() {
		List<MemMyUserVO> memMylist = sqlSessionTemplate.selectList("MemMyUser.memMyList");
		return memMylist;

	}

	// 개인정보
	public MemMyUserVO memMySelect(String id) {
		//String id = "aaa12";
		MemMyUserVO user = sqlSessionTemplate.selectOne("MemMyUser.memMySelect", id);
		return user;
	}

	/* 개인정보 업데이트 */
	public int memMyUpdate(MemMyUserVO vo) throws Exception {
		//String id = "aaa12";
		int result = (Integer)sqlSessionTemplate.update("MemMyUser.memMyUpdate", vo);
		return result;
	}
	
	/*업데이트2*/
	public int myupdate(MemMyUserVO vo) {
		int result = (Integer)sqlSessionTemplate.update("MemMyUser.myUpdate", vo);
		System.out.println("result : "+result);
		return result;
	}
	
}
