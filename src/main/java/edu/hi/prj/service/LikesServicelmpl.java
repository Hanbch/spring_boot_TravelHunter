package edu.hi.prj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.LikesMapper;
import edu.hi.prj.vo.LikeVO;

@Service
public class LikesServicelmpl implements LikesService{
	@Autowired
	LikesMapper mapper;
	
	
	@Override
	public void likecreate(LikeVO likeVO) {
		mapper.likecreate(likeVO);
		
	}

	@Override
	public int likeread(LikeVO likeVO) {
		return mapper.likeread(likeVO);
	}

	@Override
	public int likedelete(LikeVO likeVO) {
		return mapper.likedelete(likeVO);
	}
	

	
}
