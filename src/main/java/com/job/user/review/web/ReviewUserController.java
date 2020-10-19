package com.job.user.review.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.member.login.service.MemLoginUserVO;
import com.job.user.review.service.Paging;
import com.job.user.review.service.ReviewUserService;
import com.job.user.review.service.ReviewUserVO;

@Controller
public class ReviewUserController {
	@Resource(name="reviewUserService")
	private ReviewUserService reviewUserService;
	
	/*리뷰리스트*/
	@RequestMapping(value="/user/review/reviewSelectList.do")
	public String reviewSelectList(ReviewUserVO reviewUserVO, String currentPage, Model model) {
		/*기업리뷰*/
		int total1 = reviewUserService.total1();	
		Paging pg1 = new Paging(total1, currentPage);
		reviewUserVO.setStart(pg1.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg1.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList1 = reviewUserService.reviewSelectList1(reviewUserVO);
		model.addAttribute("list1", reviewSelectList1);
		model.addAttribute("total1",total1);
		model.addAttribute("pg1",pg1);
		/*기업연봉*/
		int total2 = reviewUserService.total2();	
		Paging pg2 = new Paging(total2, currentPage);
		reviewUserVO.setStart(pg2.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg2.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList2 = reviewUserService.reviewSelectList2(reviewUserVO);
		model.addAttribute("list2", reviewSelectList2);
		model.addAttribute("total2",total2);
		model.addAttribute("pg2",pg2);
		/*면접후기*/
		int total3 = reviewUserService.total3();	
		Paging pg3 = new Paging(total3, currentPage);
		reviewUserVO.setStart(pg3.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg3.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList3 = reviewUserService.reviewSelectList3(reviewUserVO);
		model.addAttribute("list3", reviewSelectList3);
		model.addAttribute("total3",total3);
		model.addAttribute("pg3",pg3);
		System.out.println("controller total3");
		return "user/review/reviewSelectList";
	}
	
	/*글쓰기*/
	/*기업리뷰*/
	@RequestMapping("/user/review/reviewWriteForm.do")
	public String reviewWriteForm(ReviewUserVO reviewUserVO, Model model) {
		model.addAttribute("review", reviewUserVO);		
		return "user/review/reviewWriteForm";
	}
	/*기업리뷰 추가*/
	@RequestMapping("/user/review/write.do")
	public String write(ReviewUserVO reviewUserVO) {
		reviewUserService.Write(reviewUserVO);
		return "redirect:/user/review/reviewSelectList.do";
	}	
	/*면접후기*/
	@RequestMapping("/user/review/mreviewWriteForm.do")
	public String mreviewWriteForm(ReviewUserVO reviewUserVO, Model model) {			
		model.addAttribute("review", reviewUserVO);
		return "user/review/mreviewWriteForm";
	}
	/*면접후기 추가*/
	@RequestMapping("/user/review/mWrite.do")
	public String mWrite(ReviewUserVO reviewUserVO) {
		reviewUserService.mWrite(reviewUserVO);
		return "redirect:/user/review/reviewSelectList.do";
	}	
	/*연봉*/
	@RequestMapping("/user/review/salWriteForm.do")
	public String salWriteForm(ReviewUserVO reviewUserVO, Model model) {
		model.addAttribute("review", reviewUserVO);
		return "user/review/salWriteForm";
	}
	/*연봉 추가*/
	@RequestMapping("/user/review/sWrite.do")
	public String sal(ReviewUserVO reviewUserVO) {
		int chk=reviewUserService.reviewSalChk(reviewUserVO);
		if(chk > 0){
			reviewUserService.salChkUpdate(reviewUserVO);
		}else{
			reviewUserService.sWrite(reviewUserVO);
		}
		
		return "redirect:/user/review/reviewSelectList.do";
	}
	
	/*리뷰상세보기*/
	@RequestMapping("/user/review/reviewDetailForm.do")
	public String reviewDetailForm(int rnum, Model model) {	
		//조회수 +1
		reviewUserService.plusBcnt(rnum);	
		ReviewUserVO review = reviewUserService.reviewDetailForm(rnum);
		model.addAttribute("review", review);
		return "/user/review/reviewDetailForm"; 
	}
	@RequestMapping("/user/review/salDetailForm.do")
	public String salDetailForm(int rnum, Model model) {		
		ReviewUserVO sal = reviewUserService.salDetailForm(rnum);
		model.addAttribute("sal", sal);
		return "/user/review/salDetailForm";
	}
	@RequestMapping("/user/review/mreviewDetailForm.do")
	public String mreviewDetailForm(int rnum, Model model) {
		//조회수 +1
		reviewUserService.plusBcnt(rnum);	
		ReviewUserVO review = reviewUserService.mreviewDetailForm(rnum);
		model.addAttribute("review", review);
		return "/user/review/mreviewDetailForm";
	}
	
	/*리뷰 삭제*/
	@RequestMapping("/user/review/reviewDeleteForm.do")
	public String reviewDeleteForm(int rnum) {
		reviewUserService.Delete(rnum);
		return "redirect: /user/review/reviewSelectList.do";
	}	
	
	/*리뷰 수정*/
	@RequestMapping("/user/review/reviewUpdate.do")
	public String reviewUpdate(ReviewUserVO reviewUserVO) {
		reviewUserService.reviewUpdate(reviewUserVO);
		return "redirect:/user/review/reviewSelectList.do";
	}
	@RequestMapping("/user/review/salUpdate.do")
	public String sreviewUpdate(ReviewUserVO reviewUserVO) {
		System.out.println("sreviewUpdate : " + reviewUserVO.getSal());
		reviewUserService.salUpdate(reviewUserVO);
		return "redirect:/user/review/reviewSelectList.do";
	}
	@RequestMapping("/user/review/mreviewUpdate.do")
	public String mreviewUpdate(ReviewUserVO reviewUserVO) {
		System.out.println("mreviewUpdate : " + reviewUserVO.getMreview());
		reviewUserVO.setM_date(reviewUserVO.getM_date().substring(0,10));
		reviewUserService.mreviewUpdate(reviewUserVO);
		return "redirect:/user/review/reviewSelectList.do";
	}
}
