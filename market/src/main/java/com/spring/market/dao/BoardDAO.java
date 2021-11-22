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
}