package edu.hi.prj.service;

import edu.hi.prj.vo.BookingVO;
import edu.hi.prj.vo.ReserveInfoVO;

public interface BookingService{
	
	void booking(BookingVO bookingVO);
	void reserved(BookingVO bookingVO)throws Exception;
	ReserveInfoVO getRsvInfo(int room_num);
	
}
