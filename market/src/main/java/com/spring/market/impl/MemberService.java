package com.spring.market.impl;

import java.util.List;

import com.spring.market.vo.MemberVO;


public interface MemberService {

   List<MemberVO> memberList();
   
   MemberVO memberInfo(int memberno);
   

   void insertMember(MemberVO vo);
   MemberVO emailChk(String email);
   MemberVO loginMember(MemberVO vo);
   void updateProfileImg(MemberVO vo);
   MemberVO wishchk(MemberVO vo);
   void deleteWish(MemberVO vo);
   
   List<MemberVO> selectuser(MemberVO mvo);
}