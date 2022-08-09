package edu.hi.prj.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.hi.prj.service.BoardServiceImpl;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.vo.MemberVO;

@Controller
public class HomeController {

	@Autowired
	private BoardServiceImpl service;
	@Autowired
	private MemberService member_service;
	
	@GetMapping("/")
	public String main(Model model) {
		
		model.addAttribute("data",service.getHotList(0));
		
		return "/main/main";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "/login/login";
	}
	
	@GetMapping("/join")
	public String join() {
		
		return "/join/join";
	}
	
	//회원가입
	@PostMapping("/create")
	public String create(MemberVO memberVO) {
		member_service.create(memberVO);
		return "/main/main";
	}
	
	//로그인
	
	@PostMapping("/logincheck")
	public String logincheck(MemberVO memberVO, 
							 HttpServletRequest req, 
							 RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		MemberVO logincheck = member_service.logincheck(memberVO);
		
		if(logincheck == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", logincheck);
		}
		
		return "/main/main";
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/main/main";
	}
	
	@ResponseBody
	@PostMapping("/idcheck")
	public int idcheck(MemberVO memberVO) {
		int result = member_service.idcheck(memberVO);
		return result;
	}
	
	@GetMapping("/memberUpdateView")
	public String memberUpdateView() {

		return "/mypage/memberUpdateView";
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberVO memberVO) {
		member_service.memberUpdate(memberVO);
		return "/main/main";
	}
	@GetMapping("/memberDeleteView")
	public String memberDeleteView() {
		return "/mypage/memberDeleteView";
	}
	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO memberVO,
							   HttpSession session,
							   RedirectAttributes rttr
							   ) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionpw = member.getMpw();
		String vopw = memberVO.getMpw();
		
		if(!(sessionpw.equals(vopw))) {
			rttr.addFlashAttribute("msg", false);	
		}
		member_service.memberDelete(memberVO);
		
		session.invalidate();
		return "/main/main";
	}
	@ResponseBody
	@PostMapping("/delpwcheck")
	public int delpwcheck(MemberVO memberVO) {
		int result = member_service.delpwcheck(memberVO);
		return result;
		
	}
	

}



