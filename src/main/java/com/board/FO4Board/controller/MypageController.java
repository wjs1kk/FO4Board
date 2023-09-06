package com.board.FO4Board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.FO4Board.service.BoardService;
import com.board.FO4Board.service.MemberService;
import com.board.FO4Board.service.MypageService;
import com.board.FO4Board.vo.PageVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private BoardService boardService;
	
	@GetMapping("mypage/main")
	public String mypage_main(HttpSession session, Model model) {
		if(session.getAttribute("member_idx") == null) {
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			return "fail_back";
		}
		Map member = memberService.selectUser_idx(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))));
		model.addAttribute("member",member);
		return "mypage/mypage-main";
	}
	@PostMapping("mypage/updatePro")
	public String mypage_updatePro(HttpSession session, String name, String email, Model model) {
		if(session.getAttribute("member_idx") == null) {
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			return "fail_back";
		}
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		String nameCheck = memberService.memberNameCheck(name);
		if(nameCheck != null) {
			model.addAttribute("msg", "중복된 닉네임 입니다.");
			return "fail_back";
		}
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
			model.addAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
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
	public String withDrawal(HttpSession session, Model model) {
		if(session.getAttribute("member_idx") == null) {
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			return "fail_back";
		}
		int member_idx = Integer.parseInt(String.valueOf(session.getAttribute("member_idx")));
		mypageService.deleteMember(member_idx);
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("mypage/heart")
	public String mypageHeart(HttpSession session, Model model,  PageVO pageVO, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = mypageService.heartCount(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))));
	    if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
	    pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    model.addAttribute("paging",pageVO);
		List<Map> selectHeartList = mypageService.selectHeartList(Integer.parseInt(String.valueOf(session.getAttribute("member_idx"))), pageVO);
		
		
		model.addAttribute("selectHeartList", selectHeartList);
		
		return "mypage/mypage-heart-list";
	}
	
}
