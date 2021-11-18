package com.spring.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.impl.BoardService;
import com.spring.market.vo.BoardVO;



@Controller
public class MainController {

	@Autowired
	BoardService boardService;	

	@RequestMapping("/main")
	public String MainIndex(HttpServletRequest req, Model model, BoardVO vo) throws IllegalStateException {
	
		model.addAttribute("productList", boardService.boardList());
				
		return "/jsp/main";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req, Model model) throws IllegalStateException {

				
		return "/jsp/login";
	}
	@RequestMapping("/ttst")
	public String ttst(HttpServletRequest req, Model model) throws IllegalStateException {

				
		return "/jsp/socket";
	}


}
