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
   
   
   @Override
   public void insertMember(MemberVO vo) {
       memberDAO.insertMember(vo);
      
   }

   @Override
   public MemberVO emailChk(String email) {
      System.out.println("MemberServiceImpl emailChk() :" + email);
      return memberDAO.emailChk(email);
   }

   @Override
   public MemberVO loginMember(MemberVO vo) {
      System.out.println("MemberServiceImpl loginMember() :" + vo);
      return memberDAO.loginMember(vo);
   }

   @Override
   public void updateProfileImg(MemberVO vo) {
       memberDAO.updateProfileImg(vo);
   }

   @Override
   public MemberVO wishchk(MemberVO vo) {
      System.out.println("MemberServiceImpl wishchk() :" + vo);
      return memberDAO.wishchk(vo);
   }
   @Override
   public void deleteWish(MemberVO vo) {
      System.out.println("MemberServiceImpl deleteWish() :" + vo);
      memberDAO.deleteWish(vo);
   }

	@Override
	public List<MemberVO> selectuser(MemberVO mvo) {
		 System.out.println("run MemberServiceImpl memberList()");
		return memberDAO.selectuser(mvo);
	}

   
}