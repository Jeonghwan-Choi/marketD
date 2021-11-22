package com.spring.market.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.impl.BoardService;
import com.spring.market.vo.BoardVO;



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
	@Autowired
	BoardService boardService;

	@RequestMapping("/main")
	public String MainIndex(HttpServletRequest req, Model model, BoardVO vo) throws IllegalStateException {
	
		model.addAttribute("productList", boardService.boardList());
				
		return "/jsp/main";
	}
	
	
//	@RequestMapping("/test")
//	@ResponseBody
//	public String test(HttpServletRequest req, Model model,MultipartHttpServletRequest mtfRequest) throws Exception{
//		List<MultipartFile> fileList = mtfRequest.getFiles("input-image");
//
//		FtpClient client = new FtpClient("112.175.184.60", 21, "cjhftp", "chlwjdghks1!");
//		
//        for (MultipartFile mf : fileList) {
//        	
//    		String str1 = mf.getContentType();
//    		String getStr1[] = str1.split("/");
//    		String itype = getStr1[1];
//    		
//        	File p123 = File.createTempFile(mf.getInputStream().toString(),"."+itype);
//        	IOUtils.copy(mf.getInputStream(),new FileOutputStream(p123));
//        	client.upload(p123,"html/2021-11-16");
//        	
//        	
//		}
//		
//		return "suc";
//	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req, Model model) throws IllegalStateException {
		HttpSession session=req.getSession();
		session.invalidate();
				
		return "/jsp/login";
	}

}
