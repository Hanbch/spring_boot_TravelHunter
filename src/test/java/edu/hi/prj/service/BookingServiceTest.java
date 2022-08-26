package edu.hi.prj.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class BookingServiceTest {
	@Autowired
	private BookingService service;
	
	@Test
	void test()throws Exception {
		service.reserved(27,"08/20/2022","08/25/2022");
	}

}
