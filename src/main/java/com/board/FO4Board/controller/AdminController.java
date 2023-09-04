package com.board.FO4Board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.FO4Board.service.AdminService;
import com.board.FO4Board.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminService adminService;
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
}
