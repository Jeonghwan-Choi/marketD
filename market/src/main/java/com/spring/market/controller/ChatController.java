package com.spring.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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


      
      model.addAttribute("boardMemberno",req.getParameter("boardMemberno"));
      model.addAttribute("boardBoardno",req.getParameter("boardBoardno"));
      model.addAttribute("loginMemberno",req.getParameter("user1"));

      int user1 = Integer.parseInt(req.getParameter("user1"));
   
      List <ChatVO> mychatList =  chatService.myChatList(vo);
   
      
      
      model.addAttribute("mychatList",mychatList);

      
      return "/jsp/chat";
   }
   
   
   @RequestMapping("/insertchatRoom")
   
   public String insertchatRoom(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {

      vo.setBoardno(Integer.parseInt(req.getParameter("boardBoardno")));
      vo.setBuyerno(Integer.parseInt(req.getParameter("user1")));
      chatService.insertChatroom(vo);
      
      vo.setUser1(Integer.parseInt(req.getParameter("boardMemberno")));
      vo.setUser2(Integer.parseInt(req.getParameter("user1")));
      chatService.insertChatmember1(vo);
      
      vo.setUser1(Integer.parseInt(req.getParameter("user1")));
      vo.setUser2(Integer.parseInt(req.getParameter("boardMemberno")));
      chatService.insertChatmember2(vo);
      
      model.addAttribute("boardMemberno",req.getParameter("boardMemberno"));
      model.addAttribute("boardBoardno",req.getParameter("boardBoardno"));
      model.addAttribute("loginMemberno",req.getParameter("user1"));

      int user1 = Integer.parseInt(req.getParameter("user1"));
   
      List <ChatVO> mychatList =  chatService.myChatList(vo);
   
      
      
      model.addAttribute("mychatList",mychatList);

      
      return "/jsp/chat";
   }
   
   @RequestMapping("/selectChat")
   @ResponseBody
   public List <ChatVO> selectChat(HttpServletRequest req,Model model,ChatVO vo,int roomno,int seller, String chatmessage, int readst,int firstvalue, int lastvalue)
		   throws Exception {

         vo.setLastvalue(lastvalue);
         vo.setFirstvalue(firstvalue);
      vo.setChatroomno(roomno);
      List<ChatVO> chatVo = chatService.selectChatList(vo);
      Collections.reverse(chatVo);
      System.out.println("========= chatVo size:: " + chatVo.size());
      
      vo.setSeller(seller);
      vo.setChatmessage(chatmessage);
      vo.setReadst(readst);
      chatService.updateReadst(vo);

   
      model.addAttribute("selectChatList", chatVo);
      return chatVo;
   }
   @RequestMapping("/searchmorechat")
   @ResponseBody
   public List <ChatVO> searchmorechat(HttpServletRequest req,Model model,ChatVO vo,int roomno,int seller, String chatmessage, int readst,int firstvalue, int lastvalue)throws Exception {
         System.out.println("run serachmorechat!");
         vo.setLastvalue(lastvalue);
         vo.setFirstvalue(firstvalue);
      vo.setChatroomno(roomno);
      List<ChatVO> chatVo = chatService.selectChatList(vo);
      
      vo.setSeller(seller);
      vo.setChatmessage(chatmessage);
      vo.setReadst(readst);
      chatService.updateReadst(vo);

   
      model.addAttribute("selectChatList", chatVo);
      return chatVo;
   }
   
   @RequestMapping("/insertMessage")
   @ResponseBody
   public String insertMessage(HttpServletRequest req,Model model,ChatVO vo,int roomno,int seller, String chatmessage, int readst)
		   throws Exception {

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
   
   @RequestMapping("/chatlocation")
   public String chatlocation(HttpServletRequest req, Model model, ChatVO vo, int user1, int user2,int chatroomno,int calendarLocationno) throws IllegalStateException {

      System.out.println(user1);
      System.out.println(user2);

      vo.setUser1(user1);
      vo.setUser2(user2);
      
      vo= chatService.selectLocationMember(vo);
      model.addAttribute("chatList",vo);
      
      vo.setLocationno(calendarLocationno);
      if(calendarLocationno!=0) {

         model.addAttribute("calendarLocation",chatService.selectCalendarLocation(vo));
      }
      
      
      return "/jsp/chatlocation";
   }
   @RequestMapping("/chatcalendar")
   public String chatcalendar(HttpServletRequest req,HttpServletResponse res, Model model, ChatVO vo) throws IllegalStateException, IOException {
      

         String title = req.getParameter("location_header_input");
         String date = req.getParameter("location_date_input");
         String coordinate = req.getParameter("coordinate");
         String content = req.getParameter("location_textarea");
         
         vo.setLocationtitle(title);
         vo.setLocationdate(date);
         vo.setLocation(coordinate);
         vo.setLocationdescription(content);
   
         chatService.insertChatLocation(vo);
         int user1 = Integer.parseInt(req.getParameter("user1"));
         int chatroomno = Integer.parseInt(req.getParameter("chatroomno"));
         vo.setSeller(user1);
         vo.setChatroomno(chatroomno);
         vo.setChatmessage("일정이 공유되었습니다.");
         vo.setReadst(1);
         
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
         String currentDate = dateFormat.format(new Date());
         
         vo.setDatetime(currentDate);
         chatService.insertLocationMessage(vo);
         model.addAttribute("locationno",vo.getLocationno());
         
         model.addAttribute("calendarList",chatService.selectCalendarList(user1));
         
         
         
         return "/jsp/chatcalendar";
   }
   
   @RequestMapping("/chatcalendarview")
   public String chatcalendarview(HttpServletRequest req, Model model, ChatVO vo) throws IllegalStateException {

      int user1 = Integer.parseInt(req.getParameter("user1"));
   
      
      model.addAttribute("calendarList",chatService.selectCalendarList(user1));
      
      
      
      return "/jsp/chatcalendar";
   }

}