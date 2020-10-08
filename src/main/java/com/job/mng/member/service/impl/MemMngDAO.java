package com.job.mng.member.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.mng.main.service.Criteria;
import com.job.mng.member.service.MemMngVO;

@Repository("memMngDAO")
public class MemMngDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<MemMngVO> getList(Criteria cri) {
		System.out.println("memMngDao.....getList()");
		return sessionTemplate.selectList("MemMng.mngSelectMemList", cri);
	}

	public int getTotalCount(Criteria cri) {
		System.out.println("memMngDao.....getTotalCount()");
		return sessionTemplate.selectOne("MemMng.mngMemTotal", cri);
	}

	public MemMngVO memView(int mnum) {
		System.out.println("memMngDao ..... memView()");
		return sessionTemplate.selectOne("MemMng.memViewOne", mnum);
	}

	public boolean update(MemMngVO member) {

		if (sessionTemplate.update("MemMng.memMngUpdate", member) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean remove(int mnum) {
		if (sessionTemplate.delete("MemMng.memMngRemove", mnum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public void insert(MemMngVO member) {
		
		System.out.println("memmngDao insert()");
		sessionTemplate.insert("MemMng.memMngInsert", member);
	}
	
}
