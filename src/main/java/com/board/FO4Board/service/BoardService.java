package com.board.FO4Board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.BoardMapper;

@Service
public class BoardService {
	@Autowired
	private BoardMapper mapper;
	public List<Map> selectBoardList() {
		return mapper.selectBoardList();
	}
	public int insertBoard(int member_idx, String title, String content) {
		return mapper.insertBoard(member_idx, title, content);
	}
	public Map selectBoardDetail(int board_idx) {
		return mapper.selectBoardDetail(board_idx);
	}
}