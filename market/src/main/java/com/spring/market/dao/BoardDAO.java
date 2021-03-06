package com.spring.market.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.market.vo.BoardVO;

@Repository
public class BoardDAO {
   @Inject
   SqlSession sqlSession;
   
   public BoardVO boardInfo(int boardno){
      System.out.println("run BoardDAO boardInfo()");
      return sqlSession.selectOne("BoardDAO.boardInfo",boardno);
      
   }
   public void insertBoard(BoardVO vo) {
      System.out.println("run BoardDAO insertBoard()");
      sqlSession.update("BoardDAO.insertBoard",vo);
      
   }
   
   public BoardVO firstBoardno(int memberno) {
      System.out.println("run BoardDAO firstBoardno()");
      return sqlSession.selectOne("BoardDAO.firstBoardno",memberno);
   }
   public List<BoardVO> boardList() {
      System.out.println("run BoardDAO boardList()");
      return sqlSession.selectList("BoardDAO.boardList");
   }
   public void insertGuest(BoardVO vo) {
      System.out.println("run BoardDAO insertGuest()");
      sqlSession.update("BoardDAO.insertGuest",vo);      
   }
   public void addwish(BoardVO vo) {
      System.out.println("run BoardDAO addwish()");
      sqlSession.update("BoardDAO.addwish",vo);      
   }
   public BoardVO countWish(int boardno) {
      System.out.println("run BoardDAO countWish()");
      return sqlSession.selectOne("BoardDAO.countWish",boardno);      
   }
   public BoardVO countChat(int boardno) {
      System.out.println("run BoardDAO countChat()");
      return sqlSession.selectOne("BoardDAO.countChat",boardno);      
   }
   public BoardVO countViews(int boardno) {
      System.out.println("run BoardDAO countViews()");
      return sqlSession.selectOne("BoardDAO.countViews",boardno);      
   }
   public BoardVO boardquery(int boardno) {
      System.out.println("run BoardDAO boardquery()");
      return sqlSession.selectOne("BoardDAO.boardquery",boardno);
   }
   public List<BoardVO> addressSearchData(BoardVO vo) {
	   
	   System.out.println("run BoardDAO boardInfo()"+vo.getSearchdata());
	   return sqlSession.selectList("BoardDAO.addressSearch",vo);
   }
   public List<BoardVO> productSearchData(BoardVO vo) {
	   
	   System.out.println("run BoardDAO boardInfo()"+vo.getSearchdata());
	   return sqlSession.selectList("BoardDAO.productSearch",vo);
   }
   public BoardVO wishcount(BoardVO vo) {
	      System.out.println("run BoardDAO wishcount()");
	      return sqlSession.selectOne("BoardDAO.wishcount",vo);
	   }
   public BoardVO guestnochk(BoardVO vo) {
	      System.out.println("run BoardDAO guestnochk()");
	      return sqlSession.selectOne("BoardDAO.guestnochk",vo);
	   }
   public BoardVO guestcountchk(BoardVO vo) {
	      System.out.println("run BoardDAO guestcountchk()");
	      return sqlSession.selectOne("BoardDAO.guestcountchk",vo);
	   }
	public BoardVO chkchatroom(BoardVO vo) {
	      System.out.println("run BoardDAO chkchatroom()");
	      return sqlSession.selectOne("BoardDAO.chkchatroom",vo);
	}
}