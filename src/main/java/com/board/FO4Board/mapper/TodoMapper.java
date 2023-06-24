package com.board.FO4Board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.FO4Board.vo.TodoVO;

public interface TodoMapper {
	public List<TodoVO> selectTodo(int member_idx);
	public int insertTodo(@Param("member_idx") int member_idx, @Param("title") String title);
}
