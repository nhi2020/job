package com.job.mng.biz.service;

import java.util.List;

import com.job.mng.main.service.Criteria;
import com.job.util.JobFileVO;

public interface BizMngService {

	List<BizMngVO> getList(Criteria cri);

	int getTotalCount(Criteria cri);

	BizMngVO bizView(int bnum);

	boolean remove(int bnum);

	List<BizMngVO> selectedList(String choice);

	JobFileVO picView(int attachid);

	BizMngVO bizViewbyAttachId(int attachid);

}
