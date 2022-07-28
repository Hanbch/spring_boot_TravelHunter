package edu.hi.prj.service;

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
	
	
}
