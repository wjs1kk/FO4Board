package com.board.FO4Board.mapper;

import org.apache.ibatis.annotations.Param;

public interface MypageMapper {
	public int updateMember(@Param("name") String name,@Param("email") String email,@Param("member_idx") int member_idx);
	public int udatePassword(@Param("new_password") String new_password,@Param("member_idx") int member_idx);
	public int deleteMember(int member_idx);
}
