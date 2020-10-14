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

		return sessionTemplate.selectOne("ReviewMngVO.reviewMngOne", rnum);
	}

	public int salTotalCount(Criteria cri) {
		return sessionTemplate.selectOne("ReviewMngVO.MngSalTotal", cri);
	}

	public int mrevTotalCount(Criteria cri) {
		return sessionTemplate.selectOne("ReviewMngVO.MngMrevTotal", cri);
	}

	public int revTotalCount(Criteria cri) {
		return sessionTemplate.selectOne("ReviewMngVO.MngRevTotal", cri);
	}

	public List<ReviewMngVO> getSalList(Criteria cri) {
		return sessionTemplate.selectList("ReviewMngVO.MngSalList", cri);
	}

	public List<ReviewMngVO> getRevList(Criteria cri) {
		return sessionTemplate.selectList("ReviewMngVO.MngRevList", cri);
	}

	public List<ReviewMngVO> getMRevList(Criteria cri) {
		return sessionTemplate.selectList("ReviewMngVO.MngMRevList", cri);
	}

}
