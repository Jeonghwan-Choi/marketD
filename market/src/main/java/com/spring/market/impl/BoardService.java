package com.spring.market.impl;


import java.util.List;

import com.spring.market.vo.BoardVO;

public interface BoardService {
	BoardVO boardInfo(int boardno);
	void insertBoard(BoardVO vo);
	BoardVO firstBoardno(int memberno);
	List<BoardVO> boardList();
	void insertGuest(BoardVO vo);
}
