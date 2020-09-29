package com.job.user.review.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.user.review.service.Paging;
import com.job.user.review.service.ReviewUserService;
import com.job.user.review.service.ReviewUserVO;

@Controller
public class ReviewUserController {
	@Resource(name="reviewUserService")
	private ReviewUserService reviewUserService;
	
	@RequestMapping(value="reviewSelectList.do")
	public String reviewSelectList(ReviewUserVO reviewUserVO, String currentPage, Model model) {
		System.out.println("ReviewUserController reviewSelectList Start... ");
		int total = reviewUserService.total();	
		System.out.println("ReviewUserController reviewSelectList total->" + total);
		Paging pg = new Paging(total, currentPage);
		reviewUserVO.setStart(pg.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList = reviewUserService.reviewSelectList(reviewUserVO);
		System.out.println("ReviewUserController reviewSelectList list.size()->" + reviewSelectList.size());
		model.addAttribute("list", reviewSelectList);
		model.addAttribute("pg",pg);
		return "user/review/reviewSelectList";
	}
	@RequestMapping(value="reviewInsertForm.do")
	public String reviewInsertForm(Model model) {
		System.out.println("ReviewUserController insertEmp Start...");
		reviewUserService.reviewInsertForm();
		return "user/review/reviewInsertForm";
	}

	@RequestMapping(value="reviewDetailForm.do")
	public String reviewDetailForm(HttpServletRequest request , int rnum, Model model) {
		ReviewUserVO reviewUserVO = reviewUserService.reviewDetailForm(rnum);
		model.addAttribute("reviewUserVO",reviewUserVO);
		return "user/review/reviewDetailForm";
	} 
	

/*	@RequestMapping(value="reviewWriteForm.do")
	public String reviewWriteForm(Model model) {
		List<ReviewUserVO> list = reviewUserService.listManager();
		model.addAttribute("empMngList",list);
		return "user/review/reviewWriteForm";
	}
	
	@RequestMapping(value="confirm")
	public String confirm(int empno, Model model) {
		Emp emp = es.detail(empno);
		model.addAttribute("empno", empno);
		if (emp !=null) {
			model.addAttribute("msg","중복된 사번입니다");			
			return "forward:writeForm.do";
		} else {
			model.addAttribute("msg","사용 가능한 사번입니다");
			return "forward:writeForm.do";
		}
	}
    @RequestMapping(value="write" ,  method=RequestMethod.POST)
    public String write(Emp emp, Model model) {
		System.out.println("emp.getHiredate->"+emp.getHiredate());
		// Service, Dao , Mapper명 까지 -> insert
		int result = es.insert(emp);
		if (result > 0) return "redirect:list.do";
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "forward:writeForm.do";
		}
    	
    }*/
}
