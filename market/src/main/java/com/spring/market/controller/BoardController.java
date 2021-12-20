package com.spring.market.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.market.dao.FtpClient;
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
	public String boardInfo(HttpServletRequest req, Model model,int boardno,int memberno) throws IllegalStateException, ParseException {
		System.out.println("run BoardController boardInfo()");

		
		BoardVO bo =boardService.boardquery(boardno); 
		
		model.addAttribute("board",bo );
		
		List<ImageVO> boardImages = imageService.boardImages(boardno);
		model.addAttribute("boardImages", boardImages);
	
//		//인기중고
		model.addAttribute("productList", boardService.boardList());
		
		return "/jsp/board";
	}
	
	@RequestMapping("/insertBoardForm")
	public String insertBoardForm(HttpServletRequest req, Model model) throws IllegalStateException, ParseException {
		
		return "/jsp/insertBoard";
	}
	@RequestMapping("/chkchatroom")
	@ResponseBody
	public int chkchatroom(HttpServletRequest req, Model model,BoardVO vo) throws IllegalStateException, ParseException {
		int chatroomno = boardService.chkchatroom(vo).getChatroomno();
		return chatroomno;
	}
	@RequestMapping("/insertBoard")
	public String insertBoard(HttpServletRequest req, Model model,BoardVO vo,MultipartHttpServletRequest mtfRequest) throws Exception {
		System.out.println("run BoardController insertBoard()");

		 
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		int  price = Integer.parseInt(req.getParameter("price"));
		String content=req.getParameter("content");
		int memberno = Integer.parseInt(req.getParameter("memberno"));
	
		System.out.println(title);		
		System.out.println(content);	
		
		
		vo.setTitle(title);
		vo.setCategory(category);
		vo.setPrice(price);
		vo.setContent(content);
		vo.setMemberno(memberno);
		
		boardService.insertBoard(vo);	

		int boardno = boardService.firstBoardno(memberno).getBoardno();
		
		List<MultipartFile> fileList = mtfRequest.getFiles("input_imgs");

		FtpClient client = new FtpClient("112.175.184.60", 21, "cjhftp", "chlwjdghks1!");
        for (MultipartFile mf : fileList) {
        	
    		String str1 = mf.getContentType();
    		String getStr1[] = str1.split("/");
    		String itype = getStr1[1];
    		
        	File p123 = File.createTempFile(mf.getInputStream().toString(),"."+itype);
        	IOUtils.copy(mf.getInputStream(),new FileOutputStream(p123));
        	client.boardUpload(p123,"html/"+memberno+"/board/"+boardno,memberno,boardno);

    		ImageVO imageVO = new ImageVO();
    		
    		imageVO.setBoardno(boardno);
    		imageVO.setMemberno(memberno);
        	imageVO.setImagename(p123.getName());
    		imageVO.setImageindex(fileList.indexOf(mf)+1);
    		
    		imageService.insertBoardImage(imageVO);
    		
    		
		}
        
        //main이동
		model.addAttribute("productList", boardService.boardList());
		
		return "/jsp/main";
	}
	
	@RequestMapping("/insertBoardImage")
	//public String insertBoardImage(HttpServletRequest req, Model model,MultipartHttpServletRequest mtfRequest) throws Exception {
		public String insertBoardImage(HttpServletRequest req, Model model,MultipartHttpServletRequest mtfRequest) throws Exception{
		System.out.println("run BoardController insertBoardImage()");
		
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String  price = req.getParameter("price");
		String content=req.getParameter("name");
		
		
		ImageVO vo = new ImageVO();
		List<MultipartFile> fileList = mtfRequest.getFiles("input_imgs");

		FtpClient client = new FtpClient("112.175.184.60", 21, "cjhftp", "chlwjdghks1!");
		
        for (MultipartFile mf : fileList) {
        	
    		String str1 = mf.getContentType();
    		String getStr1[] = str1.split("/");
    		String itype = getStr1[1];
    		
        	File p123 = File.createTempFile(mf.getInputStream().toString(),"."+itype);
        	IOUtils.copy(mf.getInputStream(),new FileOutputStream(p123));
        	//client.upload(p123,"html/");
        	
        	vo.setImagename(p123.getName());
    		imageService.insertBoardImage(vo);
		}
		
		
		
		
		
		return "/jsp/board";
	}
	
	@RequestMapping("/addwish")
	@ResponseBody
	public void addwish(HttpServletRequest req, Model model,BoardVO vo) throws Exception {
		boardService.addwish(vo);
		 
	}
	@RequestMapping("/wishcount")
	@ResponseBody
	public int wishcount(HttpServletRequest req, Model model,BoardVO vo) throws Exception {
		
		int num = boardService.wishcount(vo);
		return num;
		 
	}
	@RequestMapping("/wishchk")
	@ResponseBody
	public int wishchk(HttpServletRequest req, Model model,MemberVO vo) throws Exception {
		return memberService.wishchk(vo).getWishno();
		
	}
	@RequestMapping("/deleteWish")
	@ResponseBody
	public void deleteWish(HttpServletRequest req, Model model,MemberVO vo) throws Exception {
		memberService.deleteWish(vo);
	}
	@RequestMapping("/guestnochk")
	@ResponseBody
	public int guestnochk(HttpServletRequest req, Model model,BoardVO vo) throws Exception {
		int num = boardService.guestnochk(vo);
		return num;
	}
	@RequestMapping("/insertGuest")
	@ResponseBody
	public void insertGuest(HttpServletRequest req, Model model,BoardVO vo) throws Exception {
		boardService.insertGuest(vo);
	}
	@RequestMapping("/guestcountchk")
	@ResponseBody
	public int guestcountchk(HttpServletRequest req, Model model,BoardVO vo) throws Exception {
		int num = boardService.guestnochk(vo);
		return num;
	}
	
	 @RequestMapping("/searchboard")
	   public String searchboard(HttpServletRequest req, Model model,BoardVO vo,int count,String searchData,int firstvalue, int lastvalue) throws IllegalStateException, ParseException {
		   
		   System.out.println(count);
		   vo.setSearchdata(searchData);
		   vo.setFirstvalue(firstvalue);
		   vo.setLastvalue(lastvalue);
		   if(count == 0) {
			//0이면 주소가 없다는 상황으로 판단하여 상품명으로 검색  		  
			   System.out.println("상품검색");
			   model.addAttribute("SearchBoard", boardService.productSearchData(vo));
			  
		   }else if(count != 0) {
			 //0이 아니 주소가 존재한다고 판단되어 주소로 검색
			   System.out.println("주소검색");
			   System.out.println();
			 
			   model.addAttribute("SearchBoard", boardService.addressSearchData(vo));
			  
		   }
		   model.addAttribute("searchData",searchData);
		   model.addAttribute("count",count);
		   
		   
		   
	      return "/jsp/search";
	   }
	   
	   @RequestMapping("/searchmoreboard")
	   @ResponseBody
		public List<BoardVO>  searchmoreboard(HttpServletRequest req, Model model,BoardVO vo,int count,String searchData,int firstvalue, int lastvalue) throws IllegalStateException, ParseException {
		   
		   vo.setSearchdata(searchData);
		   vo.setFirstvalue(firstvalue);
		   vo.setLastvalue(lastvalue);
		   List<BoardVO> photoVo = new ArrayList<BoardVO>();
		   
		   if(count == 0) {
			//0이면 주소가 없다는 상황으로 판단하여 상품명으로 검색  		  
			   System.out.println("상품검색");
			   photoVo = boardService.productSearchData(vo);
		   }else if(count != 0) {
			 //0이 아니 주소가 존재한다고 판단되어 주소로 검색
			   System.out.println("주소검색");		 
			   photoVo = boardService.addressSearchData(vo);
		   }
		   System.out.println("photoVo.size(): "+photoVo.size());
		   model.addAttribute("searchData",searchData);
		   model.addAttribute("count",count);

	      return photoVo;
	   }

	

}