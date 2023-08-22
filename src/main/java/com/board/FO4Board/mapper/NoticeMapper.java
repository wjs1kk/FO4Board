package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	public List<Map> selectNoticeList();
	public Map selectNoticeDetail(int notice_idx);
}
