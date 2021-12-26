package com.spring.market.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.dao.ImageDAO;
import com.spring.market.vo.ImageVO;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDAO imageDAO;
	
	@Override
	public List<ImageVO> boardImages(int boardno) {
		System.out.println("run ImageServiceImpl boardImages");
		return imageDAO.boardImages(boardno);
	}

	@Override
	public void insertBoardImage(ImageVO vo) {
		System.out.println("run ImageServiceImpl insertBoardImage");
		imageDAO.insertBoardImage(vo);
	}

}
