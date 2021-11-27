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
	
	/*
	 * public List<ChatVO> myChatList(ChatVO vo){
	 * System.out.println("run ChatDAO myChatList()");
	 * System.out.println("user1 = "+vo.getUser1()); return
	 * sqlSession.selectList("ChatDAO.myChatList",vo); }
	 */
	public void insertChatLocation(ChatVO vo) {
		System.out.println("run BoardDAO insertChatLocation()");
		sqlSession.update("ChatDAO.insertChatLocation",vo);
		
	}
}