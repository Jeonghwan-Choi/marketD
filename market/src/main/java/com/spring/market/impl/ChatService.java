package com.spring.market.impl;

import java.util.List;

import com.spring.market.vo.BoardVO;
import com.spring.market.vo.ChatVO;


public interface ChatService {
	
//	List<ChatVO> myChatList(ChatVO vo);
	void insertChatLocation(ChatVO vo);
	
	
	List<ChatVO> myChatList(ChatVO vo);
	List<ChatVO> myChatListNotRead(int seller);
	List<ChatVO> selectChatList(ChatVO vo);
	void insertMessage(ChatVO vo);
	void updateReadst(ChatVO vo);
	ChatVO chatlocationlist(int chatmember);
}