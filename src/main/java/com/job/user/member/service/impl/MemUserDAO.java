package com.job.user.member.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.service.MemUserVO;

@Repository("memUserDAO")
public class MemUserDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<MemUserVO> list() throws Exception {
		return sessionTemplate.selectList("mem.selectMemList");
	}
}
