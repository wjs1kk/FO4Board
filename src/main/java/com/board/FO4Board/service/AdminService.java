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
}
