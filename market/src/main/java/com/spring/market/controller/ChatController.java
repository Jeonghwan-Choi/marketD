package com.spring.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.impl.ChatService;
import com.spring.market.vo.ChatVO;
import com.spring.market.vo.ImageVO;



@Controller
public class ChatController {



	@Autowired
	ChatService chatService;


	@RequestMapping("/chatlocation")
	public String chatlocation(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {
		return "/jsp/chatlocation";
	}
	@RequestMapping("/chatcalendar")
	public String chatcalendar(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {
		return "/jsp/chatcalendar";
	}
	
	@RequestMapping("/chat")
	public String chat(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {

		System.out.println(vo.getUser1());

		model.addAttribute("boardMemberno",req.getParameter("boardMemberno"));
		model.addAttribute("boardBoardno",req.getParameter("boardBoardno"));
		model.addAttribute("loginMemberno",req.getParameter("user1"));
		
		int user1 = Integer.parseInt(req.getParameter("user1"));

		
		//List <ChatVO> mychatList =  chatService.myChatList(vo);
	
		
		
		//model.addAttribute("mychatList",mychatList);
		//System.out.println("mychatList.size(): "+mychatList.size());
		
		
		
		return "/jsp/chat";
	}

}