package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	public List<Map> selectAdminList();
	public List<Map> memberWriteList(@Param("member_idx") int member_idx);
	public int deleteNotice(int notice_idx);
	public int updateNotice(@Param("title") String title,@Param("content") String content, @Param("notice_idx") int notice_idx);
	public int updateMember(@Param("name") String name,@Param("email") String email,@Param("password") String password, @Param("member_idx") int member_idx);
	public int deleteMember(int member_idx);
}
