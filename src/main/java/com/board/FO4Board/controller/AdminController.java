package com.board.FO4Board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.board.FO4Board.service.AdminService;
import com.board.FO4Board.service.BoardService;
import com.board.FO4Board.service.MemberService;
import com.board.FO4Board.service.NoticeService;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("admin/main")
	public String index(Model model, HttpSession session) {
		if(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))) != 0) {
			return "redirect:/";
		}
		model.addAttribute("user",memberService.selectUserAll());
		return "admin/index";
	}
	@GetMapping("admin/adminlist")
	public String adminList(Model model,HttpSession session) {
		if(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))) != 0) {
			return "redirect:/";
		}
		model.addAttribute("selectAdminList", adminService.selectAdminList());
		return "admin/admin-list";
	}
	@GetMapping("admin/userwrite")
	public String userwrite(Model model, int num) {
		model.addAttribute("user", memberService.selectUser_idx(num));
		model.addAttribute("memberWriteList",adminService.memberWriteList(num));
		return "admin/userwrite";
	}
	@GetMapping("admin/notice")
	public String notice(Model model) {
		List<Map> noticeList = noticeService.selectNoticeList();
		model.addAttribute("noticeList",noticeList);
		return "admin/notice";
	}
	@PostMapping("notice/deleteNoticePro")
	public String notice_delete(HttpSession session, Model model, int num) {
		if(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))) != 0) {
			return "redirect:/";
		}
		int success = adminService.deleteNotice(num);
		if(success>0) {
			return "redirect:/notice/main";
		}
		model.addAttribute("msg", "삭제 실패 하셨습니다");
		return "fail_back";
	}
	@GetMapping("notice/update")
	public String notice_update(HttpSession session, Model model, int num) {
		if(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))) != 0) {
			return "redirect:/";
		}
		Map noticeDetail = noticeService.selectNoticeDetail(num);
		model.addAttribute("noticeDetail", noticeDetail);
		return "notice/notice-update";
	}
	@PostMapping("notice/updatePro")
	public String notice_updatePro(HttpSession session, String title, String content, int num) {
		if(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))) != 0) {
			return "redirect:/";
		}
		adminService.updateNotice(title, content, num);
		return "redirect:/notice/detail?num="+num;
	}
}
