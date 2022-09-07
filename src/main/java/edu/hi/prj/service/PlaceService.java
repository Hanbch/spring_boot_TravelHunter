package edu.hi.prj.service;

import java.util.List;

import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.PlaceDetailVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.Place_TypeVO;
import edu.hi.prj.vo.RoomVO;
import edu.hi.prj.vo.StaticsVO;

public interface PlaceService{
	
	List<PlaceVO> getPlaceData();
	List<PlaceVO>hotPlaceList();//인기 캠핑장 조회
	double getPlaceGrade();
	String getPlaceImg();
	int getPriceList();
	
	PlaceDetailVO getPlaceDetail(int num);
	int getReviewCountList(int num);
	double getGrade(int num);
	List<String> getPlaceDetailImg(int num);
	
	void registerPlace(PlaceVO placeVO);//캠핑장 등록
	void registerPlace_Type(Place_TypeVO place_TypeVO);//캠핑장 타입 등록
	void registerRoom(RoomVO roomVO);//객실 등록
	void imginsert(ImageVO imageVO);//img업로드
	
	List<PlaceVO>filtering(String startdate, String enddate, String place_type_group_num, int capacity, String location);//검색조건에 맞는 캠핑장 조회
	List<PlaceDetailVO> getMyPlaceList(String member_id);//관리자별 캠핑장 조회
	PlaceVO getMyPlaceData(int num);//해당 캠핑장정보 조회
	void updatePlace(PlaceVO placeVO);//캠핑장 정보수정
	List<StaticsVO> getSales(int place_num);//캠핑장별 매출가져오기
}
