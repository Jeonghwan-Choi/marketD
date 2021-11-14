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
	
	public List<BoardVO> boardList() {
		System.out.println("run BoardDAO boardList()");
		return sqlSession.selectList("BoardDAO.boardList");
	}




}
