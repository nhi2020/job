package com.job.mng.biz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.mng.biz.service.BizMngService;
import com.job.mng.biz.service.BizMngVO;
import com.job.mng.main.service.Criteria;

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
	public boolean update(BizMngVO biz) {

		return bmd.update(biz);
	}

	@Override
	public void insert(BizMngVO biz) {

		bmd.insert(biz);
	}

	@Override
	public boolean remove(int bnum) {
		return bmd.remove(bnum);
	}

	@Override
	public List<BizMngVO> selectedList(String choice) {
		return bmd.selectedList(choice);
	}
	
	
}
