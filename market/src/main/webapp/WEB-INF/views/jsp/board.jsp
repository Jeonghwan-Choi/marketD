<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css?ver=1.1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   
    
    <title>coco board</title>

</head>
<body>
<div class="proudct">
        <div class="proudct_product" >
            <div class="proudct_product_div">
                <div class="proudct_product_img_div">
                <form method="post" action="/chat" name="formm" id="formm">
                   <input name="boardMemberno" id="boardMemberno" type="hidden" value="${board.memberno}">
                   <input name="boardBoardno" id="boardBoardno" type="hidden" value="${board.boardno}">
                   <input name="user1" id="loginMemberno" type="hidden" value="${sessionScope.memberVO.memberno}">
                    <input type="hidden" id="boardDatetime" value="${board.datetime }"> 
                   <input type="submit" style="background-color:transparent;  border:0px transparent solid;" value="">
                </form>
                <%-- <input type="hidden" id="wishno" value="${wishchk.wishno }"> --%>
                
                    <div class="wrapper">
                    
                    <div class="btn">
                        <a class="prev" style="text-decoration: none; cursor:pointer; font-size:50px; margin-right:10px; color:gray;">&#10094;</a>
                    </div>
                    <div class="container">
                        <ul class="slider">
                         <c:forEach items="${boardImages }" var="image">
                               <li class="item">
                                  <img class="landscape" src="http://cjhftp.dothome.co.kr/${board.memberno}/board/${board.boardno}/${image.imagename }">
                               </li>
                           </c:forEach> 
                        </ul>
                    </div>
                    <div class="btn">
                        <a class="next" style="text-decoration: none; cursor:pointer; font-size:50px; margin-left:10px; color:gray;">&#10095;</a>
                    </div>
                </div>
                    <div class="proudct_product_profile_div">
                        <div class="proudct_product_profile" >
                            <img src="http://cjhftp.dothome.co.kr/${board.memberno}/profile/${board.profile}" onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';">                      
                        </div>             
                        <div class="proudct_product_profile_name">
                            <a class="proudct_product_profile_name_name" href="user?memberno=${board.memberno }">${board.name }</a><br>
                            <a class="proudct_product_profile_name_address" >${board.address }</a>
                            <div class="wish_span">
                                <div class="wish_input" id="wish_input">
                                  <input onclick="Confirm();" type="button" value="당근채팅">
                               </div>
                               <div class="wish_div" id="wish_div">
                                    <span>
                                   <img id="wish_img" class="wish_img" src="http://cjhftp.dothome.co.kr/ico/heart.png">
                                        
                                    </span>
                               </div>
                            </div>
                           
                        </div>
                        
                    </div>
                    <div class="cr" ></div>

                    <div class= "product_detail">
                        <h1>${board.title }</h1>
                        <a class="product_detail_kinds">
                            ${board.category }
                        </a>
                        <a class="product_detail_time">
                            
                        </a><br>
                        <a class="product_detail_price">
                        
                        
                        
                        
                            ${board.price }원
                        </a><br>
                        <p class="product_detail_content">${board.content }</p>
                        <a class="product_detail_favorite" >관심 </a><a class="product_detail_favorite_1">${board.wishcount}</a>
                        <a class="product_detail_chatting" >채팅</a> <a class="product_detail_chatting" >${board.chatcount }</a>
                        <a class="product_detail_select" >조회</a> <a class="product_detail_select" >${board.viewscount }</a>
                    </div>

                </div>
                <div class="cr" ></div>
                  
            </div>
         

        </div>
       </div>   
      

       <div class="main">
        <div class="main_product_board" >
            <p>인기중고</p>
            <c:forEach items="${productList}" var="productVO">
               <div class="main_product_div">
                  <a class="main_product_div_a" href="board?boardno=${productVO.boardno }&memberno=${productVO.memberno}">
                      <img class="product_img" src="http://cjhftp.dothome.co.kr/${productVO.memberno}/board/${productVO.boardno }/${productVO.imagename}">
                      <div class="main_product_title" >${productVO.title }</div><br>
                      <div class="main_product_address">${productVO.address }</div><br>
                      <input type="hidden" value ="${productVO.memberno }">
                      <input type="hidden" value ="${productVO.boardno }">
                      <div>
                          <div class="main_product_price" >${productVO.price } 원
                              <div class="main_product_favorit">
                              
                              <img class="watch-icon" alt="Watch count" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg" >
                                  
                              </div>
                              <div class="main_product_wish">
                              
                              
                                  ${productVO.wish } 
                              </div>
                          </div>
                         
                      </div>   
                  </a>     
               </div>
         </c:forEach>

        </div>
      </div>   
      
      <footer class="footer">

      </footer>
  
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
location.href = document.referrer;
   //wish
      var memberno = document.getElementById('loginMemberno').value;
      var boardno = document.getElementById('boardBoardno').value;
   
      if(memberno != ""){
    	  $.ajax({
              url : 'wishchk',
              method : 'POST',
              data : 'memberno=' + memberno + '&boardno=' + boardno,
              type : "POST",

              success : function(data) {
                   const data1 = $.trim(data);
                   if(data1==0){
                       $("#wish_img").attr("src", "http://cjhftp.dothome.co.kr/ico/heart.png");
                   }
                   if(data1!=0){
                      $("#wish_img").attr("src", "http://cjhftp.dothome.co.kr/ico/heart2.png");
                   }

                  
           },
              error : function() {
                 alert("request error!");
              }
           }) 
      }
       
      console.log(boardDatetime);
   


   //diffHor
     var boardDatetime = document.getElementById('boardDatetime').value;
     console.log('2021/11/23 17:40');
     var boardyear = boardDatetime.substring(0,4);
     var boardmonth = boardDatetime.substring(5,7);
     var boarddate = boardDatetime.substring(8,10);
     var boardhours = boardDatetime.substring(11,13)
     var boardminutes = boardDatetime.substring(14,16);
     
   var today = new Date();   

   var year = today.getFullYear(); 
   var month = today.getMonth() + 1; 
   var date = today.getDate();  
   var hours = today.getHours(); 
   var minutes = today.getMinutes();  
   
   const date1 = new Date(boardyear,boardmonth,boarddate,boardhours,boardminutes);
   const date2 =new Date(year,month,date,hours,minutes);
   const elapsedSec = date2.getTime()-date1.getTime();
   const elapsedhour=elapsedSec/1000/60/60;
   var timehtml = ". "+(Math.round(elapsedhour))+" 시간 전";
   $(".product_detail_time").html(timehtml);
   
   /* */
   
   
    var slideWrapper = document.querySelector('.container');
    var slides = document.querySelectorAll('.item');
    var totalSlides = slides.length; // item의 갯수


    var sliderWidth = slideWrapper.clientWidth; // container의 width
    var slideIndex = 0;
    var slider = document.querySelector('.slider');

    slider.style.width = sliderWidth * totalSlides + 'px';


    function showSlides(n) {
        slideIndex = n;
        if (slideIndex == -1) {
            slideIndex = totalSlides - 1;
        } else if (slideIndex === totalSlides) {
            slideIndex = 0;
        }
        slider.style.left = -(sliderWidth * slideIndex) + 'px';
    }

    function plusSlides(n){
        showSlides(slideIndex += n);
    }
    
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    var nextBtn = document.querySelector('.next');
    var prevBtn = document.querySelector('.prev');

    nextBtn.addEventListener('click', function () {
        plusSlides(1);
    });
    prevBtn.addEventListener('click', function () {
        plusSlides(-1);
    });


   var alert = function(msg, type) {
      swal({
         title : '',
         text : msg,
         type : type,
         timer : 1500,
         customClass : 'sweet-size',
         showConfirmButton : false
      });
   }

   var confirm = function(msg, title, resvNum) {
      swal({
         title : title,
         text : msg,
         type : "warning",
         showCancelButton : true,
         confirmButtonClass : "btn-danger",
         confirmButtonText : "예",
         cancelButtonText : "아니오",
         closeOnConfirm : false,
         closeOnCancel : true
      }, function(isConfirm) {
         if (isConfirm) {
            swal('', '채팅방이 생성 되었습니다.', "success",
                  $("#formm").submit());
         }else{
             document.formm.action = "/chat";
             document.formm.submit(); 
            // swal('', '예약이 거부되었습니다.', "failed");
         }

      });
   }

   function Alert() {
      alert('gg', 'success');
   }
   function Confirm() {
      confirm('', '채팅방을 생성할까요?');
   }
   
    
    $('.wish_div').on({ 
           'click': function(){
               if(jQuery('#wish_img').attr("src")=='http://cjhftp.dothome.co.kr/ico/heart.png'){
                   $('#wish_img').attr('src','http://cjhftp.dothome.co.kr/ico/heart2.png');
                   
                   const memberno = document.getElementById('loginMemberno').value;
                   const boardno = document.getElementById('boardBoardno').value;
                   var wish = $(".product_detail_favorite_1").html
               var wishchk = $(".product_detail_favorite_1").html
               var num = parseInt(wishchk);
                   
                   $.ajax({
                       url : 'addwish',
                       method : 'POST',
                       data : 'memberno=' + memberno + '&boardno=' + boardno,
                       type : "POST",

                       success : function(data) {
                          num = num+1;
                            alert("해당 상품을 찜했습니다.")
                           
                    },
                       error : function() {
                          alert("request error!");
                       }
                    })  
                   
               }else if(jQuery('#wish_img').attr("src")=='http://cjhftp.dothome.co.kr/ico/heart2.png'){
                   $('#wish_img').attr('src','http://cjhftp.dothome.co.kr/ico/heart.png');
                   
                   const memberno = document.getElementById('loginMemberno').value;
                   const boardno = document.getElementById('boardBoardno').value;
                   
                   
                   $.ajax({
                       url : 'deleteWish',
                       method : 'POST',
                       data : 'memberno=' + memberno + '&boardno=' + boardno,
                       type : "POST",

                       success : function(data) {
                            alert("해당 상품의 찜선택을 취소했습니다.")
                           
                    },
                       error : function() {
                          alert("request error!");
                       }
                    }) 
               }           
           } 
       });
</script>
</html>