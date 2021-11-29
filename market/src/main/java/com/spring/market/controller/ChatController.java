package com.spring.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/notReadSelectChat")
	@ResponseBody
	public List <ChatVO> notReadSelectChat(HttpServletRequest req,Model model,ChatVO vo,int seller)throws Exception {

		vo.setSeller(seller);
		List<ChatVO> chatVo = chatService.myChatListNotRead(seller);
		System.out.println("========= chatVo size:: " + chatVo.size());

		return chatVo;
	}
	@RequestMapping("/allReadSelectChat")
	@ResponseBody
	public List <ChatVO> allReadSelectChat(HttpServletRequest req,Model model,ChatVO vo,int seller)throws Exception {

		vo.setUser1(seller);
		List<ChatVO> chatVo = chatService.myChatList(vo);
		System.out.println("========= chatVo size:: " + chatVo.size());

		return chatVo;
	}
	
//	cjh


	@RequestMapping("/chatlocationlist")
	@ResponseBody
	public ChatVO chatlocationlist(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {
//		int memberno = Integer.parseInt(req.getParameter("memberno"));
//		int loginmemberno = Integer.parseInt(req.getParameter("loginmemberno"));
//		vo.setUser1(loginmemberno);
//		vo.setChatmember(memberno);
		//System.out.println("memberno:"+req.getParameter("memberno"));
		
//	HttpSession session=req.getSession();
//	int loginmemberno = (int) session.getAttribute("loginM");
//	System.out.println(loginmemberno);
//		
//		int chatmember = Integer.parseInt(req.getParameter("chatmember"));
//		vo.setChatmember(chatmember);
//		System.out.println("chatmember::controller"+chatmember);
		
		//int loginmemberno = Integer.parseInt(req.getParameter("loginmemberno"));
		//int boardMemberno = Integer.parseInt(req.getParameter("boardMemberno"));
		//vo.setUser1(loginmemberno);
		//vo.setUser2(boardMemberno);
		vo = chatService.chatlocationlist(vo);
		model.addAttribute("chatList",vo);
		return vo;
		//return "/jsp/chatlocation";
	}
	
	@RequestMapping("/chatlocation")
	public String chatlocation(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {

		int chatmember = vo.getChatmember();
		vo = chatService.chatlocationlist(vo);
		model.addAttribute("chatList",vo);
		return "/jsp/chatlocation";
	}
	@RequestMapping("/chatcalendar")
	public String chatcalendar(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {
		
		String title = req.getParameter("location_header_input");
		String date = req.getParameter("location_date_input");
		String coordinate = req.getParameter("coordinate");
		String content = req.getParameter("location_textarea");
		
		vo.setLocationtitle(title);
		vo.setLocationdate(date);
		vo.setLocation(coordinate);
		vo.setLocationdescription(content);
		
		chatService.insertChatLocation(vo);
		
		
		
		
		return "/jsp/chatcalendar";
	}

}