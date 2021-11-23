package com.spring.market.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.market.vo.BoardVO;
import com.spring.market.vo.ChatVO;



@Repository
public class ChatDAO {
	@Inject
	SqlSession sqlSession;
	
	public List<ChatVO>  myChatList(ChatVO vo){
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

}
