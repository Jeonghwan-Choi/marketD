package com.spring.market.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.market.impl.MemberService;
import com.spring.market.vo.MemberVO;

@Controller

public class LoginController {

	@Autowired
	MemberService memberService;

	@RequestMapping("/loginMember")
	public String loginMember(HttpServletRequest req, Model model, MemberVO vo) throws IllegalStateException {


		
		MemberVO member = memberService.loginMember(vo);

		HttpSession session = req.getSession();
		session.setAttribute("memberVO", member);
		session.setAttribute("loginM", member.getMemberno());
		return "redirect:/main";
	}
	
	@RequestMapping("/checkMember")
	@ResponseBody
	public String checkMember(HttpServletRequest req, Model model, MemberVO vo,String Email,String Password) throws IllegalStateException {


		vo.setEmail(Email);
		
		
		MemberVO member = memberService.loginMember(vo);
		
		if(member.getPassword().equals(Password)) {
			System.out.println("비밀번호 일치");
			return "Coincide";
		}else {
			System.out.println("비밀번호 불일치");
			return "Inconsistent";
		}

	
		
	}
	



}