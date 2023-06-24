package com.board.FO4Board.vo;

import java.util.Date;

public class TodoVO {
	private int idx;
	private String title;
	private Date created;
	private String completed;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
