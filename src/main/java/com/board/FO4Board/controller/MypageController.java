package com.board.FO4Board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.FO4Board.service.MemberService;
import com.board.FO4Board.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MypageService mypageService;
	@GetMapping("mypage/main")
	public String mypage_main(HttpSession session, Model model) {
		if(session.getAttribute("member_idx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		Map member = memberService.selectUser_idx(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))));
		model.addAttribute("member",member);
		return "mypage/mypage-main";
	}
	@PostMapping("mypage/updatePro")
	public String mypage_updatePro(HttpSession session, String name, String email) {
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		mypageService.updateMember(name, email, member_idx);
		return "redirect:/mypage/main";
	}
	@GetMapping("mypage/password-changes")
	public String passwordChanges(HttpSession session){
		if(session.getAttribute("member_idx")==null) {
			return "redirect:/login";
		}
		return "mypage/mypage-password";
	}
	@PostMapping("mypage/password-changesPro")
	public String passwordChangesPro(HttpSession session, Model model,@RequestParam("password") String password, String new_password) {
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		String oldPassword = String.valueOf(memberService.selectUser_idx(member_idx).get("password"));
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if (!passwordEncoder.matches(password, oldPassword)) {
			model.addAttribute("msg", "현재 비밀번호와 일치하지 않습니다.");
			return "fail_back";
		}
		
		String securePasswd = passwordEncoder.encode(new_password);
		int success = mypageService.udatePassword(securePasswd, member_idx);
		if(success > 0) {
			session.invalidate();
			return "redirect:/login";
		}
		model.addAttribute("msg", "비밀번호 변경 실패");
		return "fail_back";
	}
	@PostMapping("mypage/withDrawal")
	public String withDrawal(HttpSession session) {
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		mypageService.deleteMember(member_idx);
		session.invalidate();
		return "redirect:/";
	}
	
}
