package com.board.FO4Board.controller;

import java.util.List;
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
import com.board.FO4Board.service.TodoService;
import com.board.FO4Board.vo.MemberVO;
import com.board.FO4Board.vo.TodoVO;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private TodoService todoService;
	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		if(session.getAttribute("member_idx") == null) {
			return "index";
		}
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		List<TodoVO> todoList = todoService.selectTodo(member_idx);	
		model.addAttribute("todoList",todoList);
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
		if (passwd == null || !passwordEncoder.matches(password, passwd)) {
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		}
		String isAdmin =  memberService.isAdmin(email);
		if(isAdmin.equals("1")) {
			session.setAttribute("member_idx", 0);
		}
		else {
			MemberVO member = memberService.selectUser(email);
			session.setAttribute("member_idx", member.getMember_idx());
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
