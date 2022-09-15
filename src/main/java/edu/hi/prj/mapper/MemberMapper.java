package edu.hi.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.prj.vo.MemberVO;
import edu.hi.prj.vo.UserVO;

@Mapper
public interface MemberMapper{
	void create(MemberVO memberVO);
	MemberVO logincheck(MemberVO memberVO);
	int idcheck(MemberVO memberVO);
	void memberUpdate(MemberVO memberVO);
	void memberDelete(String id);
	int delpwcheck(MemberVO memberVO);
	List<MemberVO> memberBoardList(String id);
	MemberVO getmember(String id);
	List<MemberVO> findid(String memail);
	int findidcheck(String memail);
	void findPw(String mpw, String memail, String id);
	int findpwcheck(String memail, String id);

	
	
	
}
