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

	/* 개인회원 리스트 */
	public List<MemMyUserVO> memMyList() {
		List<MemMyUserVO> memMylist = sqlSessionTemplate.selectList("MemMyUser.memMyList");
		return memMylist;

	}

	/* 개인정보 */
	public MemMyUserVO memMySelect(MemMyUserVO vo) {
		// String id = "aaa12";
		MemMyUserVO user = sqlSessionTemplate.selectOne("MemMyUser.memMySelect", vo);
		return user;
	}

	/* 개인정보 업데이트 */
	public int memMyUpdate(MemMyUserVO vo) throws Exception {
		// String id = "aaa12";
		int result = (Integer) sqlSessionTemplate.update("MemMyUser.memMyUpdate", vo);
		return result;
	}

	/* 개인정보 업데이트1 */
	public int myupdate(MemMyUserVO vo) {
		int result = (Integer) sqlSessionTemplate.update("MemMyUser.myUpdate", vo);
		return result;
	}

	/* 개인회원 탈퇴 */
	public void memMyDelete(MemMyUserVO vo) throws Exception {
		sqlSessionTemplate.delete("MemMyUser.memMyDelete", vo);
	}

	/* 패스워드 체크 */
	public int myPassChk(MemMyUserVO vo) throws Exception{
		int result = sqlSessionTemplate.selectOne("MemMyUser.myPassChk",vo);
		return result;
		
	}
	
	/* 비밀번호 업데이트 */
	public int myUpdatePassChng(MemMyUserVO vo) {
		int result = (Integer) sqlSessionTemplate.update("MemMyUser.myUpdatePassChng", vo);
		return result;
	}
	
	
}
