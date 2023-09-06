package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.board.FO4Board.vo.PageVO;

public interface MypageMapper {
	public int updateMember(@Param("name") String name,@Param("email") String email,@Param("member_idx") int member_idx);
	public int udatePassword(@Param("new_password") String new_password,@Param("member_idx") int member_idx);
	public int deleteMember(int member_idx);
	public List<Map> selectHeartList(@Param("member_idx") int member_idx, PageVO pageVO);
	public int heartCount(int member_idx);
}
