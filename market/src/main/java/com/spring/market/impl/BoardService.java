package com.spring.market.impl;


import com.spring.market.vo.BoardVO;

public interface BoardService {
	BoardVO boardInfo(int boardno);
	void insertBoard(BoardVO vo);
	BoardVO firstBoardno(int memberno);
}
