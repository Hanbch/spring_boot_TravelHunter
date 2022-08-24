package edu.hi.prj.service;

import java.util.List;

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
	public List<LikeVO> likeread(String member_id) {
		return mapper.likeread(member_id);
	}

	@Override
	public int likedelete(LikeVO likeVO) {
		return mapper.likedelete(likeVO);
	}
	

	
}
