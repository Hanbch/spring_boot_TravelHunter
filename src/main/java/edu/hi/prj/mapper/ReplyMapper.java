package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.ReplyVO;

@Mapper
public interface ReplyMapper{
	public List<ReplyVO> getList(int id);
	void insert(ReplyVO replydVO);
	int delete(ReplyVO replyVO);
	ReplyVO getReply(int num);
	int replyCount(int count);
	void updateShape(ReplyVO replyVO); //답글위치
	ReplyVO qnagetReply(int board_id);
}
