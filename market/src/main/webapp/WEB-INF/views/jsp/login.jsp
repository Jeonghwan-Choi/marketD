<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css?ver=1.0 "  >

</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
    <div class="login_main">
        <div>
            <img src="https://w.namu.la/s/e333e0887c17ef96c77da7c2c9b49e9d342b02f01994851f69870be0bc786b1c1757e80f7e7dd00a5a99ec605b11e55ff7a3f20867b612ecccb493f4b68112dc06b7fa51d6052af753face6bbac777be">
            <span class="login_main_p">로그인을 해주세요.</span>
        </div>
        <div class="login_content">
     	   <form method ="post" action="/loginMember" >
	            <a>이메일 : </a>&nbsp;&nbsp;
	            <input type = "text" name = "email">
	            <br>
	            <a>비밀번호 : </a>
	            <input type = "text" name = "password">
	            <br>
	            <input type= "submit" value="로그인">
            
	            <input type= "button" value="회원가입" onclick="joinform()">
	            <a  href="https://kauth.kakao.com/oauth/authorize
				?client_id=a748acc709f6bb26bfb1e237f62fb4f0
				&redirect_uri=http://localhost:8080/kakaologin
				&response_type=code">로그인</a>

	            <input type= "button" value="네이버아이디로 로그인">
            </form>

        </div>
    </div>
    

</body>

<script>

	function joinform(){
		location.href = "/join";
	}
</script>

</html>