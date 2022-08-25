package edu.hi.prj.service;

import java.util.List;

import edu.hi.prj.vo.MemberVO;

public interface MemberService{
	void create(MemberVO memberVO);
	MemberVO logincheck(MemberVO memberVO);
	int idcheck(MemberVO memberVO);
	void memberUpdate(MemberVO memberVO);
	void memberDelete(MemberVO memberVO);
	int delpwcheck(MemberVO memberVO);
	List<MemberVO> memberBoardList(String id);
	MemberVO getmember(String id);
}
