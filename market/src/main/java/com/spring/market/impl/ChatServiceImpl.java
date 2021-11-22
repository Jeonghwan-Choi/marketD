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


}