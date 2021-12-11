<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<style>
</style>
<body>
 <header>
    <nav class="headernav">
        <div class = "header_img_div">
            <img class="fixed-logo" alt="당근마켓" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-24b18257ac4ef693c02233bf21e9cb7ecbf43ebd8d5b40c24d99e14094a44c81.svg" onclick="http://localhost:8181/main">
        </div>
        <section class="header_section" >
            <input id="search" type="text" placeholder="동네 이름, 물품명등을 검색해보세요!">
            <button id="searchbtn">
                <img src="https://cdn-icons-png.flaticon.com/512/482/482631.png">
            </button>

        </section>
        <nav>      
            
        </nav>



</nav>
      </header>
<%request.setCharacterEncoding("UTF-8"); %>
    <div class="login_main">
        <div class="login_main_header_div">
            <img class="login_main_img" src="https://w.namu.la/s/e333e0887c17ef96c77da7c2c9b49e9d342b02f01994851f69870be0bc786b1c1757e80f7e7dd00a5a99ec605b11e55ff7a3f20867b612ecccb493f4b68112dc06b7fa51d6052af753face6bbac777be">
            <span class="login_main_p">로그인을 해주세요.</span>
        </div>
        <div class="login_content">
     	   <form method ="post" action="/loginMember" >
	            <div class="email_div">이메일</div>
	            <input type = "text" class="email_input" name = "email">
	            <div class="pwd_div">비밀번호 </div>
	            <input type = "text" class="pwd_input" name = "password">
	            <br>
	            <input type= "submit" class="login_input" value="로그인">
            
	            <input type= "button" class="join_input" value="회원가입" onclick="joinform()">
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