package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ReplyMapper {
	public int insertReply(@Param("board_idx") int board_idx,@Param("re_content") String re_content,@Param("member_idx") int member_idx);
	public List<Map> selectReply(int board_idx);
}
