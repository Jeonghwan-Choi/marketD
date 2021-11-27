package com.spring.market.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.dao.ChatDAO;
import com.spring.market.vo.ChatVO;


@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;

	@Override
	public List<ChatVO> myChatList(ChatVO vo) {
		System.out.println("run ChatServiceImpl myChatList()");
		return chatDAO.myChatList(vo);
	}

	@Override
	public List<ChatVO> selectChatList(ChatVO vo) {
		System.out.println("run ChatServiceImpl selectChatList()");
		return chatDAO.selectChatList(vo);
	}

	@Override
	public void insertMessage(ChatVO vo) {
		System.out.println("run ChatServiceImpl insertMessage()");
		chatDAO.insertMessage(vo);
	}

	@Override
	public void updateReadst(ChatVO vo) {
		System.out.println("run ChatServiceImpl updateReadst()");
		chatDAO.updateReadst(vo);
	}

	@Override
	public List<ChatVO> myChatListNotRead(int seller) {
		System.out.println("run ChatServiceImpl myChatListNotRead()");
		return chatDAO.myChatListNotRead(seller);		
	}


}
