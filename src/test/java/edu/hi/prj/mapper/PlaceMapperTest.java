package edu.hi.prj.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.StaticsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class PlaceMapperTest {
	
	@Autowired
	private PlaceMapper mapper;
	
	
	@Test
	void test() {
		
		//캠핑장 정보 가져오기 테스트
		List<PlaceVO> p = mapper.getPlaceData();
		
		for(PlaceVO place:p) {
			System.out.println(place);
		}
		
		//캠핑장별 매출통계 가져오기 테스트
		List<StaticsVO> sales = mapper.getSales(45);
		log.info("Place No.45 연간매출");
		System.out.println(sales);
		
	}

}
