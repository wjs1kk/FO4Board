package com.board.FO4Board.vo;

import java.util.Date;

public class ReplyVO {
	private int reply_idx;
	private int board_idx;
	private String re_content;
	private int member_idx;
	private Date re_regdate;
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public Date getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(Date re_regdate) {
		this.re_regdate = re_regdate;
	}
	
	
}
