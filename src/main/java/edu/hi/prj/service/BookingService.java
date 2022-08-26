package edu.hi.prj.service;

import edu.hi.prj.vo.BookingVO;

public interface BookingService{
	
	void booking(BookingVO bookingVO);
	void reserved(String startdate,String enddate) throws Exception;
	
}
