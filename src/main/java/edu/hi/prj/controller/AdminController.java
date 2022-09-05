package edu.hi.prj.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.hi.prj.service.AdminService;
import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.ReplyService;
import edu.hi.prj.vo.BoardVO;
import edu.hi.prj.vo.ReplyVO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private BoardService board_service;
	
	@Autowired
	private ReplyService reply_service;
	
	@GetMapping("")
	public String adminHome() {
		System.out.println("관리자페이지 접속...");
		return "admin/admin";
	}
	
	//사용자 관련 Controller
	@GetMapping("/memlist")
	public String memberPage(Model model, @RequestParam(value="id", required=false) String id) {
		System.out.println("멤버 목록 출력...");
		model.addAttribute("memberList", service.getMemberList(id));
		return "admin/memlist";
	}
	
	@GetMapping("/memdetail")
	public String memberDetail(Model model, @RequestParam(value="id") String id) {
		System.out.println("유저 세부 정보...");
		model.addAttribute("member", service.selectMember(id));
		return "admin/memdetail";
	}
	
	@PostMapping("/deleteMem")
	public String deleteMem(@RequestParam(value="id") String id) {
		System.out.println(id + " 삭제...");
		service.deleteMember(id);
		return "redirect:/admin/memlist";		
	}
	
	@PostMapping("/updateMem")
	public String updateMem(@RequestParam(value="id") String id, @RequestParam(value="nick") String nick, @RequestParam(value="auth_num") int auth_num) throws UnsupportedEncodingException  {
		System.out.println(id + " 수정...");
		service.updateMem(id, nick);
		service.updateMemberauth(id, auth_num);
		return "redirect:/admin/memdetail?id="+URLEncoder.encode(id,"utf-8");
	}
	
	
	//캠핑장 관련 Controoler
	@GetMapping("/placelist")
	public String placePage(Model model, @RequestParam(value="id", required=false) String id) {
		System.out.println("캠핑장 목록 출력...");
		model.addAttribute("placeList", service.getPlaceList(id));
		return "admin/placelist";
	}
	
	@GetMapping("/placedetail")
	public String placeDetail(Model model, @RequestParam(value="id") String id) {
		System.out.println("캠핑장 세부 정보...");
		model.addAttribute("place", service.selectPlace(id));
		model.addAttribute("roomList", service.roomList(id));
		System.out.println("캠핑장 룸 리스트 불러온...");
		return "admin/placedetail";
	}
	
	@PostMapping("/deleteRoom")
	public String deleteRoom(@RequestParam(value="id") String id, @RequestParam(value="room") String room) {
		System.out.println(id + "의 방 " + room + " 삭제...");
		service.deleteRoom(id, room);
		return "redirect:/admin/placedetail?id="+id;		
	}
	
	//예약 관련 Controller
	@GetMapping("/reservationlist")
	public String reservationPage(Model model, @RequestParam(value="id", required=false) String id) {
		System.out.println("예약 목록 출력...");
		model.addAttribute("reservationList", service.getReservationList(id));
		return "admin/reservationlist";
	}
	
	@GetMapping("/qna")
	public String qna(Model model) {
		model.addAttribute("boardList", board_service.getList(2));
		return "/admin/qna";
	}
	
	@GetMapping("/qnadetail")
	public String qnadetail(Model model, BoardVO boardVO) {
		int id = boardVO.getId();
		model.addAttribute("data",board_service.getBoard(id));
		return "/admin/qnadetail";
	}
	
	@PostMapping("/reply")
	public String qnareply(ReplyVO replyVO, Authentication authentication) {
		String member_id = authentication.getName();
		replyVO.setMember_id(member_id);
		reply_service.write(replyVO);
		return "redirect:";
	}
	
	
	
}
