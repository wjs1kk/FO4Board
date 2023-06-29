package com.board.FO4Board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.MypageMapper;

@Service
public class MypageService {
	@Autowired
	private MypageMapper mapper;
	public int updateMember(String name, String email, int member_idx) {
		return mapper.updateMember(name, email, member_idx);
	}
	public int udatePassword(String new_password, int member_idx) {
		return mapper.udatePassword(new_password, member_idx);
	}
	public int deleteMember(int member_idx) {
		return mapper.deleteMember(member_idx);
	}
}
