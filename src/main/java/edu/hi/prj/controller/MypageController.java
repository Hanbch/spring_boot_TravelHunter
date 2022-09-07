package edu.hi.prj.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.vo.BoardVO;
import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.MemberVO;

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

	@GetMapping("")
	public String maypage(Model model, Authentication authentication, MemberVO memberVO) {
		String id = authentication.getName();
		model.addAttribute("member", member_service.getmember(id));
		return "/mypage/mypage";
	}

	@GetMapping("/reservations")
	public String reservations(Model model, BookingVO bookingVO, Authentication authentication) {

		String member_id = authentication.getName();
		int booking_num = bookingVO.getNum();

		model.addAttribute("rsvList", booking_service.getRsvList(member_id));
		model.addAttribute("rsvedList", booking_service.getRsvedList(member_id));
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
		model.addAttribute("member", member_service.getmember(id));
		return "/mypage/widthdraw";
	}

	@PostMapping("rsvdelete")
	public String RsvDelete(BookingVO bookingVO) {

		booking_service.rsvdelete(bookingVO);

		String cname = bookingVO.getCname();
		int num = bookingVO.getNum();
		System.out.println(cname);
		System.out.println(num);
		booking_service.withdraworder(bookingVO);

		return "redirect:/mypage/reservations";
	}

	@PostMapping("/review")
	public String review(BookingVO bookingVO, Model model) {
		model.addAttribute("pnum", bookingVO.getPlace_num());
		return "/mypage/review";
	}

	@PostMapping("/reviewinsert")
	public String reviewinsert(BoardVO boardVO, List<MultipartFile> files,ImageVO imageVO ,Authentication authentication) throws Exception {
		String member_id = authentication.getName();
		boardVO.setMember_id(member_id);
		
		if (files.isEmpty()) {// 업로드할파일없을시
			board_service.reviewinsert(boardVO);// 작성
		} else {
			board_service.reviewinsert(boardVO);// 작성

			for (MultipartFile file : files) {
				String FileName = file.getOriginalFilename();
				String FileNameExtension = FilenameUtils.getExtension(FileName).toLowerCase();
				File destinationFile;
				String destinationFileName;
				String fileUrl = "C:\\Temp\\spring_boot_TravelHunter\\src\\main\\resources\\static\\assets\\img\\boards\\";

				do {
					UUID uuid = UUID.randomUUID();
					destinationFileName = uuid + "." + FileNameExtension;
					destinationFile = new File(fileUrl + destinationFileName);
				} while (destinationFile.exists());

				destinationFile.getParentFile().mkdirs();
				file.transferTo(destinationFile);

				imageVO.setBoard_id(board_service.boardGetid(boardVO));
				imageVO.setIname(destinationFileName);
				imageVO.setIoriname(FileName);
				imageVO.setIpath(fileUrl);

				board_service.imginsert(imageVO);// img업로드

			}

		}

		return "redirect:/mypage/reservations";
	}

}
