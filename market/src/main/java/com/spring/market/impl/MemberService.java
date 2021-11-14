package com.spring.market.impl;

import java.util.List;

import com.spring.market.vo.MemberVO;


public interface MemberService {

	List<MemberVO> memberList();
	MemberVO memberInfo(int memberno);
}
