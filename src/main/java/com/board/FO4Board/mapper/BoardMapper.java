package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	public List<Map> selectBoardList();
	public int insertBoard(@Param("member_idx") int member_idx, @Param("title") String title, @Param("content") String content);
	public Map selectBoardDetail(int board_idx);
}
