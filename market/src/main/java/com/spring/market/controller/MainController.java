package com.spring.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {

//	@Autowired
//	CartService CartService;
//
//	@Autowired
//	ProductService productService;
//
//	@Autowired
//	DotoryService dotoryService;
//
//	@Autowired
//	FriendService friendService;
//
//	@Autowired
//	GuestService guestService;

	@RequestMapping("/main")
	public String MainIndex(HttpServletRequest req, Model model) throws IllegalStateException {

		return "/home";
	}

}
