package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.BoardVO;
import edu.hi.prj.vo.ReviewImgVO;

@Mapper
public interface BoardMapper{
	List<BoardVO> getList(int type);
	List<BoardVO> getHotList(int type);
	BoardVO getBoard(int id);
	void insert(BoardVO boardVO);
	List<BoardVO> searchList(String member_id);
	int update(BoardVO boardVO);
	int delete(BoardVO boardVO);
	int updateView(int id);
	
	List<BoardVO> getReview(int num);//해당 캠핑장의 리뷰글 불러오기
	List<ReviewImgVO> getReviewImgList(int num);
	int replyCount(int num);
	
	

}
