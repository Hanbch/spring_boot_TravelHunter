package edu.hi.prj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService{
	@Autowired
	BookingMapper mapper;

	@Override
	public int dateinsert() {
		
		return mapper.dateinsert();
	}


	

	

}
