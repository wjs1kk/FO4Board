package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	public List<Map> selectAdminList();
	public List<Map> memberWriteList(@Param("member_idx") int member_idx);
	public int deleteNotice(int notice_idx);
	public int updateNotice(String title, String content, int notice_idx);
}
