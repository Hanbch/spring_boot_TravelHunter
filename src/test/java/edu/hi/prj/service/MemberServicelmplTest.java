package edu.hi.prj.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class MemberServicelmplTest {
	
	@Autowired
	private BookingService bookingservice;
	
	@Test
	void test() {
		bookingservice.reserved("08/26/2022", "08/27/2022") throws Exception;
	}

}
