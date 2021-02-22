package com.example.demo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Member;
import com.example.demo.dto.ResultData;
import com.example.demo.service.MemberService;

@Controller
public class UsrMemberController {
	
	@Autowired
	private MemberService memberService;	
	
	
	@RequestMapping("usr/member/join")
	public String join() {		
		return "usr/member/joinForm";
	}
	
	@RequestMapping("usr/member/doJoin")
	public String doJoin(@RequestParam Map<String,Object> param) {
		memberService.doJoin(param);
		return "usr/member/joinRs";
	}
	
	@RequestMapping("usr/member/login")
	public String login() {		
		return "usr/member/loginForm";
	}
	
	@RequestMapping("usr/member/doLogin")
	public String doLogin(@RequestParam Map<String,Object> param, Model model, HttpSession session) {		
		
		Member member = memberService.getMemberByLoginId(param);
		
		if (member == null) {
			model.addAttribute("rs", new ResultData("F-1","존재하지 않는 로그인 아이디입니다.","loginId",param.get("loginId")));
			return "usr/member/loginRs";			
		}
		
		if (member.getLoginPw().equals(param.get("loginPwReal")) == false ) {
			model.addAttribute("rs",new ResultData("F-2","비밀번호가 맞지 않습니다.","loginPw",param.get("loginPw")));
			return "usr/member/loginRs";			
		}
		
		model.addAttribute("rs",new ResultData("S-1","로그인 성공", "member",member));
		session.setAttribute("loginedMemberId", member.getId());
		return "usr/member/loginRs";
	}
	
	@RequestMapping("usr/member/logout")
	public String doLogout(HttpSession session,Model model) {
		session.removeAttribute("loginedMemberId");
		model.addAttribute("rs",new ResultData("S-1","로그아웃 성공"));
		return "usr/member/logoutRs";
	}

}
