package com.spring.market.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.market.vo.MemberVO;



@Repository
public class MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	public List<MemberVO> memberList() {
		System.out.println("run MemberDAO memberList()");
		return sqlSession.selectList("MemberDAO.memberList");
	}
	public MemberVO memberInfo(int memberno) {
		System.out.println("run MemberDAO memberInfo()");
		return sqlSession.selectOne("MemberDAO.memberInfo",memberno);
	}

}
