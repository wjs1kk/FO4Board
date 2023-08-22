package com.board.FO4Board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.NoticeMapper;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;
	public List<Map> selectNoticeList(){
		return mapper.selectNoticeList();
	}
	public Map selectNoticeDetail(int notice_idx) {
		return mapper.selectNoticeDetail(notice_idx);
	}
}
