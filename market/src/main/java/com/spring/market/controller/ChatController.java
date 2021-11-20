package com.spring.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.impl.BoardService;
import com.spring.market.vo.BoardVO;



@Controller
public class ChatController {

//	@Autowired
//	CartService CartService;

	@Autowired
	BoardService boardService;


	

	
	@RequestMapping("/chat")
	public String chat(HttpServletRequest req, Model model) throws IllegalStateException {
		
		System.out.println(req.getParameter("boardMemberno"));
		System.out.println(req.getParameter("boardBoardno"));
		System.out.println(req.getParameter("loginMemberno"));
		
		model.addAttribute("boardMemberno",req.getParameter("boardMemberno"));
		model.addAttribute("boardBoardno",req.getParameter("boardBoardno"));
		model.addAttribute("loginMemberno",req.getParameter("loginMemberno"));
		
		
		return "/jsp/chat";
	}

}
