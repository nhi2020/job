package com.job.mng.member.service;

import java.util.List;

import com.job.mng.main.service.Criteria;
import com.job.util.JobFileVO;

public interface MemMngService {

	List<MemMngVO> getList(Criteria cri);

	int getTotalCount(Criteria cri);

	MemMngVO memView(int mnum);

	boolean remove(int mnum);

	MemMngVO memViewbyAttachId(int attachid);

	JobFileVO picView(int attachid);

}
