package edu.hi.prj.service;

import edu.hi.prj.vo.BookingVO;

import java.util.List;

import edu.hi.prj.vo.BookingInfoVO;

public interface BookingService {

	void booking(BookingVO bookingVO);

	void reserved(BookingVO bookingVO) throws Exception;
	
	List<BookingVO> getRsvList(String member_id);//회원ID로 예약정보List 가져오기

	BookingInfoVO getBookingInfo(int room_num);
	
	int rsvdelete(BookingVO bookingVO);
	
	void withdraworder(BookingVO bookingVO);

}
