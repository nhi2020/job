package com.job.mng.review.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.ReviewPageDTO;
import com.job.mng.review.service.ReviewMngService;
import com.job.mng.review.service.ReviewMngVO;

@Service("reviewMngService")
public class ReviewMngServiceImpl implements ReviewMngService {

	@Resource(name="reviewMngDao")
	private ReviewMngDAO rmd;
	
	@Override
	public ReviewMngVO reviewView(int rnum) {

		return rmd.reviewView(rnum);
	}

	@Override
	public int getSalTotalCount(Criteria cri) {
		return rmd.salTotalCount(cri);
	}

	@Override
	public int getMRevTotalCount(Criteria cri) {
		return rmd.mrevTotalCount(cri);
	}

	@Override
	public int getRevTotalCount(Criteria cri) {
		return rmd.revTotalCount(cri);
	}

	@Override
	public List<ReviewMngVO> getSalList(Criteria cri) {

		return rmd.getSalList(cri);
	}

	@Override
	public List<ReviewMngVO> getMRevList(Criteria cri) {
		return rmd.getMRevList(cri);
	}

	@Override
	public List<ReviewMngVO> getRevList(Criteria cri) {
		return rmd.getRevList(cri);
	}


	
	

}
