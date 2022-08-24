package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.LikeVO;

@Mapper
public interface LikesMapper {
	void likecreate(LikeVO likeVO);
	List<LikeVO> likeread(String member_id);
	int likedelete(LikeVO likeVO);
	
	
	
}

