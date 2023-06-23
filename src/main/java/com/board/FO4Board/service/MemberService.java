package com.board.FO4Board.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.board.FO4Board.mapper.MemberMapper;
import com.board.FO4Board.vo.MemberVO;


@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	public int insertUser(MemberVO member) {
		return mapper.insertUser(member);
	}
	public MemberVO selectUser(String email) {
		return mapper.selectUser(email)!= null ? mapper.selectUser(email) : null;
	}

	public String isAdmin(String email) {
		return mapper.isAdmin(email);
	}
	public String selectPasswd(String email) {
		return mapper.selectPasswd(email);
	}

}
