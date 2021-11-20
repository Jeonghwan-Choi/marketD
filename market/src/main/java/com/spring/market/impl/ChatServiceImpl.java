package com.spring.market.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.dao.ChatDAO;
import com.spring.market.dao.MemberDAO;
import com.spring.market.vo.MemberVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;


}
