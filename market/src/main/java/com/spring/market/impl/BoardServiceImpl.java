package com.spring.market.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.dao.BoardDAO;
import com.spring.market.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	@Override
	public BoardVO boardInfo(int boardno) {
		System.out.println("run BoardServiceImpl boardInfo()");
		return boardDAO.boardInfo(boardno);
	}
	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("run BoardServiceImpl insertBoard()");
		boardDAO.insertBoard(vo);
	}
	@Override
	public BoardVO firstBoardno(int memberno) {
		System.out.println("run BoardServiceImpl firstBoardno(memberno)");
		return boardDAO.firstBoardno(memberno);
	}

	@Override
	public List<BoardVO> boardList() {
		System.out.println("run BoardServiceImpl boardList()");
		return boardDAO.boardList();
	}
	@Override
	public void insertGuest(BoardVO vo) {
		System.out.println("run BoardServiceImpl insertGuest()");
		boardDAO.insertGuest(vo);
	}
	@Override
	public void addwish(BoardVO vo) {
		System.out.println("run BoardServiceImpl addwish()");
		boardDAO.addwish(vo);
		
	}
	
}
