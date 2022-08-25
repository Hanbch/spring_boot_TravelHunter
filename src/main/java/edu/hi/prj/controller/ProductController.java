package edu.hi.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hi.prj.service.BoardService;
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
	
	@GetMapping("/test")
	public String ImportTest(Model model, MemberVO memberVO, Authentication authentication) {
		String id = authentication.getName();
		model.addAttribute("test", mservice.getmember(id));
		return "/product/ImportTest";
	}
	
	
}
