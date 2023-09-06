package com.board.FO4Board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.FO4Board.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	public List<Map> selectAdminList() {
		return mapper.selectAdminList();
	}
	public List<Map> memberWriteList(int member_idx){
		return mapper.memberWriteList(member_idx);
	}
	public int deleteNotice(int notice_idx) {
		return mapper.deleteNotice(notice_idx);
	}
	public int updateNotice(String title, String content, int notice_idx) {
		return mapper.updateNotice(title, content, notice_idx);
	}
	public int updateMember(String name, String email, String password, int member_idx) {
		return mapper.updateMember(name, email, password, member_idx);
	}
	public int deleteMember(int member_idx) {
		return mapper.deleteMember(member_idx);
	}
}
