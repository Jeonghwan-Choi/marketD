package com.spring.market.impl;

import java.util.List;

import com.spring.market.vo.BoardVO;
import com.spring.market.vo.ChatVO;


public interface ChatService {
	
	List<ChatVO> myChatList(ChatVO vo);

}
