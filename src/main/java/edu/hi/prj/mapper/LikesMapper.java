package edu.hi.prj.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.LikeVO;

@Mapper
public interface LikesMapper {
	void likecreate(LikeVO likeVO);
	int likeread(LikeVO likeVO);
	int likedelete(LikeVO likeVO);
	
	
	
}

