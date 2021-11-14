package com.spring.market.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.impl.BoardService;
import com.spring.market.impl.ImageService;
import com.spring.market.impl.MemberService;
import com.spring.market.vo.ImageVO;
import com.spring.market.vo.MemberVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ImageService imageService;
	
	@RequestMapping("/board.com")
	public String boardInfo(HttpServletRequest req, Model model) throws IllegalStateException, ParseException {
		System.out.println("run BoardController boardInfo()");
		model.addAttribute("boardInfo", boardService.boardInfo(2));
		
		//게시물 등록 시간
		String from = boardService.boardInfo(2).getDateTime();
		Date format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(from);
		//현재시간
		Date time = new Date();
		long diffHor = (time.getTime()-format1.getTime())/3600000;
		System.out.println(diffHor);
		model.addAttribute("diffHor", diffHor);
		
		
		MemberVO memberVO = memberService.memberInfo(25);
		model.addAttribute("memberInfo", memberVO);
		
		List<ImageVO> boardImages = imageService.boardImages(2);
		List<ImageVO> list = new ArrayList<ImageVO>();
		for(int i = 0; i<boardImages.size();i++) {
			list.add(boardImages.get(i));
		}
		model.addAttribute("boardImages", list);
		
		return "/jsp/board";
	}

}
