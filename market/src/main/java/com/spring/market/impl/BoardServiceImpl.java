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

}
