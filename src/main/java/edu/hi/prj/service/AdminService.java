package edu.hi.prj.service;

import java.util.List;

import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.RoomVO;

public interface AdminService{
	
	List<MemberVO> getMemberList(String id);
	MemberVO selectMember(String id);
	void deleteMember(String id);
	
	List<PlaceVO> getPlaceList(String id);
	PlaceVO selectPlace(String id);
	

	List<BookingVO> getReservationList(String id);
	BookingVO selectReservation(int id);
	void updateMem(String id, String nick);
	
	List<RoomVO> roomList(String id);
	void deleteRoom(String id, String room);

	
}
