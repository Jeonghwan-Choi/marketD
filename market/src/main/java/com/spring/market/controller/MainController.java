package com.spring.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {



	@RequestMapping("/main")
	public String MainIndex(HttpServletRequest req, Model model) throws IllegalStateException {

		return "/jsp/main";
	}

}
