package edu.hi.prj.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import edu.hi.prj.vo.BoardImgVO;
import edu.hi.prj.vo.BoardVO;
import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.PheedCriteria;
import edu.hi.prj.vo.ReviewImgVO;
import edu.hi.prj.vo.SearchCriteria;
	


public interface BoardService{
	
	
	List<BoardVO> getList(int type);
	List<BoardVO> getHotList(int type);
	BoardVO getBoard(int id);
	void write(BoardVO boardVO);
	List<BoardVO> searchList(String member_id);
	int update(BoardVO boardVO);
	int delete(BoardVO boardVO);
	int updateView(int id);
	int imginsert(ImageVO imageVO);
	int boardGetid(BoardVO boardVO);
	List<BoardImgVO> getBoardImg();
	
	int getTotalCount(SearchCriteria scri);
	List<BoardVO> pagingList(SearchCriteria scri);
	int pheedCount();
	List<BoardVO> pheedpaging(@Param("cri") PheedCriteria cri,String member_id);
	
	
	List<BoardVO> getReview(int place_num);
	List<ReviewImgVO> getReviewImgList(int num);
	int replyCount(int num);
	
	List<BoardVO> activityList(String member_id);
	
	
}
