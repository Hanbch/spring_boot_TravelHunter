package edu.hi.prj.service;

import edu.hi.prj.vo.LikeVO;

public interface LikesService{
	void likecreate(LikeVO likeVO);
	int likeread(LikeVO likeVO);
	int likedelete(LikeVO likeVO);
	
}
