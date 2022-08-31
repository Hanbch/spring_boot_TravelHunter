package edu.hi.prj.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.PlaceService;
import edu.hi.prj.service.RoomService;
import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.Place_TypeVO;
import edu.hi.prj.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/manager")
@Controller
public class ManagerController {

	@Autowired
	private PlaceService place_service;
	
	@Autowired
	private RoomService room_service;
	
	@Autowired
	private BoardService board_service;
	
	@Autowired
	private BookingService booking_service;
	
	
	@GetMapping("")
	public String manager() {
		
		return "/manager/manager";
	}
	
	@GetMapping("/myplace")
	public String myplace(Model model, RoomVO roomVO, Authentication authentication) {	
		String member_id = authentication.getName(); 
		model.addAttribute("placeData",place_service.getMyPlaceList(member_id));
		//model.addAttribute("reviewList",board_service.getReview(10));
		model.addAttribute("imgList",room_service.getImgList());
		
		return "/manager/myplace";
	}
	
	@GetMapping("/edit")
	public String edit(Model model, PlaceVO placeVO) {
		
		int num = placeVO.getNum();		
		model.addAttribute("placeData",place_service.getMyPlaceData(num));
		model.addAttribute("room",room_service.getMyRoom(num));
		model.addAttribute("imgList",room_service.getImgList());
		
		return "/manager/edit";
	}
	
	@GetMapping("/registroom")
	public String registroom(Model model, PlaceVO placeVO) {
		
		return "/manager/registroom";
	}
	
	@GetMapping("/registplace")
	public String registplace(Model model, Authentication authentication) {
		model.addAttribute("info",authentication);
		return "/manager/registplace";
	}
	
	@GetMapping("/reservations")
	public String reservations(Model model, PlaceVO palceVO, Authentication authentication) {
		String member_id = authentication.getName();
		
		model.addAttribute("rsvList",booking_service.getManagerRsvList(member_id));
		model.addAttribute("delList",booking_service.managerWithdrawOrderList(member_id));
		model.addAttribute("rsvedList", booking_service.getManagerRsvedList(member_id));
		return "/manager/reservations";
	}
	
	@PostMapping("/registPlace")
	public String registPlace(PlaceVO placeVO,MultipartFile file) throws Exception {
		
		if(file.isEmpty()) {//업로드할파일없을시
			System.out.println("empty:::::::::::::::::::::::::::::::::");
		}else {
			System.out.println("start:::::::::::::::::::::::::::::::::");
			
			
			String FileName = file.getOriginalFilename();
			String FileNameExtension = 
					FilenameUtils.getExtension(FileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\Temp\\spring_boot_TravelHunter\\src\\main\\resources\\static\\assets\\img\\place\\";
			
			do {
				UUID uuid = UUID.randomUUID();
				destinationFileName = uuid + "." + FileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while(destinationFile.exists());
			
			destinationFile.getParentFile().mkdirs();
			file.transferTo(destinationFile);
			
			
			placeVO.setMainimg(destinationFileName);
			
			
			place_service.registerPlace(placeVO);
			
		
		}
		
		return "redirect:/manager";
	}
	
	@PostMapping("/registRoom")
	public String registRoom(RoomVO roomVO, Place_TypeVO place_TypeVO, List<MultipartFile> files, ImageVO imageVO) throws Exception {
		
		
		if(files.isEmpty()) {//업로드할파일없을시
			System.out.println("empty:::::::::::::::::::::::::::::::::");
		}else {
			System.out.println("start:::::::::::::::::::::::::::::::::");
			place_service.registerPlace_Type(place_TypeVO);
			place_service.registerRoom(roomVO);
			
			for(MultipartFile file:files) {
				String FileName = file.getOriginalFilename();
				String FileNameExtension = 
						FilenameUtils.getExtension(FileName).toLowerCase();
				File destinationFile;
				String destinationFileName;
				String fileUrl = "C:\\Temp\\spring_boot_TravelHunter\\src\\main\\resources\\static\\assets\\img\\rooms\\";
				
				do {
					UUID uuid = UUID.randomUUID();
					destinationFileName = uuid + "." + FileNameExtension;
					destinationFile = new File(fileUrl + destinationFileName);
				} while(destinationFile.exists());
				
				destinationFile.getParentFile().mkdirs();
				file.transferTo(destinationFile);
				
				imageVO.setRoom_num(roomVO.getNum());
				imageVO.setIname(destinationFileName);
				imageVO.setIoriname(FileName);
				imageVO.setIpath(fileUrl);
				
				place_service.imginsert(imageVO);//img업로드
				
			}
		
		}
		
		return "redirect:/manager";
	}

	@PostMapping("/updateRoom")
	public String updateRoom(RoomVO roomVO) {
		room_service.updateRoom(roomVO);
		return "redirect:/manager/myplace";
	}
	
	@PostMapping("/updatePlace")
	public String updatePlace(PlaceVO placeVO) {
		place_service.updatePlace(placeVO);
		return "redirect:/manager/myplace";
	}
	
	
}
