package com.job.mng.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.mng.main.service.Criteria;
import com.job.mng.member.service.MemMngService;
import com.job.mng.member.service.MemMngVO;
import com.job.util.JobFileVO;

@Service("memMngService")
public class MemMngServiceImpl implements MemMngService{

	@Resource(name = "memMngDAO")
	private MemMngDAO mmd;

	@Override
	public List<MemMngVO> getList(Criteria cri) {
		return mmd.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mmd.getTotalCount(cri);
	}

	@Override
	public MemMngVO memView(int mnum) {
		return mmd.memView(mnum);
	}

	@Override
	public boolean remove(int mnum) {
		return mmd.remove(mnum);
	}

	@Override
	public MemMngVO memViewbyAttachId(int attachid) {
		return mmd.memViewbyAttachId(attachid);
	}

	@Override
	public JobFileVO picView(int attachid) {
		return mmd.picView(attachid);
	}

	
	
}
