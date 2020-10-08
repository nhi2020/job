package com.job.mng.review.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.mng.main.service.Criteria;
import com.job.mng.review.service.ReviewMngVO;

@Repository("reviewMngDao")
public class ReviewMngDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public ReviewMngVO reviewView(int rnum) {

		return sessionTemplate.selectOne("reviewMng.reviewMngOne", rnum);
	}

	public int salTotalCount(Criteria cri) {
		return sessionTemplate.selectOne("reviewMng.MngSalTotal", cri);
	}

	public int mrevTotalCount(Criteria cri) {
		return sessionTemplate.selectOne("reviewMng.MngMrevTotal", cri);
	}

	public int revTotalCount(Criteria cri) {
		return sessionTemplate.selectOne("reviewMng.MngRevTotal", cri);
	}

	public List<ReviewMngVO> getSalList(Criteria cri) {
		return sessionTemplate.selectList("reviewMng.MngSalList", cri);
	}

	public List<ReviewMngVO> getRevList(Criteria cri) {
		return sessionTemplate.selectList("reviewMng.MngRevList", cri);
	}

	public List<ReviewMngVO> getMRevList(Criteria cri) {
		return sessionTemplate.selectList("reviewMng.MngMRevList", cri);
	}

}
