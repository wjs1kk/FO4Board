package com.board.FO4Board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.ReplyMapper;

@Service
public class ReplyService {
	@Autowired
	private ReplyMapper mapper;
	
	public int insertReply(int board_idx, String re_content, int member_idx) {
		return mapper.insertReply(board_idx, re_content, member_idx);
	}
	public List<Map> selectReply(int board_idx) {
		return mapper.selectReply(board_idx) != null ? mapper.selectReply(board_idx) : null ;
	}
}
