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

	public void insertMember(MemberVO vo) {
		System.out.println("run MemberDAO insertMember()");
	      sqlSession.update("MemberDAO.insertMember",vo);
		
	}
	
	public MemberVO emailChk (String email) {
		
		System.out.println("run MemberDAO emailChk()  " +email);
		return sqlSession.selectOne("MemberDAO.emailChk",email);
	}

	public MemberVO loginMember(MemberVO vo) {
		System.out.println("run MemberDAO loginMember()  " +vo);
		return sqlSession.selectOne("MemberDAO.loginMember",vo);
	}
	
	public void updateProfileImg(MemberVO vo) {
		System.out.println("run MemberDAO updateProfileImg()");
	      sqlSession.update("MemberDAO.updateProfileImg",vo);
		
	}


}
