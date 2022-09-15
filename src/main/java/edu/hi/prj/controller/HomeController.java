package edu.hi.prj.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.hi.prj.mapper.UserMapper;
import edu.hi.prj.service.BoardServiceImpl;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.EmailSenderService;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.service.PlaceService;
import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.PheedCriteria;
import edu.hi.prj.vo.UserDetailsVO;
import edu.hi.prj.vo.UserVO;

@Controller
public class HomeController {

	UserDetailsVO userDetailsVO = new UserDetailsVO();

	@Autowired
	private BoardServiceImpl service;

	@Autowired
	private MemberService member_service;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private BookingService booking_service;
	
	@Autowired
	private PlaceService place_service;
	
	@Autowired
	private EmailSenderService senderservice;
	

	@GetMapping("/")
	public String main(Model model, PheedCriteria cri, Authentication authentication) {

		// 오늘,내일 날짜구하기(필터링 default 날짜)
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Calendar cal = Calendar.getInstance();

		String today = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1);
		String afterday = sdf.format(cal.getTime());

		String startdate = today;
		String enddate = afterday;
		
		String member_id;

		if (authentication != null) {
			member_id = authentication.getName();
		} else {
			member_id = "";
		}

		model.addAttribute("boardList", service.pheedpaging(cri, member_id));
		model.addAttribute("boardImg", service.getBoardImg());
		int total = service.pheedCount();
		
		model.addAttribute("hotPlace", place_service.hotPlaceList());
		model.addAttribute("hotPheed", service.getHotList(0));
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);

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

	// 회원가입
	@PostMapping("/create")
	public String create(UserVO userVO) {
		String rawPassword = userVO.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		userVO.setPassword(encPassword);

		userMapper.insertUser(userVO);
		userMapper.insertAuthorities(userVO);

		return "redirect:/";
	}

	// 로그인

	@PostMapping("/logincheck")
	public String logincheck(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		MemberVO logincheck = member_service.logincheck(memberVO);

		if (logincheck == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", logincheck);
		}

		return "/main/main";
	}

	// 로그아웃
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
	public String memberUpdate(MemberVO memberVO, UserVO userVO) {
		String rawPassword = memberVO.getMpw();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		memberVO.setMpw(encPassword);
		
		member_service.memberUpdate(memberVO);
		return "/main/main";
	}

	@GetMapping("/memberDeleteView")
	public String memberDeleteView() {
		return "/mypage/memberDeleteView";
	}

	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO memberVO) {
		String id = memberVO.getId();
		System.out.println(id);
		member_service.memberDelete(id);
		return "/main/main";
	}

	
	
	
	
	
	@ResponseBody
	@PostMapping("/delpwcheck")
	public int delpwcheck(MemberVO memberVO, Authentication authentication, @AuthenticationPrincipal UserDetailsVO userDetails) {
		String mpw = memberVO.getMpw();
		UserDetailsVO userDetailsVO = (UserDetailsVO) authentication.getPrincipal();
		String encPassword = userDetails.getPassword();
		System.out.println(mpw);
		System.out.println(encPassword);

		boolean password = bCryptPasswordEncoder.matches(mpw, encPassword);
		if(password) {
			memberVO.setMpw(encPassword);
		}
		
		int result = member_service.delpwcheck(memberVO);
		return result;
	}

	@GetMapping("/loginInfo")
	public String loginInfo(Authentication authentication, Principal principal) {

		String user_id;

		// 1.SpringContextHolder를 통하여 자져오는 방법 (일반적인 빈에서 사용 가능)
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		user_id = auth.getName();
		System.out.println("유저 아이디: " + user_id);

		// 2.authentication 객체로 가ㅏ져오는 방법(많은 정보를 가져 올 수 있다.)
		System.out.println("authentication 유저 아이디: " + authentication.getName());
		System.out.println("authentication 권한들: " + authentication.getAuthorities());

		// 3.Principal 객체로 가져오는 방법 (가져올수 있는게 getName()정도)
		System.out.println("Principal 유저 아이디: " + principal.getName());

		return "redirect:/";
	}

	@Secured("ROLE_MANAGER")
	@GetMapping("/info")
	@ResponseBody
	public String info() {
		return "secured테스트";
	}



	@GetMapping("/user")
	public @ResponseBody String User(@AuthenticationPrincipal UserDetailsVO userdetailsVO) {
		System.out.println("UserDetailsVO : " + userdetailsVO.getUserVO());

		return "user";
	}
	
	@GetMapping("/findidview")
	public String findidView() {
		return "login/findidview";
	}
	//id찾기
	@PostMapping("/findid")
	public String findid(MemberVO memberVO, Model model) {
		if(member_service.findidcheck(memberVO.getMemail())==0) {
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/login/findidview";
			}else {
			model.addAttribute("member", member_service.findid(memberVO.getMemail()));
			return "/login/findid";
			}
	}


	@GetMapping("/findpwview")
	public String findpwview() {
		return "login/findpwview";
	}
	//pw찾기
	@PostMapping("/findpw")
	public String findpw(MemberVO memberVO, Model model) {
		if(member_service.findpwcheck(memberVO.getMemail(), memberVO.getId())==0) {
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/login/findpwview";
		}else {
			//임시비밀번호생성
			String pw = UUID.randomUUID().toString().replaceAll("-", "");
			pw = pw.substring(0, 10);
			String body = "[TravelHunter] 임시비밀번호는" + pw + "입니다.";//메일내용
			String subject = "[TravelHunter]임시비밀번호 발송";//메일제목
			senderservice.sendEmail(memberVO.getMemail(), subject, body);
			String mpw = bCryptPasswordEncoder.encode(pw);
			member_service.findPw(mpw, memberVO.getMemail(), memberVO.getId());
			return "/login/login";
		}
		
	}
	
	
	
	
}


