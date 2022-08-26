package edu.hi.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.service.PlaceService;
import edu.hi.prj.service.RoomService;
import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.Place_TypeVO;
import edu.hi.prj.vo.RoomVO;


@RequestMapping("/product")
@Controller
public class ProductController {
	
	@Autowired
	private PlaceService service;
	
	@Autowired
	private RoomService rservice;
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private BookingService booking_service;
	
	@GetMapping("")
	public String reservation(Model model,BookingVO bookingVO,Place_TypeVO place_TypeVO,RoomVO roomVO,PlaceVO placeVO ) {
		
		String startdate = bookingVO.getStartdate();
		String enddate = bookingVO.getEnddate();
		String place_type_group_num = place_TypeVO.getPlace_type_group_num();
		int capacity = roomVO.getCapacity();
		String location = placeVO.getLocation();
		
		System.out.println("pt" +place_type_group_num + "::::::::::::::::::::::::::::::::::::::::::");
		System.out.println("location" +location + "::::::::::::::::::::::::::::::::::::::::::");
		System.out.println("capacity" +capacity + "::::::::::::::::::::::::::::::::::::::::::");
		model.addAttribute("getPlaceData",service.getPlaceData());
		model.addAttribute("filtering", service.filtering(startdate,enddate,place_type_group_num,capacity,location));
		return "/product/product";
	}
	
	@GetMapping("/detail")
	public String detail(Model model,PlaceVO placeVO,BookingVO bookingVO) {
	
		int num = placeVO.getNum();
		String startdate = bookingVO.getStartdate();
		String enddate = bookingVO.getEnddate();
		
		model.addAttribute("placeDetail",service.getPlaceDetail(num));
		model.addAttribute("room",rservice.getRoom(num,startdate,enddate));
		model.addAttribute("imgList",rservice.getImgList());
		model.addAttribute("reviewList",bservice.getReview(num));
		model.addAttribute("reviewImgList",bservice.getReviewImgList(num));
		
		return "/product/detail";
	}
	
	
	@GetMapping("/reservation")
	public String reservation(Model model,PlaceVO PlaceVO placeVO, RoomVO roomVO,, RoomVO roomVO,Authentication authentication) {
		//String id = authentication.getName();
		
		model.addAttribute("place",placeVO.getNum());
		return "/product/reservation";
	}
	
	@PostMapping("/booking")
	public String booking(BookingVO bookingVO,PlaceVO placeVO, RoomVO roomVO, Authentication authentication) throws Exception{
		String id = authentication.getName();
		int cphone = bookingVO.getCphone();
		String cname = bookingVO.getCname();
		int room_num = bookingVO.getRoom_num();
		String startdate = bookingVO.getStartdate();
		String enddate = bookingVO.getEnddate();
		
		booking_service.reserved(27,"08/20/2022","08/25/2022");
		return "/product/reservation";
	}
	
	
}
