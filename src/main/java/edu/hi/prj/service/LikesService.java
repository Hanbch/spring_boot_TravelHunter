package edu.hi.prj.service;

import java.util.List;

import edu.hi.prj.vo.LikeVO;

public interface LikesService{
	void likecreate(LikeVO likeVO);
	List<LikeVO> likeread(String member_id);
	int likedelete(LikeVO likeVO);
	
}
