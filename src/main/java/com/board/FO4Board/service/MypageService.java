package com.board.FO4Board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.MypageMapper;
import com.board.FO4Board.vo.PageVO;

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
	public List<Map> selectHeartList(int member_idx, PageVO pageVO){
		return mapper.selectHeartList(member_idx, pageVO);
	}
	public int heartCount(int member_idx) {
		return mapper.heartCount(member_idx);
	}
}
