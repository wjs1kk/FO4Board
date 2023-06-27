package com.board.FO4Board.mapper;

import java.util.Map;

import com.board.FO4Board.vo.MemberVO;

public interface MemberMapper {
	public int insertUser(MemberVO member);
	public MemberVO selectUser(String email);
	public String isAdmin(String email);
	public String selectPasswd(String email);
	public Map selectUser_idx(int member_idx);
}
