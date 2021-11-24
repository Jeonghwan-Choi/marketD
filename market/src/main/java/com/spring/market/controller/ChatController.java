package com.spring.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.market.impl.ChatService;
import com.spring.market.vo.ChatVO;
import com.spring.market.vo.ImageVO;



@Controller
public class ChatController {



	@Autowired
	ChatService chatService;


	

	
	@RequestMapping("/chat")
	
	public String chat(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {

		System.out.println(vo.getUser1());

		model.addAttribute("boardMemberno",req.getParameter("boardMemberno"));
		model.addAttribute("boardBoardno",req.getParameter("boardBoardno"));
		model.addAttribute("loginMemberno",req.getParameter("user1"));
		
		int user1 = Integer.parseInt(req.getParameter("user1"));

		
		List <ChatVO> mychatList =  chatService.myChatList(vo);
	
		
		
		model.addAttribute("mychatList",mychatList);
		System.out.println("mychatList.size(): "+mychatList.size());
		
		
		
		return "/jsp/chat";
	}
	
	@RequestMapping("/selectChat")
	@ResponseBody
	public List <ChatVO> selectChat(HttpServletRequest req,Model model,ChatVO vo,int roomno,int seller, String chatmessage, int readst)throws Exception {

		vo.setChatroomno(roomno);
		List<ChatVO> chatVo = chatService.selectChatList(vo);
		System.out.println("========= chatVo size:: " + chatVo.size());
		
		vo.setSeller(seller);
		vo.setChatmessage(chatmessage);
		vo.setReadst(readst);
		chatService.updateReadst(vo);

	

//		for (int i = 0; i < chatVo.size(); i++) {
//
//			list.add(photoVo.get(i));
//			folder = photoVo.get(i).getFolder();
//		}
		model.addAttribute("selectChatList", chatVo);
		return chatVo;
	}
	
	@RequestMapping("/insertMessage")
	@ResponseBody
	public String insertMessage(HttpServletRequest req,Model model,ChatVO vo,int roomno,int seller, String chatmessage, int readst)throws Exception {

		vo.setChatroomno(roomno);
		vo.setSeller(seller);
		vo.setChatmessage(chatmessage);
		vo.setReadst(readst);
		
		chatService.insertMessage(vo);

	

		return "msg suc";
	}
	


}
