package com.job.mng.member.service;

import java.util.List;

import com.job.mng.main.service.Criteria;

public interface MemMngService {

	List<MemMngVO> getList(Criteria cri);

	int getTotalCount(Criteria cri);

	MemMngVO memView(int mnum);

	boolean update(MemMngVO member);

	boolean remove(int mnum);

	void insert(MemMngVO member);

}
