package com.spring.market.impl;


import java.util.List;

import com.spring.market.vo.BoardVO;
import com.spring.market.vo.MemberVO;

public interface BoardService {
   void insertBoard(BoardVO vo);
   BoardVO firstBoardno(int memberno);
   List<BoardVO> boardList();
   void insertGuest(BoardVO vo);
   void addwish(BoardVO vo);

   BoardVO boardquery(int boardno);
   List<BoardVO> addressSearchData(BoardVO vo);
   List<BoardVO> productSearchData(BoardVO vo);
   int wishcount(BoardVO vo);
   int guestnochk(BoardVO vo);
   int guestcountchk(BoardVO vo);   
   BoardVO chkchatroom(int boardno);
}