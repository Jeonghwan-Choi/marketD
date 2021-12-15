package com.spring.market.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.SocketException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.market.impl.MemberService;
import com.spring.market.vo.MemberVO;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


import com.spring.market.dao.FtpClient;




@Controller

public class JoinController {
	

	
	@Autowired
	MemberService memberService;	
	
	//회원가입 페이지 이동
	@RequestMapping("/join")
	public String JoinIndex(HttpServletRequest req, Model model) throws IllegalStateException {
		model.addAttribute("email","tttt@naver.com");
		return "/jsp/join";
	}
	
	
	//ajax를 이용하여 문자메세지 전송
	   @ResponseBody
	   @RequestMapping(value = "/sendSms.do", method = RequestMethod.POST)
	     public String sendSms(HttpServletRequest request) throws Exception {

	       String api_key = "NCSWK0BQPS6ELTQQ";
	       String api_secret = 	"LQVGR9K2GJV7BOOUPP20RNGXGEYVKWSU";

	       
	       Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", request.getParameter("to"));	// 수신전화번호
		    params.put("from", "01042996019");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 	하면 됨
		    params.put("type", "SMS");
		    params.put("text", "안녕하세요 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }

	       return "suc";
	     }
	   
		@RequestMapping("/insertMember")
		public String insertMember(HttpServletRequest req, Model model, MemberVO vo,MultipartHttpServletRequest mtfRequest) throws SocketException, IOException, Exception {
   
//			//SQL insertMember
			String address = req.getParameter("member_addr");
			vo.setAddress(address);
			memberService.insertMember(vo);
			MemberVO member =  memberService.loginMember(vo);
			System.out.println(member.getMemberno());
			int memberno = member.getMemberno();
			
//			파일질라 data upload
			
		      List<MultipartFile> fileList = mtfRequest.getFiles("profileimg");
		      System.out.println(fileList.size());
		      FtpClient client = new FtpClient("112.175.184.60", 21, "cjhftp", "chlwjdghks1!");
		      
		        for (MultipartFile mf : fileList) {
		           
		          String str1 = mf.getContentType();
		          String getStr1[] = str1.split("/");
		          String itype = getStr1[1];
		          
		          System.out.println("itype:"+itype);
		          
		         
		        	  
		        	   File p123 = File.createTempFile(mf.getInputStream().toString(),"."+itype);
			           IOUtils.copy(mf.getInputStream(),new FileOutputStream(p123));
			           client.upload(p123,"html/"+memberno+"/profile",memberno);
			           System.out.println("p123:"+p123.getName());
			           
			           vo.setProfile(p123.getName());
			           vo.setProfiletype(itype);
			           vo.setMemberno(memberno);
			           
			           memberService.updateProfileImg(vo);
			          
		           
		       }
			

			
			return "redirect:/main";
		}
		
		//ajax를 이용한 이메일 중복확인
		@ResponseBody
		@RequestMapping(value = "/emailChk.do", method = RequestMethod.POST)
		public int emailChk(HttpServletRequest request, MemberVO vo, String email) throws Exception {
			MemberVO member = memberService.emailChk(email);
		    int rowcount = Integer.parseInt(member.getEmail());
		       
		    return rowcount;
		 }
	   
	   
	   
	   
	   

	

}