package com.board.FO4Board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.board.FO4Board.service.BoardService;
import com.board.FO4Board.service.MemberService;
import com.board.FO4Board.service.ReplyService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReplyService replyService;
	@GetMapping("board/main")
	public String board(Model model) {
		List<Map> boardList = boardService.selectBoardList();
		model.addAttribute("boardList",boardList);
		return "board/board-main";
	}
	@GetMapping("board/write")
	public String board_write(HttpSession session, Model model) {
		if(session.getAttribute("member_idx") == null) {
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			return "fail_back";
		}
		return "board/board-write";
	}
	@PostMapping("board/writePro")
	public String board_write_pro(HttpSession session, Model model, String title, String content) {
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		int write_success = boardService.insertBoard(member_idx, title, content);
		if(write_success>0) {
			return "redirect:/board/main";	
		}
		model.addAttribute("msg", "글 작성 실패");
		return "fail_back";
	}
	@GetMapping("board/detail")
	public String board_detail(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, int num) {
		Cookie oldCookie= null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + num + "]")) {
	            boardService.updateViewcnt(num);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + num + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	boardService.updateViewcnt(num);
	        Cookie newCookie = new Cookie("postView","[" + num + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		
		
		if(session.getAttribute("member_idx") != null){
			int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
			model.addAttribute("member", memberService.selectUser_idx(member_idx));
		}
//		게시글 내용
		Map boardDetail = boardService.selectBoardDetail(num);
		String content = org.springframework.web.util.HtmlUtils.htmlEscape(String.valueOf(boardDetail.get("content")));
		content = content.replaceAll("\n","<br/>");
		boardDetail.put("content", content);
		model.addAttribute("boardDetail", boardDetail);
//		댓글리스트
		List<Map> replyList = replyService.selectReply(num);
		if(replyList != null) {
			model.addAttribute("replyList", replyList);
		}
		return "board/board-detail";
	}
	@PostMapping("board/deleteBoardPro")
	public String deleteBoardPro(Model model, int num) {
		int success = boardService.deleteBoard(num);
		if(success>0) {
			return "redirect:/board/main";
		}
		model.addAttribute("msg", "삭제 실패 하셨습니다");
		return "fail_back";
	}
	@GetMapping("board/update")
	public String board_update(Model model, int num) {
		Map boardDetail = boardService.selectBoardDetail(num);
//		String content = org.springframework.web.util.HtmlUtils.htmlEscape(String.valueOf(boardDetail.get("content")));
//		content = content.replaceAll("\n","<br/>");
//		boardDetail.put("content", content);
		model.addAttribute("boardDetail", boardDetail);
		return "board/board-update";
	}
	@PostMapping("board/updatePro")
	public String board_updatePro(String title, String content, int num) {
		boardService.updateBoard(title, content, num);
		return "redirect:/board/detail?num="+num;
	}
}
