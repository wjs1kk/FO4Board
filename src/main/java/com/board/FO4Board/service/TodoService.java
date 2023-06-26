package com.board.FO4Board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.TodoMapper;
import com.board.FO4Board.vo.TodoVO;

@Service
public class TodoService {
	@Autowired
	private TodoMapper mapper;
	public List<TodoVO> selectTodo(int member_idx) {
		return mapper.selectTodo(member_idx)!= null ? mapper.selectTodo(member_idx) : null;
	}
	public int insertTodo(int member_idx, String title) {
		return mapper.insertTodo(member_idx, title);
	}
	public int deleteTodo(int todo_idx) {
		return mapper.deleteTodo(todo_idx);
	}
	public int checkTodo(int todo_idx) {
		return mapper.checkTodo(todo_idx);
	}
	public int uncheckedTodo(int todo_idx) {
		return mapper.uncheckedTodo(todo_idx);
	}
}
