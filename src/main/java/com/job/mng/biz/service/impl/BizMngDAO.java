package com.job.mng.biz.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.mng.biz.service.BizMngVO;
import com.job.mng.main.service.Criteria;

@Repository("bizMngDAO")
public class BizMngDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<BizMngVO> getList(Criteria cri) {
		return sessionTemplate.selectList("BizMngVO.mngSelectBizList", cri);
	}

	public int getTotalCount(Criteria cri) {
		
		return sessionTemplate.selectOne("BizMngVO.mngBizTotal", cri);
	}

	public BizMngVO bizView(int bnum) {
		return sessionTemplate.selectOne("BizMngVO.bizViewOne", bnum);
	}

	public boolean update(BizMngVO biz) {
		if (sessionTemplate.update("BizMngVO.bizMngUpdate", biz) == 1) {
			return true;
		} else {
			return false;
		}
		
	}

	public void insert(BizMngVO biz) {

		sessionTemplate.insert("BizMngVO.bizMngInsert", biz);
		
	}

	public boolean remove(int bnum) {
		if (sessionTemplate.delete("BizMngVO.bizMngRemove", bnum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public List<BizMngVO> selectedList(String choice) {

		return sessionTemplate.selectList("BizMngVO.bizMngselectedList", choice);
	}
	
	
}
