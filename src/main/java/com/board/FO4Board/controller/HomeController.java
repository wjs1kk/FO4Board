package com.board.FO4Board.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.FO4Board.service.BoardService;
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
	@Autowired
	private BoardService boardService;
	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		if(session.getAttribute("member_idx") == null) {
			List<Map> boardList = boardService.selectBoardList_ten();
			List<Map> popularBoardList = boardService.selectPopular();
			
			model.addAttribute("boardList",boardList);
			model.addAttribute("popularBoardList", popularBoardList);
			LocalDate now = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy년MM월dd일");
	        String formatedNow = now.format(formatter);
	        model.addAttribute("today", formatedNow);
	        
	        String dayOfWeek = now.getDayOfWeek().toString();
	        model.addAttribute("dayOfWeek",dayOfWeek);
			return "index";
		}
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		List<TodoVO> todoList = todoService.selectTodo(member_idx);	
		model.addAttribute("todoList",todoList);
		List<Map> popularBoardList = boardService.selectPopular();
		List<Map> boardList = boardService.selectBoardList_ten();
		model.addAttribute("boardList",boardList);
		model.addAttribute("popularBoardList", popularBoardList);
		LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy년MM월dd일");
        String formatedNow = now.format(formatter);
        model.addAttribute("today", formatedNow);
        String dayOfWeek = now.getDayOfWeek().toString();
        model.addAttribute("dayOfWeek",dayOfWeek);
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
			session.setAttribute("member_name", member.getName());
			System.out.println(session.getAttribute("member_name"));
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
	@PostMapping("memberEmailCheck")
	public void memberEmailCheck(@RequestParam(defaultValue = "") String email, HttpServletResponse response) {
		try {
			// 사용중인 member_email이 없으면 view페이지로 true 있으면 false를 보냄!
			String member_email = memberService.memberEmailCheck(email);
			System.out.println(email);
			if(member_email == null) {
				response.getWriter().print("true");
			}else {
				response.getWriter().print("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@PostMapping("memberNameCheck")
	public void memberNameCheck(@RequestParam(defaultValue = "") String name, HttpServletResponse response) {
		try {
			String member_name = memberService.memberNameCheck(name);
			System.out.println(member_name);
			if(name == null) {
				response.getWriter().print("true");
			}else {
				response.getWriter().print("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
