package com.job.user.member.login.service.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.login.service.MemLoginUserVO;

@Repository("memLoginUserDAO")
public class MemLoginUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	/* 개인 로그인 */
	public MemLoginUserVO user(MemLoginUserVO vo) throws Exception {
		return sqlSessionTemplate.selectOne("memLogin.user", vo);
	}

	/* 개인 로그인 체크 */
	public int loginCheck(MemLoginUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.selectOne("memLogin.loginCheck", vo);
		System.out.println("loginCheck result : " + result);
		return result;
	}

	/* 개인 아이디 찾기 */
	public String memFindId(MemLoginUserVO vo) throws Exception {
		return sqlSessionTemplate.selectOne("memLogin.findId", vo);
	}

	/*개인 비밀번호 찾기 후 변경*/
	public void memPassChange(Map<String, Object> map, MemLoginUserVO vo) throws Exception {
		map.get("pass");
		map.get("email");
		
		sqlSessionTemplate.update("memLogin.memPassChange", map);
	}

}
