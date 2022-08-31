package edu.hi.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private BookingService booking_service;
	
	@Autowired
	private MemberService member_service; 
	
	@Autowired
	private BoardService board_service;
	
	@ResponseBody
	@GetMapping("/test")
	public String tests(MemberVO memberVO, UserVO userVO) {
		System.out.println(memberVO);
		System.out.println(userVO);
		
		
		return "aa";
	}
	
	
	
	@GetMapping("")
	public String maypage(Model model, Authentication authentication, MemberVO memberVO) {
		String id = authentication.getName();
		model.addAttribute("member",  member_service.getmember(id));
		return "/mypage/mypage";
	}
	

	
	@GetMapping("/reservations")
	public String reservations(Model model,BookingVO bookingVO,Authentication authentication) {
		
		String member_id = authentication.getName();
		int booking_num = bookingVO.getNum();
		
		model.addAttribute("rsvList",booking_service.getRsvList(member_id));
		model.addAttribute("rsvedList",booking_service.getRsvedList(member_id));
		model.addAttribute("delList", booking_service.withdraworderList(member_id));
		return "/mypage/reservations";
	}
	
	@GetMapping("/activity")
	public String activity(Model model, Authentication authentication) {
		String member_id = authentication.getName();
		
		model.addAttribute("actList", board_service.activityList(member_id));
		return "/mypage/activity";
	}
	
	@GetMapping("/widthdraw")
	public String widthdraw(Model model, Authentication authentication, MemberVO memberVO) {
		String id = authentication.getName();
		model.addAttribute("member",  member_service.getmember(id));
		return "/mypage/widthdraw";
	}
	
	@PostMapping("rsvdelete")
	public String RsvDelete(BookingVO bookingVO) {
		
		booking_service.rsvdelete(bookingVO);
		System.out.println("----------------------------------------------------------------------------------------------------");
		
		String cname = bookingVO.getCname();
		int num = bookingVO.getNum();
		System.out.println(cname);
		System.out.println(num);
		booking_service.withdraworder(bookingVO);
		

		
		return "redirect:/mypage/reservations";
	}

}
