package com.spring.market.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.market.vo.ChatVO;



@Repository
public class ChatDAO {
   @Inject
   SqlSession sqlSession;
   public List<ChatVO> myChatList(ChatVO vo){
      System.out.println("run ChatDAO myChatList()");
      System.out.println("user1 = "+vo.getUser1());
      return sqlSession.selectList("ChatDAO.myChatList",vo);
   }

   public List<ChatVO> selectChatList(ChatVO vo) {
      System.out.println("run ChatDAO selectChatList()");
      System.out.println("seller = "+vo.getChatroomno());
      return sqlSession.selectList("ChatDAO.SelectChatList",vo);
   }

   public void insertMessage(ChatVO vo) {
      System.out.println("run ChatDAO insertMessage()");
      sqlSession.update("ChatDAO.insertMessage",vo);
   }
   
   public void updateReadst(ChatVO vo) {
      System.out.println("run ChatDAO updateReadst()");
      sqlSession.update("ChatDAO.updateReadst",vo);
   }

   public List<ChatVO> myChatListNotRead(int seller) {
      System.out.println("run ChatDAO myChatListNotRead()");
      System.out.println("user1 = "+ seller);
      return sqlSession.selectList("ChatDAO.myChatListNotRead",seller);
   }
   
   public void insertChatLocation(ChatVO vo) {
      System.out.println("run BoardDAO insertChatLocation()");
      sqlSession.update("ChatDAO.insertChatLocation",vo);
      
   }
   public ChatVO chatlocationlist(int chatmember) {
      System.out.println("run BoardDAO chatlocationlist()");
      return sqlSession.selectOne("ChatDAO.chatlocationlist",chatmember);
      
   }
   public ChatVO selectLocationMember(ChatVO vo) {
      System.out.println("run BoardDAO selectLocationMember()");
      return sqlSession.selectOne("ChatDAO.selectLocationMember",vo);
      
   }
   
   public List<ChatVO> selectCalendarList(int user1) {
      System.out.println("run ChatDAO selectCalendarList()");
      return sqlSession.selectList("ChatDAO.selectCalendarList",user1);
   }

   public void insertLocationMessage(ChatVO vo) {
      System.out.println("run BoardDAO insertLocationMessage()");
      sqlSession.update("ChatDAO.insertLocationMessage",vo);
      
   }
   public ChatVO selectCalendarLocation(ChatVO vo) {
      System.out.println("run BoardDAO selectCalendarLocation()");
      return sqlSession.selectOne("ChatDAO.selectCalendarLocation",vo);
      
   }
   public void insertChatroom(ChatVO vo) {
         System.out.println("run ChatDAO insertChatroom()");
         sqlSession.update("ChatDAO.insertChatroom",vo);
         
      }
   public void insertChatmember1(ChatVO vo) {
            System.out.println("run ChatDAO insertChatmember1()");
            sqlSession.update("ChatDAO.insertChatmember1",vo);
            
         }
   public void insertChatmember2(ChatVO vo) {
         System.out.println("run ChatDAO insertChatmember2()");
         sqlSession.update("ChatDAO.insertChatmember2",vo);
         
      }
   
}