package com.spring.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.impl.MemberService;
import com.spring.market.vo.MemberVO;
import com.thoughtworks.qdox.parser.ParseException;



@Controller
public class MemberController {

	@Autowired
	MemberService memberService;


	
	@RequestMapping("/user")
	public String userInfo(HttpServletRequest req, Model model, int memberno)
			throws IllegalStateException, ParseException {
		System.out.println("select memberno: " + memberno);

		MemberVO mvo = new MemberVO();
		mvo.setMemberno(memberno);

		model.addAttribute("selectuser", memberService.selectuser(mvo));

		return "/jsp/user";
	}
	


}