package edu.hi.prj.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.hi.prj.mapper.BookingMapper;
import edu.hi.prj.mapper.UserMapper;
import edu.hi.prj.service.BoardServiceImpl;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.vo.MemberVO;
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
	private BookingMapper booking_mapper;

	@Autowired
	private BookingService booking_service;

	@GetMapping("/")
	public String main(Model model) {

		// 오늘,내일 날짜구하기(필터링 default 날짜)
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Calendar cal = Calendar.getInstance();

		String today = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1);
		String afterday = sdf.format(cal.getTime());

		String startdate = today;
		String enddate = afterday;

		model.addAttribute("data", service.getHotList(0));
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
	public String memberUpdate(MemberVO memberVO) {
		member_service.memberUpdate(memberVO);
		return "/main/main";
	}

	@GetMapping("/memberDeleteView")
	public String memberDeleteView() {
		return "/mypage/memberDeleteView";
	}

	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionpw = member.getMpw();
		String vopw = memberVO.getMpw();

		if (!(sessionpw.equals(vopw))) {
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

	@ResponseBody
	@GetMapping("/test/login")
	public String loginTest(Authentication authentication, @AuthenticationPrincipal UserDetailsVO userDetails) {
		System.out.println("test/login ===============");

		UserDetailsVO userDetailsVO = (UserDetailsVO) authentication.getPrincipal();
		System.out.println("authentication : " + authentication.getPrincipal());
		System.out.println("userDetails : " + userDetails.getUserVO());
		System.out.println(userDetails.getUsername());

		return "세션정보확인";
	}

	@ResponseBody
	@GetMapping("/test/oauth/login")
	public String loginOAuthTest(Authentication authentication, @AuthenticationPrincipal OAuth2User oauth) {

		System.out.println("test/oauth/login ===============");

		OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
		System.out.println("authentication : " + authentication.getPrincipal());
		System.out.println("oauth2User : " + oauth.getAttributes());

		return "세션정보확인";
	}

	@GetMapping("/user")
	public @ResponseBody String User(@AuthenticationPrincipal UserDetailsVO userdetailsVO) {
		System.out.println("UserDetailsVO : " + userdetailsVO.getUserVO());

		return "user";
	}

}
