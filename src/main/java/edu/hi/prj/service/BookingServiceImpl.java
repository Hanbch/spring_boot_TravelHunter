package edu.hi.prj.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nimbusds.jose.shaded.json.parser.ParseException;

import edu.hi.prj.mapper.BookingMapper;
import edu.hi.prj.vo.BookingVO;

@Service
public class BookingServiceImpl implements BookingService{
	@Autowired
	BookingMapper mapper;

	@Override
	public void booking(BookingVO bookingVO) {
		mapper.booking(bookingVO);
		
	}

	@Override
   public void reserved(String startdate, String enddate) throws Exception {
      startdate = "08/29/2022";
      enddate = "09/01/2022";
        
          
       Date checkout;
       Date checkin;
      
         checkout = new SimpleDateFormat("MM/dd/yyyy").parse(enddate);
         checkin = new SimpleDateFormat("MM/dd/yyyy").parse(startdate);
         
           long diffSec = (checkout.getTime() - checkin.getTime()) / 1000;
            long diffDays = diffSec / (24*60*60); //일자수 차이
         
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("MMddyyyy");
            Calendar cal = Calendar.getInstance();
              
            for(int i = 0; i < diffDays; i ++) {
               cal.setTime(checkin);
               cal.add(Calendar.DATE, i); // 하루더하기  
               String day = dateFormat.format(cal.getTime());
               System.out.println(day);
               mapper.reserved(day);
            }

	}
	

}
