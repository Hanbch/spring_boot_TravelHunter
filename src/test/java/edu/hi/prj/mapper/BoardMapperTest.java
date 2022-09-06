package edu.hi.prj.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.prj.vo.BoardImgVO;
import edu.hi.prj.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class BoardMapperTest {

	@Autowired
	private BoardMapper mapper;
	
	@Test
	void testgetList() {
		
		//게시글 이미지 가져오기 테스트
		List<BoardImgVO> img = mapper.getBoardImg();
		
		for(BoardImgVO boardImg : img) {
			System.out.println(boardImg);
		}
		
		//게시글타입 0번 글 리스트 가져오기 테스트
		List<BoardVO> list = mapper.getList(0);
		
		for(BoardVO boardList : list) {
			System.out.println(boardList);
		}
		
	}

}
