package edu.hi.prj.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.BookingVO;

@Mapper
public interface BookingMapper{
	
	void booking(BookingVO bookingVO);
	void reserved(String date);
}
