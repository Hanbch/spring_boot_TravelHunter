package edu.hi.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hi.prj.service.BookingService;
import edu.hi.prj.vo.BookingVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired BookingService booking_service;

	@GetMapping("")
	public String maypage() {

		return "/mypage/mypage";
	}
	
	@GetMapping("/reservations")
	public String reservations(Model model,BookingVO bookingVO,Authentication authentication) {
		
		String member_id = authentication.getName();
		int booking_num = bookingVO.getNum();
		
		model.addAttribute("rsvList",booking_service.getRsvList(member_id));
		return "/mypage/reservations";
	}
	
	@GetMapping("/activity")
	public String activity() {
		
		return "/mypage/activity";
	}
	
	@GetMapping("/widthdraw")
	public String widthdraw() {
		
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
