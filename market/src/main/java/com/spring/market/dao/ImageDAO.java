package com.spring.market.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.market.vo.ImageVO;

@Repository
public class ImageDAO {
	@Inject
	SqlSession sqlSession;
	
	public List<ImageVO> boardImages(int boardno){
		System.out.println("run ImageDAO boardImages()");
		return sqlSession.selectList("ImageDAO.boardImages",boardno);
		
	}

}
