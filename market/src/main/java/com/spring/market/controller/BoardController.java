package com.spring.market.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.market.impl.MemberService;
import com.spring.market.vo.MemberVO;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;




@Controller

public class BoardController {
	
	@Inject
	SqlSession sqlSession;
	
	@Autowired
	MemberService memberService;	
	
	//회원가입 페이지 이동
//	@RequestMapping("/join")
//	public String JoinIndex(HttpServletRequest req, Model model) throws IllegalStateException {
//
//		return "/jsp/join";
//	}
	
	
//	//ajax를 이용하여 문자메세지 전송
//	   @ResponseBody
//	   @RequestMapping(value = "/sendSms.do", method = RequestMethod.POST)
//	     public String sendSms(HttpServletRequest request) throws Exception {
//
//	       String api_key = "NCSWK0BQPS6ELTQQ";
//	       String api_secret = 	"LQVGR9K2GJV7BOOUPP20RNGXGEYVKWSU";
//
//	       
//	       Message coolsms = new Message(api_key, api_secret);
//
//		    // 4 params(to, from, type, text) are mandatory. must be filled
//		    HashMap<String, String> params = new HashMap<String, String>();
//		    params.put("to", request.getParameter("to"));	// 수신전화번호
//		    params.put("from", "01042996019");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 	하면 됨
//		    params.put("type", "SMS");
//		    params.put("text", "안녕하세요 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
//		    params.put("app_version", "test app 1.2"); // application name and version
//
//		    try {
//		      JSONObject obj = (JSONObject) coolsms.send(params);
//		      System.out.println(obj.toString());
//		    } catch (CoolsmsException e) {
//		      System.out.println(e.getMessage());
//		      System.out.println(e.getCode());
//		    }
//
//	       return "suc";
//	     }
//	   
//		@RequestMapping("/insertMember")
//		public String insertMember(HttpServletRequest req, Model model, MemberVO vo) throws IllegalStateException {
//
//			
//			
//			System.out.println("1번 insertMember");
//
//			String email = req.getParameter("email");
//			String password = req.getParameter("password");
//			String name = req.getParameter("name");
//			String gender = req.getParameter("gender");
//			String admin = req.getParameter("admin");
//			String phone = req.getParameter("phone");
//			String address = req.getParameter("member_addr")+" "+req.getParameter("member_addr_1");
//			
//			System.out.println("email : " + email);
//			System.out.println("password : " + password);
//			System.out.println("name : " + name);
//			System.out.println("gender : " + gender);
//			System.out.println("admin : " + admin);
//			System.out.println("phone : " + phone);
//			System.out.println("address : " + address);
//
//			vo.setAddress(address);
//			
//			System.out.println("2번 insertMember");
//
//			memberService.insertMember(vo);
//
//
//			return "redirect:/main";
//		}
//		
//		//ajax를 이용한 이메일 중복확인
//		@ResponseBody
//		   @RequestMapping(value = "/emailChk.do", method = RequestMethod.POST)
//		     public int emailChk(HttpServletRequest request, MemberVO vo, String email) throws Exception {
//
////		      
////			   MemberVO loginCount = sqlSession.selectOne("MemberDAO.emailChk", email);
//		       
////		       System.out.println(email);
////
//		       MemberVO member = memberService.emailChk(email);
//		       int rowcount = Integer.parseInt(member.getEmail());
//		       System.out.println("result value : "+ member.getEmail());
//		       
//		       return rowcount;
//		     }
//	   
//	   
//	   
//	   
	   

	

}
