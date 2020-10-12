package com.job.mng.biz.service;

import java.util.List;

import com.job.mng.main.service.Criteria;

public interface BizMngService {

	List<BizMngVO> getList(Criteria cri);

	int getTotalCount(Criteria cri);

	BizMngVO bizView(int bnum);

	boolean update(BizMngVO biz);

	void insert(BizMngVO biz);

	boolean remove(int bnum);

	List<BizMngVO> selectedList(String choice);

}
