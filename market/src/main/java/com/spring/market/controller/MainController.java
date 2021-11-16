package com.spring.market.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String test(@RequestParam("input-image") MultipartFile uploadfile,Model model){
		String filename = null;

		//String uploadFolder = "ftp://cjhftp.dothome.co.kr/html/";
		 
		try {
		    filename = uploadfile.getOriginalFilename();
		    String directory = "E:\\test\\test2";
		    String filepath = Paths.get(directory, filename).toString();
		    System.out.println("\n파일 주소 : "+ filepath);
		    System.out.println("chk : "+filename);
		    
		    BufferedOutputStream stream =
		        new BufferedOutputStream(new FileOutputStream(new File(filepath)));
		    stream.write(uploadfile.getBytes());
		    stream.close();
		  }
		  catch (Exception e) {
		    System.out.println(e.getMessage());
		  }
		
		

//		  resp.setContentType("text/html"); // 인코딩은 필터로 적용
//
//		  // 인코딩필터 = body에 들어가는 인코딩이라 파일업로드시 인코딩과 개념 다름
//		  // 파일인코딩시 encType은 MultipartRequest의 관점 => 파일 제목등 파일과 관련이 있음
//		  String encType = "UTF-8"; // cos.jar파일의 객체 생성 시점에 넣어줌
//		  int maxFileSize = 10 * 1024 *1024; // 5MB
//
//		  // MulitpartRequest(request, 저장경로[, 최대허용크기, 인코딩캐릭터셋, 동일한 파일명 보호여부]);
//		  // 파일명보호: DefaultFileRenamePolicy => name.zip, name1.zip, ...
//
//		  // 업로드에 해당하는 부분
//		  MultipartRequest mr = new MultipartRequest(req,uploadFolder, maxFileSize, encType, new DefaultFileRenamePolicy());
//
//		  
//		  // 파일 관련 정보 추출
//		  File file01 = mr.getFile("profile"); // upload1.html의 폼태그 값
//		  System.out.println(file01); // 첨부된 파일의 전체 경로 출력
//
//		  System.out.println("업로드 완료됨");
//		  System.out.println("파일 경로 => " + file01.toString());
		  
		  
		
		return "suc";
	}

}
