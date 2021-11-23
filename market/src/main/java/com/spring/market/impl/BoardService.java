package com.spring.market.impl;


import java.util.List;

import com.spring.market.vo.BoardVO;

public interface BoardService {
	BoardVO boardInfo(int boardno);
	void insertBoard(BoardVO vo);
	BoardVO firstBoardno(int memberno);
	List<BoardVO> boardList();
	void insertGuest(BoardVO vo);
	void addwish(BoardVO vo);
	BoardVO countWish(int boardno);
	BoardVO countChat(int boardno);
	BoardVO countViews(int boardno);
}
