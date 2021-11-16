package com.spring.market.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.market.dao.FtpClient;



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

	@RequestMapping("/main.com")
	public String insertCart(HttpServletRequest req, Model model) throws IllegalStateException {

//		System.out.println("1번 /MainController main.jsp open: ");
//
//		String name = req.getParameter("name");// jsp의 name
//		String password = req.getParameter("password");
//
//		System.out.println("로그인 아이디 : " + name);
//		System.out.println("로그인 비밀번 : " + password);

		// 1번 방법

		// 2번 방법
		// 먼저 hide로 데이터 다 가져오기

		

		/*
		 * MultipartFile uploadFile = vo.getUploadFile();
		 * System.out.println("uploadFile : " + uploadFile); if(!uploadFile.isEmpty()) {
		 * // uploadFile.transferTo(new File("E:/" + fileName)); }
		 */
//		CartService.insertCart(vo);// vo의 값을 알아서 찾아준다?

//		model.addAttribute("memberList", CartService.getMemberList());
		return "/home";
	}
	
	
	@RequestMapping("/test")
	@ResponseBody
	public String test(@RequestParam("input-image") MultipartFile uploadfile,HttpServletRequest req, Model model,MultipartHttpServletRequest mtfRequest) throws Exception{
		List<MultipartFile> fileList = mtfRequest.getFiles("input-image");

		FtpClient client = new FtpClient("112.175.184.60", 21, "cjhftp", "chlwjdghks1!");
		
        for (MultipartFile mf : fileList) {
        	System.out.println(mf.getInputStream().toString());
        	
    		String str1 = mf.getContentType();
    		String getStr1[] = str1.split("/");
    		System.out.println("size:"+mf.getSize());
    		String itype = getStr1[1];
    		
        	File p123 = File.createTempFile(mf.getInputStream().toString(),"."+itype);
        	IOUtils.copy(mf.getInputStream(),new FileOutputStream(p123));
        	client.upload(p123,"html/2021-11-16");
		}
		
		return "suc";
	}

}
