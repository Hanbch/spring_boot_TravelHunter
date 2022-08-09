package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.PlaceDetailVO;
import edu.hi.prj.vo.PlaceVO;

@Mapper
public interface PlaceMapper{
	
	List<PlaceVO>getPlaceData();// 캠핑장(예약) 정보List 불러오기
	double getPlaceGrade();// 해당 캠핑장(예약) 평균평점List 불러오기
	String getPlaceImg(); // 해당 캠핑장(예약) 대표사진 불러오기
	int getPriceList(); // 해당 캠핑장(예약) 대표객실 가격List 불러오기
	
	//캠핑장 상세페이지
	PlaceDetailVO getPlaceDetail(int num);//캠핑장(예약) 상세페이지 정보 불러오기
	int getReviewCountList(int num);//해당 캠핑장 리뷰갯수 가져오기
	double getGrade(int num);//해당 캠핑장 평균평점가져오기
	List<String> getPlaceDetailImg(int num);//해당 캨핑장 객실 이미지 가져오기
}