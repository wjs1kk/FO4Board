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

import com.board.FO4Board.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	@GetMapping("notice/main")
	public String notice(Model model) {
		List<Map> noticeList = noticeService.selectNoticeList();
		model.addAttribute("noticeList",noticeList);
		return "notice/notice-main";
	}
	@GetMapping("notice/detail")
	public String notice_detail(Model model, HttpSession session, int num) {
		Map noticeDetail = noticeService.selectNoticeDetail(num);
		String content = org.springframework.web.util.HtmlUtils.htmlEscape(String.valueOf(noticeDetail.get("content")));
		content = content.replaceAll("\n","<br/>");
		noticeDetail.put("content", content);
		model.addAttribute("noticeDetail", noticeDetail);
		return "notice/notice-detail";
	}
}
