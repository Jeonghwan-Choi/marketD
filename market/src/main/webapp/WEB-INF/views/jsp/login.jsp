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
<style>
*{  
  margin: 0;
  padding: 0;
  
}
body{
 font-family: 'NanumMyeongjoYetHangul';
 
}
header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 3;
  
  border-bottom: 3px solid rgb(243, 243, 243);
  color: rgb(240, 144, 79);
  background: white;
  font-weight: bold;
}
.login_main img{

    width: 50px;
    height: 50px;
}
.login_main_header_div{
	height:80px;
}
.login_main_p{
}
.email_div{
	margin-bottom:10px;
}
.email_input{
	margin-bottom:10px;
}
.pwd_div{
	margin-bottom:10px;
}
.pwd_input{
	margin-bottom:40px;
}
.login_input{
	width:200px;
	height:40px;
	border:none;
    background-color: rgb(240, 144, 79,0.7);
    border-radius: 5px;
    color: rgb(46, 46, 46);
}
.join_input{
	width:200px;
	height:40px;
	border:none;
    background-color: rgb(240, 144, 79,0.7);
    border-radius: 5px;
    color: rgb(46, 46, 46);
}
.header_img_div{
    margin-left: 30px;
    float: left;

    padding: 20px;
}

.header_section{
    padding: 4px;
    float: left;
    border: 1px solid rgb(216, 216, 216);
    border-radius: 3px;
    float: left;
    margin-top: 18px;
    width: 400px;
    margin-left: 40px;
}
.header_section input{
    font-size: 18px;
    border: none;
    outline: none;
    font-family: inherit;
    color: rgb(46, 46, 46);
    width: 300px;
}
.header_section input::placeholder{
    color: rgb(218, 218, 218);
    font-size: 14px;
}



.header_section button{
    border:none;
    background-color: white;
    width:40px;
    float: right;
}
.header_section img{
    width: 20px;
    padding-left: 10px;
    padding-right: 10px;

}


.search_more{
  margin-left: auto;
  margin-right: auto;
  width:991px;
  border-bottom: 1px solid rgb(223, 223, 223);
  border-left: 1px solid rgb(223, 223, 223);
  border-right: 1px solid rgb(223, 223, 223);
  text-align: center;
  border-radius: 0px 0px 20px 20px;
  height: 50px;
}
.search_more input{
  border: none;
  width: 100%;
  height: 100%;
  border-radius: 0px 0px 20px 20px;
  font-size: 16px;
  font-weight: 300;
  color: rgb(85, 85, 85);
  background-color: white;
}

.email_input{
	height: 35px;
	border:rgb(179, 177, 177) 2px solid;
	border-radius: 5px;
	width:400px;
}
.pwd_input{
	height: 35px;
	border:rgb(179, 177, 177) 2px solid;
	border-radius: 5px;
	width:400px;
}
  /* =================================================================footer */
.footer{
  
  background-color: #495057;
  height: 200px;

  width: 100%;

  position: absolute;

}

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