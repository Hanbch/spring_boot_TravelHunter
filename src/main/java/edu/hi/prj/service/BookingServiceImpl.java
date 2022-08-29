package edu.hi.prj.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.BookingMapper;
import edu.hi.prj.vo.BookingInfoVO;
import edu.hi.prj.vo.BookingVO;

@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingMapper mapper;

	@Override
	public void booking(BookingVO bookingVO) {
		mapper.booking(bookingVO);

	}

	@Override
	public void reserved(BookingVO bookingVO) throws Exception {

		int room_num = bookingVO.getRoom_num();

		Date checkout;
		Date checkin;

		checkout = new SimpleDateFormat("MM/dd/yyyy").parse(bookingVO.getEnddate());
		checkin = new SimpleDateFormat("MM/dd/yyyy").parse(bookingVO.getStartdate());

		long diffSec = (checkout.getTime() - checkin.getTime()) / 1000;
		long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddyyyy");
		Calendar cal = Calendar.getInstance();

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(checkin);
			cal.add(Calendar.DATE, i); // 하루더하기
			String rdate = dateFormat.format(cal.getTime());
			System.out.println(rdate);
			mapper.reserved(room_num, rdate);
		}
	}

	@Override
	public BookingInfoVO getBookingInfo(int room_num) {

		return mapper.getBookingInfo(room_num);
	}

	@Override
	public List<BookingVO> getRsvList(String member_id) {
		
		return mapper.getRsvList(member_id);//회원ID로 예약정보List 가져오기;
	}

	@Override
	public int rsvdelete(BookingVO bookingVO) {
		
		return mapper.rsvdelete(bookingVO);
	}

}
