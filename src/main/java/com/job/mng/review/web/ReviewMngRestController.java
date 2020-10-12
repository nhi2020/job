package com.job.mng.review.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;
import com.job.mng.main.service.ReviewPageDTO;
import com.job.mng.review.service.ReviewMngService;
import com.job.mng.review.service.ReviewMngVO;

@RestController
public class ReviewMngRestController {

	@Resource(name="reviewMngService")
	private ReviewMngService rms;
	
	 @RequestMapping(value="/mng/review/tab1/{page}"+ ".do", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ReviewPageDTO getRevList(@PathVariable("page") int page) {
		
		 System.out.println("getRev List page" + page);
		 System.out.println("getRev List");
		 
		Criteria cri = new Criteria(page, 10);
		
		return new ReviewPageDTO(new PageDTO(cri, rms.getRevTotalCount(cri)), rms.getRevList(cri));
		
	}
	
	
}
