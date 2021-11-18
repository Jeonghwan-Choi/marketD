package com.spring.market.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		model.addAttribute("boardInfo", boardService.boardInfo(boardno));
		
		//게시물 등록 시간
		String from = boardService.boardInfo(boardno).getDatetime();
		Date format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(from);
		//현재시간
		Date time = new Date();
		long diffHor = (time.getTime()-format1.getTime())/3600000;
		System.out.println(diffHor);
		model.addAttribute("diffHor", diffHor);
		
		
		MemberVO memberVO = memberService.memberInfo(memberno);
		model.addAttribute("memberInfo", memberVO);
		
		List<ImageVO> boardImages = imageService.boardImages(boardno);
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
		
		return "redirect:/board";
	}
	
//	@RequestMapping("/firstBoardno")
//	@ResponseBody
//	public int firstBoardno(HttpServletRequest req, Model model,BoardVO vo) throws IllegalStateException, ParseException {
//		
//	}
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

}
