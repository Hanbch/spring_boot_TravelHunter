package edu.hi.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.hi.prj.mapper.AdminMapper;
import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.RoomVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper mapper;

	@Override
	public List<MemberVO> getMemberList(String id){
		if(id == null)
			return mapper.getMemberList();
		else
			return mapper.searchMemberList(id);
	}
	
	@Override
	public MemberVO selectMember(String id) {
		return mapper.selectMember(id);
	}
	
	@Override
	@Transactional
	public void deleteMember(String id) {
		mapper.delMemberPlace(id);
		mapper.deleteMember(id);
	}

	
	@Override
	public List<PlaceVO> getPlaceList(String id) {
		try {
			int num = Integer.parseInt(id);
			return mapper.searchPlaceList(num);	
		} catch (Exception e) {
			return mapper.getPlaceList();
		}
	}

	@Override
	public PlaceVO selectPlace(String id) {
		int num = Integer.parseInt(id);
		return mapper.selectPlace(num);
	}

	@Override
	public List<BookingVO> getReservationList(String id) {
		try {
			int num = Integer.parseInt(id);
			return mapper.searchReservationList(num);
		} catch (Exception e) {
			return mapper.getReservationList();
		}
	}

	@Override
	public BookingVO selectReservation(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMem(String id, String nick) {
		mapper.updateMemberNick(id, nick);
	}

	@Override
	public List<RoomVO> roomList(String id) {
		int num = Integer.parseInt(id);
		return mapper.getRoomList(num);
	}

	@Override
	public void deleteRoom(String id, String room) {
		int id_num = Integer.parseInt(id);
		int room_num = Integer.parseInt(room);
		mapper.deleteRoom(id_num, room_num);
		
	}

	@Override
	public void updateMemberauth(String id, int auth_num) {
		mapper.updateMemberauth(id, auth_num);
		
	}


	

}
