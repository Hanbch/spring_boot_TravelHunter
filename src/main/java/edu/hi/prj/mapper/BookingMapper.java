package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.BookingInfoVO;
import edu.hi.prj.vo.BookingVO;

@Mapper
public interface BookingMapper {

	void booking(BookingVO bookingVO);

	void reserved(int room_num, String rdate);

	BookingInfoVO getBookingInfo(int room_num);
	
	List<BookingVO> getRsvList(String member_id);//회원ID로 예약정보List 가져오기
	
	List<BookingVO> getManagerRsvList(String member_id);//매니저ID로 예약정보List 가져오기
	
	List<BookingVO> getRsvedList(String member_id);//회원ID로 지난예약정보List 가져오기
	
	List<BookingVO> getManagerRsvedList(String member_id);//매니저ID로 예약정보List 가져오기
	
	BookingVO getRsvInfo(int room_num);//예약번호로 예약정보 가져오기
	
	int rsvdelete(BookingVO bookingVO);//취소된 예약정보 추가
	
	void withdraworder(BookingVO bookingVO);
	
	List<BookingVO> withdraworderList(String member_id);//취소된 예약정보 가져오기
	
	List<BookingVO> managerWithdrawOrderList(String member_id);//매니저ID로 취소된 예약정보 가져오기
}
