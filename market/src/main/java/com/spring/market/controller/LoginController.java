package com.spring.market.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.market.impl.MemberService;
import com.spring.market.vo.MemberVO;

@Controller

public class LoginController {

	@Autowired
	MemberService memberService;

	@RequestMapping("/loginMember")
	public String loginMember(HttpServletRequest req, Model model, MemberVO vo) throws IllegalStateException {

		MemberVO member = memberService.loginMember(vo);
		System.out.println(member.getMemberno());
		System.out.println(member.getEmail());
		// System.out.println(member.getPassword());

		System.out.println(member.getProfile());
		
		HttpSession session = req.getSession();
		session.setAttribute("memberVO", member);
		session.setAttribute("loginM", member.getMemberno());
		return "redirect:/main";
	}

	@RequestMapping("/kakaologin")
	public String kakaologin(HttpServletRequest req,ModelMap model,String code) throws IllegalStateException {
		System.out.println("#########" + code);
		
	

		String authorize_code = code;
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=a748acc709f6bb26bfb1e237f62fb4f0"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/kakaologin"); // 본인이 설정해 놓은 경로
			sb.append("&client_secret=IaPN81VVwJGcwou1IbXJVp94sI8xEFhY"); // 수정 할것
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<String , Object> userInfo = new HashMap<>();
        String reqURLMe = "https://kapi.kakao.com/v2/user/me HTTP/1.1";
        try {
 //       	Model  model = new Model();
            URL url = new URL(reqURLMe);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").toString();
            String profile_image = properties.getAsJsonObject().get("profile_image").toString();
            String email = kakao_account.getAsJsonObject().get("email").toString();

           
            userInfo.put("nickname", nickname);
            userInfo.put("profile_image", profile_image);
            userInfo.put("email", email);
            
           

//            model.addAttribute("userInfo",userInfo);
           

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("nickname",userInfo.get("nickname").toString());
        model.addAttribute("profile_image",userInfo.get("profile_image").toString());
        model.addAttribute("email","ttst");
        System.out.println(userInfo.get("nickname").toString());
        System.out.println(userInfo.get("profile_image").toString());
       
        

        
        
		return "/jsp/join";
	}

}
