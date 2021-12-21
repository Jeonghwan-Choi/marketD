package com.spring.market.impl;


import java.util.List;

import com.spring.market.vo.BoardVO;

public interface BoardService {
   void insertBoard(BoardVO vo);
   BoardVO firstBoardno(int memberno);
   List<BoardVO> boardList();
   void insertGuest(BoardVO vo);
   void addwish(BoardVO vo);

   BoardVO boardquery(int boardno);
   List<BoardVO> addressSearchData(BoardVO vo);
   List<BoardVO> productSearchData(BoardVO vo);
   BoardVO chkchatroom(BoardVO vo);
}