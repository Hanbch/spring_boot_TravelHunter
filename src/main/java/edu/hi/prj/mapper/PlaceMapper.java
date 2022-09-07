package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.PlaceDetailVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.Place_TypeVO;
import edu.hi.prj.vo.RoomVO;
import edu.hi.prj.vo.StaticsVO;

@Mapper
public interface PlaceMapper{
	
	List<PlaceVO>getPlaceData();// 캠핑장List 조회
	List<PlaceVO>hotPlaceList();//인기 캠핑장 조회
	double getPlaceGrade();// 해당 캠핑장(예약) 평균평점List 불러오기
	String getPlaceImg(); // 해당 캠핑장(예약) 대표사진 불러오기
	int getPriceList(); // 해당 캠핑장(예약) 대표객실 가격List 불러오기
	
	//캠핑장 상세페이지
	PlaceDetailVO getPlaceDetail(int num);//캠핑장(예약) 상세페이지 정보 불러오기
	int getReviewCountList(int num);//해당 캠핑장 리뷰갯수 가져오기
	double getGrade(int num);//해당 캠핑장 평균평점가져오기
	List<String> getPlaceDetailImg(int num);//해당 캨핑장 객실 이미지 가져오기
	
	void registerPlace(PlaceVO placeVO);//캠핑장 등록
	void registerPlace_Type(Place_TypeVO place_TypeVO);//캠핑장 타입 등록
	void registerRoom(RoomVO roomVO);//객실 등록
	void imginsert(ImageVO imageVO);//img업로드
	
	List<PlaceVO>filtering(String startdate, String enddate, String place_type_group_num,int capacity,String location);//검색조건에 맞는 캠핑장 조회
	List<PlaceDetailVO> getMyPlaceList(String member_id);//관리자별 캠핑장 조회
	PlaceVO getMyPlaceData(int num);//해당 캠핑장정보 조회
	
	
	void updatePlace(PlaceVO placeVO);//캠핑장 정보수정
	
	List<StaticsVO> getSales(int place_num);//캠핑장별 매출가져오기
}
