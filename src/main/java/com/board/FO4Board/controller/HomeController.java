package com.board.FO4Board.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.FO4Board.service.MemberService;
import com.board.FO4Board.vo.MemberVO;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
		return "index";
	}
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("loginPro")
	public String loginPro(String email, String password, HttpSession session, Model model) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String passwd = memberService.selectPasswd(email);
		System.out.println(passwd);
		System.out.println(password);
		if (passwd == null || !passwordEncoder.matches(password, passwd)) {
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		}
		String isAdmin =  memberService.isAdmin(email);
		System.out.println(isAdmin);
		if(isAdmin.equals("1")) {
			session.setAttribute("idx", 0);
		}
		else {
			MemberVO member = memberService.selectUser(email);
			session.setAttribute("idx", member.getIdx());
		}
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	@PostMapping("joinPro")
	public String joinPro(MemberVO member,Model model) {
		if(memberService.selectUser(member.getEmail()) != null) {
			model.addAttribute("msg", "이미 가입한 이메일입니다");
			return "fail_back";
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(member.getPassword());
		member.setPassword(securePasswd);
		if (memberService.insertUser(member) == 0 ) {
			return "signup";
		}
		return "redirect:/login";
	}
}
