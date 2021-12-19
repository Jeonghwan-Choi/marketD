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
   
   @Override
   public BoardVO boardquery(int boardno) {
      System.out.println("run BoardServiceImpl boardquery()");
      return boardDAO.boardquery(boardno);
   }
   
	@Override
	public List<BoardVO> addressSearchData(BoardVO vo) {
		 System.out.println("run BoardServiceImpl addressSearchData()");
		  return boardDAO.addressSearchData(vo);
	}
	@Override
	public List<BoardVO> productSearchData(BoardVO vo) {
		 System.out.println("run BoardServiceImpl productSearchData()");
		  return boardDAO.productSearchData(vo);
	}
	@Override
	public int wishcount(BoardVO vo) {
		System.out.println("run BoardServiceImpl wishcount()");
	      return boardDAO.wishcount(vo).getWishcount();
	}
	@Override
	public int guestnochk(BoardVO vo) {
		System.out.println("run BoardServiceImpl guestnochk()");
	      return boardDAO.guestnochk(vo).getGuestno();
	}
	@Override
	public int guestcountchk(BoardVO vo) {
		System.out.println("run BoardServiceImpl guestcountchk()");
		return boardDAO.guestcountchk(vo).getGuestno();
	}
	@Override
	public BoardVO chkchatroom(int boardno) {
		 System.out.println("run BoardServiceImpl chkchatroom()");
		  return boardDAO.chkchatroom(boardno);
	}
}