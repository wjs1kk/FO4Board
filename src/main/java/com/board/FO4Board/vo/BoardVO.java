package com.board.FO4Board.vo;

import java.util.Date;

public class BoardVO {
	private int board_idx;
	private int member_idx;
	private String title;
	private String content;
	private int viewcnt;
	private Date regdate;
	private Date update_regdate;
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_regdate() {
		return update_regdate;
	}
	public void setUpdate_regdate(Date update_regdate) {
		this.update_regdate = update_regdate;
	}
	
}
