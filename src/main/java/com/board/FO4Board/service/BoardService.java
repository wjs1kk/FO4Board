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
	public int deleteBoard(int board_idx) {
		return mapper.deleteBoard(board_idx);
	}
	public int updateBoard(String title, String content, int board_idx) {
		return mapper.updateBoard(title, content, board_idx);
	}
	public int updateViewcnt(int board_idx) {
		return mapper.updateViewcnt(board_idx);
	}
	public List<Map> selectBoardList_ten(){
		return mapper.selectBoardList_ten();
	}
	public Map selectHeart(int board_idx, int member_idx) {
		return mapper.selectHeart(board_idx, member_idx) != null? mapper.selectHeart(board_idx, member_idx) : null;
	}
	public int insertHeart(int board_idx, int member_idx) {
		return mapper.insertHeart(board_idx, member_idx);
	}
	public int cancelHeart(int board_idx, int member_idx) {
		return mapper.cancelHeart(board_idx, member_idx);
	}
}
