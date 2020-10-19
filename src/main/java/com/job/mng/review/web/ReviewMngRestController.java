package com.job.mng.review.web;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;
import com.job.mng.main.service.ReviewPageDTO;
import com.job.mng.review.service.ReviewMngService;

@RestController
public class ReviewMngRestController {

	@Resource(name="reviewMngService")
	private ReviewMngService rms;
	
	// 기업 리뷰 목록 불러오기
	@RequestMapping(value="/mng/review/tab1/{page}.do", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ReviewPageDTO getRevList(@PathVariable("page") int page) {
		
		Criteria cri = new Criteria(page, 10);
		
		return new ReviewPageDTO(new PageDTO(cri, rms.getRevTotalCount(cri)), rms.getRevList(cri));
		
	}
	
	
	// 연봉 정보 목록 불러오기
	 @RequestMapping(value="/mng/review/tab2/{page2}.do", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	 public ReviewPageDTO getSalList(@PathVariable("page2") int page2) {
		 
		 
		 Criteria cri = new Criteria(page2, 10);
		 
		 return new ReviewPageDTO(new PageDTO(cri, rms.getSalTotalCount(cri)), rms.getSalList(cri));
		 
	 }
	 
	 // 면접 리뷰 목록 불러오기
	 @RequestMapping(value="/mng/review/tab3/{page3}.do", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	 public ReviewPageDTO getMRevList(@PathVariable("page3") int page3) {
		 
		 
		 Criteria cri = new Criteria(page3, 10);
		 
		 return new ReviewPageDTO(new PageDTO(cri, rms.getMRevTotalCount(cri)), rms.getMRevList(cri));
		 
	 }
	 
	 
	 // 기업 리뷰 검색 화면
	@RequestMapping(value="/mng/review/tab1search/search.do", method=RequestMethod.POST)
	@ResponseBody
	public ReviewPageDTO getRevSearchList(Criteria cri) {
			
		Criteria crisearch = new Criteria(cri.getPageNum(), 10, cri.getKeyword(), cri.getType());
			
		return new ReviewPageDTO(new PageDTO(crisearch, rms.getRevTotalCount(crisearch)), rms.getRevList(crisearch));
			
	}
	
	// 연봉 정보 검색 화면
	@RequestMapping(value="/mng/review/tab2search/search.do", method=RequestMethod.POST)
	@ResponseBody
	public ReviewPageDTO getSalSearchList(Criteria cri) {
		
		Criteria crisearch = new Criteria(cri.getPageNum(), 10, cri.getKeyword(), cri.getType());
		
		return new ReviewPageDTO(new PageDTO(crisearch, rms.getSalTotalCount(crisearch)), rms.getSalList(crisearch));
		
	}
	
	// 면접 후기 검색 화면
	@RequestMapping(value="/mng/review/tab3search/search.do", method=RequestMethod.POST)
	@ResponseBody
	public ReviewPageDTO getMRevSearchList(Criteria cri) {
		
		Criteria crisearch = new Criteria(cri.getPageNum(), 10, cri.getKeyword(), cri.getType());
		
		return new ReviewPageDTO(new PageDTO(crisearch, rms.getMRevTotalCount(crisearch)), rms.getMRevList(crisearch));
		
	}
	 
	
}
