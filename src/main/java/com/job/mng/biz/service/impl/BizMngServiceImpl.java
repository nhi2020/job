package com.job.mng.biz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.mng.biz.service.BizMngService;
import com.job.mng.biz.service.BizMngVO;
import com.job.mng.main.service.Criteria;
import com.job.util.JobFileVO;

@Service("bizMngService")
public class BizMngServiceImpl implements BizMngService{

	@Resource(name="bizMngDAO")
	private BizMngDAO bmd;

	@Override
	public List<BizMngVO> getList(Criteria cri) {
		return bmd.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return bmd.getTotalCount(cri);
	}

	@Override
	public BizMngVO bizView(int bnum) {
		return bmd.bizView(bnum);
	}

	@Override
	public boolean remove(int bnum) {
		return bmd.remove(bnum);
	}

	@Override
	public List<BizMngVO> selectedList(String choice) {
		return bmd.selectedList(choice);
	}

	@Override
	public JobFileVO picView(int attachid) {
		return bmd.picView(attachid);
	}

	@Override
	public BizMngVO bizViewbyAttachId(int attachid) {
		return bmd.bizViewbyAttachId(attachid);
	}
	
	
}
