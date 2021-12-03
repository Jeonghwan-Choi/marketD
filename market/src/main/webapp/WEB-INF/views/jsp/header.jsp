<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?ver=1.1 " >
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css "> --%>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumMyeongjoYetHangul.css" rel="stylesheet">

</head>


<body>
    <header>
    <nav class="headernav">
        <div class = "header_img_div">
            <img class="fixed-logo" alt="당근마켓" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-24b18257ac4ef693c02233bf21e9cb7ecbf43ebd8d5b40c24d99e14094a44c81.svg" onclick="http://localhost:8181/main">
        </div>
        <section class="header_section" >
            <input type="text" placeholder="동네 이름, 물품명등을 검색해보세요!">
            <button>
                <img src="https://cdn-icons-png.flaticon.com/512/482/482631.png">
            </button>

        </section>
        <nav>      
            <div class="header_chatting_div">
                <div>
                	<form name="formm" method="post" action="/chat">
                		<input name="user1" id="loginMemberno" type= "text" value="${sessionScope.memberVO.memberno}">
               	 	    <input class="header_chatting_btn" type="submit"  value="당근채팅" >
                	</form>
                </div>
	              <c:choose>
			         <c:when test="${sessionScope.memberVO==null}">
			         	  <div>
			                <input class="header_chatting_btn" type="button" value="로그인" onclick="loginform()">
			               </div>
			         </c:when>
			         <c:otherwise>
			            <div class="header_login_div">
			           	  <c:choose>
			        		 <c:when test="${sessionScope.memberVO.profiletype eq 'octet-stream' }">	
			         	 		 <img class="header_login_div_profile" src="${sessionScope.memberVO.profile}">
			         	 	 </c:when>
			         	 	 <c:otherwise>
			         	 	 	<img class="header_login_div_profile" src="http://cjhftp.dothome.co.kr/${sessionScope.memberVO.memberno}/profile/${sessionScope.memberVO.profile}">
			         	 	 </c:otherwise>
			         	  </c:choose>
			              <span>${sessionScope.memberVO.name}</span>
	                      <img class="header_login_div_down"  src="https://cdn-icons.flaticon.com/png/512/2985/premium/2985150.png?token=exp=1637135271~hmac=3f62a84e9d5a4112839b78e572418d09" >
			        	</div>
			         </c:otherwise>
			      </c:choose>

            </div>
        </nav>
        <script>
        	function loginform(){
        		location.href = "/login";
        	}
        	function chatform(){
        		console.log($("#Loginmemberno").val());
       		location.href = "/chat";
        	}
        </script>




</nav>
      </header>