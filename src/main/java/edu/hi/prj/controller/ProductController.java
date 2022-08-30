package edu.hi.prj.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.MemberService;
import edu.hi.prj.service.PlaceService;
import edu.hi.prj.service.RoomService;
import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.Place_TypeVO;
import edu.hi.prj.vo.BookingInfoVO;
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
	public String reservation(Model model, BookingVO bookingVO, Place_TypeVO place_TypeVO, RoomVO roomVO,
			PlaceVO placeVO) {

		String startdate = bookingVO.getStartdate();
		String enddate = bookingVO.getEnddate();
		
		//오늘,내일 날짜구하기(필터링 default 날짜)
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	    Calendar cal = Calendar.getInstance();

	    String today = sdf.format(cal.getTime());
	    cal.add(cal.DATE, +1);
	    String afterday = sdf.format(cal.getTime());
	    
		//startdate,enddate null 일시 오늘, 내일 날짜로 지정
		if(startdate == "" || startdate == null) {
			startdate = today;
		}
		if(enddate == "" || enddate == null) {
			enddate = afterday;
		}
		
		String place_type_group_num = place_TypeVO.getPlace_type_group_num();
		int capacity = roomVO.getCapacity();
		String location = placeVO.getLocation();

		model.addAttribute("getPlaceData", service.getPlaceData());
		model.addAttribute("filtering", service.filtering(startdate, enddate, place_type_group_num, capacity, location));
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		return "/product/product";
	}

	@GetMapping("/detail")
	public String detail(Model model, PlaceVO placeVO, BookingVO bookingVO) {

		int num = placeVO.getNum();
		String startdate = bookingVO.getStartdate();
		String enddate = bookingVO.getEnddate();

		model.addAttribute("placeDetail", service.getPlaceDetail(num));
		model.addAttribute("room", rservice.getRoom(num, startdate, enddate));
		model.addAttribute("imgList", rservice.getImgList());
		model.addAttribute("reviewList", bservice.getReview(num));
		model.addAttribute("reviewImgList", bservice.getReviewImgList(num));

		return "/product/detail";
	}

	@GetMapping("/reservation")
	public String reservation(Model model, BookingInfoVO bookingInfoVO, BookingVO bookingVO,Authentication authentication) {

		int room_num = bookingInfoVO.getRoom_num();
		String startdate = bookingVO.getStartdate();
		String enddate = bookingVO.getEnddate();

		model.addAttribute("bookingInfo", booking_service.getBookingInfo(room_num));
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		return "/product/reservation";
	}

	@ResponseBody
	@PostMapping("/booking")
	public String booking(@RequestBody BookingVO bookingVO) throws Exception {

		booking_service.booking(bookingVO);
		booking_service.reserved(bookingVO);

		return "/product";
	}

}
