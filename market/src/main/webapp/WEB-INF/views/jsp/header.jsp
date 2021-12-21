<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
    
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?ver=1.1 " >
   <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css?ver=1.1 ">  --%>
   <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Kirang+Haerang&family=Single+Day&display=swap" rel="stylesheet">
</head>


<body>
    <header>
    <nav class="headernav">
        <div class = "header_img_div">
            <img class="fixed-logo" alt="당근마켓" onclick="mainlogo()" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-24b18257ac4ef693c02233bf21e9cb7ecbf43ebd8d5b40c24d99e14094a44c81.svg" onclick="http://localhost:8181/main">
        </div>
        <section class="header_section" >
            <input id="search" type="text" placeholder="동네 이름, 물품명등을 검색해보세요!">
            <button id="searchbtn">
                <img src="https://cdn-icons-png.flaticon.com/512/482/482631.png">
            </button>

        </section>
        <nav>
            <div class="header_chatting_div">
               <div>
                  <form name="formm" method="post" action="/chat">
                     <input name="user1" id="loginMemberno" type="text"
                        value="${sessionScope.memberVO.memberno}" style="display: none;">
                     <%--                           <input class="header_chatting_btn" type="submit"  value="당근채팅 ${sessionScope.memberVO.cnt }" >
 --%>
                     <c:choose>
                        <c:when test="${sessionScope.memberVO==null}">
                           <a class="header_chatting_btn" href="/login"> <span>당근채팅</span>
                              <span class="header_chatting_btn_cnt">${sessionScope.memberVO.cnt }</span>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a class="header_chatting_btn" onclick="chatsubmit()"> <span>당근채팅</span>
                              <span class="header_chatting_btn_cnt">${sessionScope.memberVO.cnt }</span>
                           </a>
                        </c:otherwise>
                     </c:choose>

                  </form>
               </div>
               <c:choose>
                  <c:when test="${sessionScope.memberVO==null}">
                     <div>
                        <input class="header_login_btn" type="button" value="로그인"
                           onclick="loginform()">
                     </div>
                  </c:when>
                  <c:otherwise>
                     <div class="header_login_div">
                        <img class="header_login_div_profile"
                           src="http://cjhftp.dothome.co.kr/${sessionScope.memberVO.memberno}/profile/${sessionScope.memberVO.profile}"
                           
                           onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';">
                           <!-- src="http://cjhftp.dothome.co.kr/'+jbSplit[2]+'/profile/'+$("#profilename").val()+  -->
                        <span>${sessionScope.memberVO.name}</span>
                        <!--  <img class="header_login_div_down"  src="https://cdn-icons.flaticon.com/png/512/2985/premium/2985150.png?token=exp=1637135271~hmac=3f62a84e9d5a4112839b78e572418d09" > -->
                     </div>
                  </c:otherwise>
               </c:choose>

            </div>
         </nav>
        <script>
          function mainlogo(){
             location.href = "/main";
          }
           function loginform(){
              location.href = "/login";
           }
           function chatform(){
              console.log($("#Loginmemberno").val());
             location.href = "/chat";
           }
           function chatsubmit(){
              document.formm.submit();
           }
           

           $(document).ready(function() {
              
             
              
               //search에서 키를 누를떄
               $("#search").keydown(function(key) {
                   //해당하는 키가 엔터키(13) 일떄
                   if (key.keyCode == 13) {
                       //searchbtn를 클릭해준다.
                       searchbtn.click();
                   }
               });
               
               $("#searchbtn").click(function() {
                  var searchData = $("#search").val();  

                  $.ajax({
                       url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(searchData),
                       type:'GET',
                       headers: {'Authorization' : 'KakaoAK a748acc709f6bb26bfb1e237f62fb4f0'},
                        success:function(data){
                            console.log(data.documents.length);
                              location.href = "/searchboard?count="+data.documents.length+"&searchData="+searchData+"&firstvalue=0&lastvalue=6";                   
                        },
                        error : function(e){
                            console.log(e);
                        }
                   });
               })
           });    
           
           
        </script>
      



</nav>
      </header>