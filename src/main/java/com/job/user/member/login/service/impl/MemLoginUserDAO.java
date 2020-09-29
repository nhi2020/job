package com.job.user.member.login.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.join.service.MemJoinUserVO;

@Repository("memLoginUserDAO")
public class MemLoginUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

}
