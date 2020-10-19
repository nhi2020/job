package com.job.mng.review.service;

import java.util.List;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.ReviewPageDTO;

public interface ReviewMngService {

	int getSalTotalCount(Criteria cri);

	int getMRevTotalCount(Criteria cri);

	int getRevTotalCount(Criteria cri);

	List<ReviewMngVO> getSalList(Criteria cri);

	List<ReviewMngVO> getMRevList(Criteria cri);

	List<ReviewMngVO> getRevList(Criteria cri);

	ReviewMngVO reviewViewOne(int rnum);

	int reviewMngRemove(int rnum);

	
	
}
