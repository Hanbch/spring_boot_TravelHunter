package edu.hi.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.ReplyMapper;
import edu.hi.prj.vo.ReplyVO;

@Service
public class ReplyServicelmpl implements ReplyService{
	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> getList(int id) {
		
		return mapper.getList(id);
	}
	
	@Override
	public void write(ReplyVO replyVO) {
		mapper.updateShape(replyVO);
		mapper.insert(replyVO);
	}
	
	@Override
	public int delete(ReplyVO replyVO) {
		
		return mapper.delete(replyVO);
	}
	
	@Override
	public ReplyVO getReply(int num) {
		
		return mapper.getReply(num);
	}

	@Override
	public int replyCount(int count) {
		
		return mapper.replyCount(count);
	}

	@Override
	public void updateShape(ReplyVO replyVO) {
		mapper.updateShape(replyVO);
		
	}

	@Override
	public ReplyVO qnagetReply(int board_id) {
		// TODO Auto-generated method stub
		return mapper.qnagetReply(board_id);
	}
	
	

	
	
}
