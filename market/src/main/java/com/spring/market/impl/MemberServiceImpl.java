package com.spring.market.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.dao.MemberDAO;
import com.spring.market.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> memberList() {
		System.out.println("run MemberServiceImpl memberList()");
		return memberDAO.memberList();
	}

	@Override
	public MemberVO memberInfo(int memberno) {
		System.out.println("run MemberServiceImpl memberInfo()");
		return memberDAO.memberInfo(memberno);
	}

}
