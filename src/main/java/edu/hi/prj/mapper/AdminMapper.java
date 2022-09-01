package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.RoomVO;

@Mapper
public interface AdminMapper{

	// 회원관리 페이지
	List<MemberVO> getMemberList();	//멤버 전체 리스트 불러오기
	List<MemberVO> searchMemberList(String id); // 멤버 ID 검색 리스트 불러오기
	MemberVO selectMember(String id);	// 해당 멤버 정보 불러오기
	// 회원 삭제를 위한 부분
	void deleteMember(String id);		// 해당 멤버 삭제
	void delMemberPlace(String id);	//해당 멤버와 관련된 캠핑장 삭제
	void updateMemberNick(String id, String nick);	//해당 멤버의 닉네임 수정
	void updateMemberauth(String id, int auth_num);
	
	// 캠핑장 관리 페이지
	List<PlaceVO> getPlaceList();	// 캠핑장 전체 리스트 불러오기
	List<PlaceVO> searchPlaceList(int num);	//캠핑장ID 검색 리스트 불러오기
	PlaceVO selectPlace(int id);	// 해당 캠핑장 정보 불러오기
	List<RoomVO> getRoomList(int id);		//캠핑장에 등록된 방 리스트 불러오기
	void deleteRoom(int id, int room);	//특정캠핑장의 특정 룸 삭제
	// 캠핑장 삭제를 위한 부분
	
	
	//예약 관리 페이지
	List<BookingVO> getReservationList();	//전체 예약 리스트 불러오기
	List<BookingVO> searchReservationList(int id);
	
	
	
	
	
	
}
