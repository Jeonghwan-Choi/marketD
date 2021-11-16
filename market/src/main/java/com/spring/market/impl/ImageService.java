package com.spring.market.impl;


import java.util.List;

import com.spring.market.vo.ImageVO;

public interface ImageService {
	List<ImageVO> boardImages(int boardno);
	void insertBoardImage(ImageVO vo);
}
