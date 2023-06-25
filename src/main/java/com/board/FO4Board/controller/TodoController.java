package com.board.FO4Board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.FO4Board.service.TodoService;

@Controller
public class TodoController {
	@Autowired
	private TodoService todoService;
	
	@ResponseBody
	@PostMapping("insertTodo")
	public Map insertTodo(HttpSession session,@RequestParam("title")  String title) {
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		todoService.insertTodo(member_idx, title);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "ok");
		return map;
	}
	@ResponseBody
	@PostMapping("deleteTodo")
	public void deleteTodo(@RequestParam("todo_idx") int todo_idx) {
		todoService.deleteTodo(todo_idx);
	}
}
