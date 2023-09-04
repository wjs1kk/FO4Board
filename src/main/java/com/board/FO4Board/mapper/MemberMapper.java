package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import com.board.FO4Board.vo.MemberVO;

public interface MemberMapper {
	public int insertUser(MemberVO member);
	public MemberVO selectUser(String email);
	public String isAdmin(String email);
	public String selectPasswd(String email);
	public Map selectUser_idx(int member_idx);
	public List<Map> selectUserAll();
	public String memberEmailCheck(String email);
	public String memberNameCheck(String name);
}
