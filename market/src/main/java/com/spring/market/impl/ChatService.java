package com.spring.market.impl;

import java.util.List;

import com.spring.market.vo.ChatVO;


public interface ChatService {
	
	List<ChatVO> myChatList(ChatVO vo);
	List<ChatVO> selectChatList(ChatVO vo);
	void insertMessage(ChatVO vo);
}
