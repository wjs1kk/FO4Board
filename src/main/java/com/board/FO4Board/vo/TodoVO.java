package com.board.FO4Board.vo;

import java.util.Date;

public class TodoVO {
	private int todo_idx;
	private String title;
	private Date created;
	private String completed;
	
	public int getTodo_idx() {
		return todo_idx;
	}
	public void setTodo_idx(int todo_idx) {
		this.todo_idx = todo_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getCompleted() {
		return completed;
	}
	public void setCompleted(String completed) {
		this.completed = completed;
	}
	
	
	
}
