package com.board.FO4Board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.board.FO4Board.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;

	@PostMapping("board/detail/replyPro")
	public String replyPro(HttpSession session, Model model,int num, String re_content) {
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		int success = replyService.insertReply(num, re_content, member_idx);
		if(success > 0) {
			
			return "redirect:/board/detail?num="+num;
		}
		model.addAttribute("msg", "댓글 작성 실패하셨습니다.");
		return "fail_back";
	}
	
}
