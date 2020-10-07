package com.job.user.member.login.web;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;

@Controller
public class MemLoginUserController {
	@Resource(name="memLoginUserService")
	MemLoginUserService memLoginUserService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/*개인로그인*/
	@RequestMapping(value="/user/member/login/memLoginForm.do")
	public String memLoginForm() {
		return "user/member/login/memLoginForm";
	}
	
	/*개인 로그인 & 체크*/
	@RequestMapping(value="/user/member/login/memLogin.do")
	public String memLogin(HttpSession session, MemLoginUserVO  vo,HttpServletResponse response) throws Exception {
		int result=memLoginUserService.loginCheck(vo);
		String url="user/main/main";
		if(result==1) {
			MemLoginUserVO user=memLoginUserService.user(vo);
			session.setAttribute("user", user);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('로그인되었습니다.');</script>");
			writer.flush();
			url="user/main/main";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('아이디 또는 비밀번호를 확인해주세요.');</script>");
			writer.flush();
			url="user/member/login/memLoginForm";
		}	
		return url;
	}
	
	/*개인 로그아웃*/
	@RequestMapping(value="/user/member/login/memLogout.do")
	public void memLogout(HttpSession session,HttpServletResponse response) throws Exception {
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('로그아웃되었습니다.');</script>");
		writer.println("<script>location.href='/user/main/main.do';</script>");
		writer.flush();
	}
	
	/*개인 아이디 찾기 폼*/
	@RequestMapping(value="/user/member/login/memFindIdForm.do")
	public String memFindIdForm() throws Exception{
		return"/user/member/login/memFindIdForm";
	}
	
	/*개인 아이디 찾기*/
	@RequestMapping(value="/user/member/login/memFindId.do")
	public String memFindId(HttpServletResponse response,MemLoginUserVO vo, Model model) throws Exception{
		model.addAttribute("id", memLoginUserService.memFindId(response,vo));
		return "/user/member/login/memFindId";
	}
	
	/*개인 비밀번호 찾기 폼*/
	@RequestMapping(value="/user/member/login/memFindPassForm.do")
	public String memFindPassForm() throws Exception{
		return "/user/member/login/memFindPassForm";
	}

	
	/*개인 비밀번호 찾기 - 메일 보내기*/
	@RequestMapping(value="/user/member/login/memFindPass.do")
	public String memFindPass(@RequestParam(value="email")String email,HttpServletResponse response, Model model,MemLoginUserVO vo) throws Exception {
		int result=memLoginUserService.memPassCheck(vo);
		if(result==1) {
		System.out.println("member mail sending..");
		String setfrom="tkddk0119@gmail.com";
		String title="<jobara> 비밀번호 찾기 인증 이메일입니다.";
		String tempPass=(int)(Math.random() * 999999) + 1 + "";
		System.out.println("인증번호 : "+tempPass);
		String content= System.getProperty("line.separator")+ System.getProperty("line.separator")+
                "안녕하세요 회원님 jobara를 찾아주셔서 감사합니다"
                +System.getProperty("line.separator")+System.getProperty("line.separator")+
                "비밀번호 찾기 인증번호는 " +tempPass+ " 입니다. "
                +System.getProperty("line.separator")+System.getProperty("line.separator")+
                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		try {
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper messageHelper=new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(email);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		model.addAttribute("tempPass",tempPass);
		model.addAttribute("email",email);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		writer.flush();
		
		return "/user/member/login/memPassEmail";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('아이디 또는 이메일을 확인해주세요.');</script>");
			writer.flush();
			return "/user/member/login/memFindPassForm";
		}
	}
	
	/*개인 비밀번호 찾기 - 인증번호 입력 후 확인버튼 누르면 실행*/ 
	@RequestMapping(value="/user/member/login/memPassEmailInjeung.do")
	public String memPassEmailInjeung(@RequestParam(value="tempPass") String tempPass, @RequestParam(value="email") String email, @RequestParam(value="injeung") String injeung, HttpServletResponse response,Model model) throws Exception{
		System.out.println("마지막 injeung : "+injeung);
		System.out.println("마지막 tempPass : "+tempPass);
		String url="/user/member/login/memPassChange";
		model.addAttribute("email", email);
		
		if(injeung.equals(tempPass)) {
			url="user/member/login/memPassChange";
			model.addAttribute("email", email);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
			writer.flush();
			
		} else if(injeung!=tempPass) {
			url="user/member/login/memPassEmail";
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			writer.flush();
			
		}
		return url;
	}
	
	/*개인 비밀번호 찾기 - 변경할 비밀번호 입력 후 확인 시 */ 
	@RequestMapping(value="/user/member/login/memPassChange.do",method=RequestMethod.POST)
	public String memPassChange(@RequestParam(value="email") String email, @RequestParam(value="pass") String pass, MemLoginUserVO vo, HttpServletResponse response)throws Exception{
		vo.setEmail(email);
		vo.setPass(pass);
		
		Map<String, Object> map=new HashMap<>();
		map.put("email", vo.getEmail());
		map.put("pass", vo.getPass());
		
		memLoginUserService.memPassChange(map,vo);
		return "/user/member/login/memPassChangeResult";
	}
	
	
}

