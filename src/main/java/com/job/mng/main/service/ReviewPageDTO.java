package com.job.mng.main.service;

import java.util.List;

import com.job.mng.review.service.ReviewMngVO;

public class ReviewPageDTO {

	private PageDTO pageMaker;
	private List<ReviewMngVO> rlist;
	public PageDTO getPageMaker() {
		return pageMaker;
	}
	public void setPageMaker(PageDTO pageMaker) {
		this.pageMaker = pageMaker;
	}
	public List<ReviewMngVO> getRlist() {
		return rlist;
	}
	public void setRlist(List<ReviewMngVO> rlist) {
		this.rlist = rlist;
	}
	public ReviewPageDTO(PageDTO pageMaker, List<ReviewMngVO> rlist) {
		super();
		this.pageMaker = pageMaker;
		this.rlist = rlist;
	}
	
	
	
}
