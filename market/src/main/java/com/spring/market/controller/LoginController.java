package com.spring.market.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.market.impl.MemberService;
import com.spring.market.vo.MemberVO;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;




@Controller

public class LoginController {
	

	
	@Autowired
	MemberService memberService;	
	
		@RequestMapping("/loginMember")
		public String loginMember(HttpServletRequest req, Model model, MemberVO vo) throws IllegalStateException {


			MemberVO member =  memberService.loginMember(vo);
			System.out.println(member.getMemberno());
			System.out.println(member.getEmail());
			//System.out.println(member.getPassword());
			
			System.out.println(member.getProfile());
			System.out.println("addresschk"+member.getAddress());
			
			HttpSession session=req.getSession();
	        session.setAttribute("memberVO", member);
	        session.setAttribute("loginM", member.getMemberno());
			
			return "redirect:/main";
		}
		

	   
	   
	   

	

}
