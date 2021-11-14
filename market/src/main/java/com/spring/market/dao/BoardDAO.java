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

}
