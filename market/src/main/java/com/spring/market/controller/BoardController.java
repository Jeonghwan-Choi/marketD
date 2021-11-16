package com.spring.market.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.System.Logger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.market.impl.BoardService;
import com.spring.market.impl.ImageService;
import com.spring.market.impl.MemberService;
import com.spring.market.vo.BoardVO;
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
	
	@RequestMapping("/board")
	public String boardInfo(HttpServletRequest req, Model model) throws IllegalStateException, ParseException {
		System.out.println("run BoardController boardInfo()");
		model.addAttribute("boardInfo", boardService.boardInfo(2));
		
		//게시물 등록 시간
		String from = boardService.boardInfo(2).getDatetime();
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
	
	@RequestMapping("/insertBoardForm")
	public String insertBoardForm(HttpServletRequest req, Model model) throws IllegalStateException, ParseException {
		
		return "/jsp/insertBoard";
	}
	
	@RequestMapping("/insertBoard")
	@ResponseBody
	public int insertBoard(HttpServletRequest req, Model model,BoardVO vo) throws IllegalStateException, ParseException {
		System.out.println("run BoardController insertBoard()");
		boardService.insertBoard(vo);	
		//
		int memberno = vo.getMemberno();
		System.out.println(memberno);

		int boardno = boardService.firstBoardno(memberno).getBoardno();
		System.out.println(boardno); 
		return boardno;
	}
	
//	@RequestMapping("/firstBoardno")
//	@ResponseBody
//	public int firstBoardno(HttpServletRequest req, Model model,BoardVO vo) throws IllegalStateException, ParseException {
//		
//	}
	@RequestMapping("/insertBoardImage")
	public String insertBoardImage(HttpServletRequest req,HttpServletResponse resp, Model model,ImageVO vo) throws IllegalStateException, ParseException, IOException {
		System.out.println("run BoardController insertBoardImage()");
		imageService.insertBoardImage(vo);
		
		
		
		return "/jsp/board";
	}

}
