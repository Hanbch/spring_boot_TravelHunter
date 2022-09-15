package edu.hi.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.MemberMapper;
import edu.hi.prj.vo.MemberVO;

@Service
public class MemberServicelmpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	
	@Override//회원가입
	public void create(MemberVO memberVO) {
		mapper.create(memberVO);
		
	}

	@Override
	public MemberVO logincheck(MemberVO memberVO) {
		return mapper.logincheck(memberVO);
	}

	@Override
	public int idcheck(MemberVO memberVO) {
		int result = mapper.idcheck(memberVO);
		return result;
	}

	@Override
	public void memberUpdate(MemberVO memberVO) {
		mapper.memberUpdate(memberVO);
	}

	@Override
	public void memberDelete(String id) {
		mapper.memberDelete(id);
	}

	@Override
	public int delpwcheck(MemberVO memberVO) {
		int result = mapper.delpwcheck(memberVO);
		return result;
	}

	@Override
	public List<MemberVO> memberBoardList(String id) {
		
		return mapper.memberBoardList(id);
	}

	@Override
	public MemberVO getmember(String id) {
		
		return mapper.getmember(id);
	}

	@Override
	public List<MemberVO> findid(String memail) {
		return mapper.findid(memail);
	}

	@Override
	public int findidcheck(String memail) {
		return mapper.findidcheck(memail);
	}

	@Override
	public void findPw(String mpw, String memail, String id) {
		mapper.findPw(mpw, memail, id);
		
	}

	@Override
	public int findpwcheck(String memail, String id) {
		return mapper.findpwcheck(memail, id);
	}

	


	
	
}
