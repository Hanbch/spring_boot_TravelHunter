package edu.hi.prj.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.PlaceMapper;
import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.PlaceDetailVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.Place_TypeVO;
import edu.hi.prj.vo.RoomVO;
import edu.hi.prj.vo.StaticsVO;

@Service
public class PlaceServiceImpl implements PlaceService{
	@Autowired
	private PlaceMapper mapper;

	@Override
	public double getPlaceGrade() {
		
		return mapper.getPlaceGrade();
	}

	@Override
	public List<PlaceVO> getPlaceData() {
		
		return mapper.getPlaceData();
	}

	@Override
	public String getPlaceImg() {
		
		return mapper.getPlaceImg();
	}

	@Override
	public int getPriceList() {
		
		return mapper.getPriceList();
	}

	@Override
	public PlaceDetailVO getPlaceDetail(int num) {
		
		return mapper.getPlaceDetail(num);
	}

	@Override
	public int getReviewCountList(int num) {
		
		return mapper.getReviewCountList(num);
	}

	@Override
	public double getGrade(int num) {
		
		return mapper.getGrade(num);
	}

	@Override
	public List<String> getPlaceDetailImg(int num) {
		
		return mapper.getPlaceDetailImg(num);
	}

	@Override
	public void registerPlace(PlaceVO placeVO) {
		
		mapper.registerPlace(placeVO);
	}

	@Override
	public void registerPlace_Type(Place_TypeVO place_TypeVO) {
		
		mapper.registerPlace_Type(place_TypeVO);
	}

	@Override
	public void registerRoom(RoomVO roomVO) {
		
		mapper.registerRoom(roomVO);//객실 등록
	}

	@Override
	public void imginsert(ImageVO imageVO) {
		
		mapper.imginsert(imageVO);//img업로드
	}

	@Override
	public List<PlaceVO> filtering(String startdate, String enddate, String place_type_group_num, int capacity, String location) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yy");
	    Calendar cal = Calendar.getInstance();

	    String today = sdf.format(cal.getTime());
	    cal.add(cal.DATE, +1);
	    String afterday = sdf.format(cal.getTime());
	    
		
		if(startdate == "" || startdate == null) {
			startdate = today;
		}
		if(enddate == "" || enddate == null) {
			enddate = afterday;
		}
		
		if( place_type_group_num == null || place_type_group_num.equals("선택하세요")) {
			place_type_group_num  = "%";
		}
		if( capacity == 0) {
			
		}
		if( location == null || location =="") {
			location  = "%";
		}
		System.out.println(startdate + ":::::::::::::::::::::::::::::" + enddate);
		return mapper.filtering(startdate,enddate,place_type_group_num,capacity, location);
	}

	@Override
	public List<PlaceDetailVO> getMyPlaceList(String member_id) {
		
		return mapper.getMyPlaceList(member_id);
	}

	@Override
	public PlaceVO getMyPlaceData(int num) {
		
		return mapper.getMyPlaceData(num);
	}

	@Override
	public void updatePlace(PlaceVO placeVO) {
		mapper.updatePlace(placeVO);
		
	}

	@Override
	public List<StaticsVO> getSales(int place_num) {
		
		return mapper.getSales(place_num);
	}



}
