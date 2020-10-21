package com.job.mng.member.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.mng.main.service.Criteria;
import com.job.mng.member.service.MemMngVO;
import com.job.util.JobFileVO;

@Repository("memMngDAO")
public class MemMngDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<MemMngVO> getList(Criteria cri) {
		System.out.println("memMngDao.....getList()");
		return sessionTemplate.selectList("MemMngVO.mngSelectMemList", cri);
	}

	public int getTotalCount(Criteria cri) {
		System.out.println("memMngDao.....getTotalCount()");
		return sessionTemplate.selectOne("MemMngVO.mngMemTotal", cri);
	}

	public MemMngVO memView(int mnum) {
		System.out.println("memMngDao ..... memView()");
		return sessionTemplate.selectOne("MemMngVO.memViewOne", mnum);
	}

	public boolean update(MemMngVO member) {

		if (sessionTemplate.update("MemMngVO.memMngUpdate", member) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean remove(int mnum) {
		if (sessionTemplate.update("MemMngVO.memMngRemove", mnum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public MemMngVO memViewbyAttachId(int attachid) {
		return sessionTemplate.selectOne("MemMngVO.memViewbyAttachId", attachid);
	}

	public JobFileVO picView(int attachid) {
		return sessionTemplate.selectOne("MemMngVO.memimgView", attachid);
	}

}
