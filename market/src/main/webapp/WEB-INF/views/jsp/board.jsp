<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css ">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        ul{
            list-style:none;
        }
        .wrapper{
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2;
        }
        .container{
            width:600px;
            height:400px;
            position: relative;
            background-color: antiquewhite;
            overflow: hidden;
        }
        .slider{
            display: flex;
            position:absolute;
            top:0;
            left:0;
        }
        .item{
            width:100%;
            height:400px;
            font-size: 35px;
            text-align: center;
        }
        .item img{
        	width:100%;
            height:400px;
        }
        

        .container ul{
           /* -webkit-transition: all 0.25s cubic-bezier(1, .01, .32, 1);*/  /* 제조사마다 접두사를 붙여야 한다. 파이어폭스는 -moz-, 웹킷계열은 -webkit-, 오페라는 -o-라고 앞에 붙여주어야 한다. */
           /* -o-transition: all 0.25s cubic-bezier(1, .01, .32, 1);*/
            transition: all 0.25s cubic-bezier(1, .01, .32, 1);
        }
    </style>
    
    <title>coco board</title>

</head>
<body>
<%@ include file = "header.jsp"%>
<main class="proudct">
        <div class="proudct_product" >
            <div class="proudct_product_div">
                <div class="proudct_product_img_div">
                <form id="formm" method="post" action="/chat" name="formm">
	                <input name="boardMemberno" type="text" value="${BoardMemberno}">
	                <input name="boardBoardno" type="text" value="${BoardBoardno}">
	                <input name="user1" type="text" value="${sessionScope.memberVO.memberno}">
	                <input type = "submit">
                </form>
                    <div class="wrapper">
                    
				        <div class="btn">
				            <a class="prev" style="text-decoration: none; cursor:pointer; font-size:50px; margin-right:10px; color:gray;">&#10094;</a>
				        </div>
				        <div class="container">
				            <ul class="slider">
					             <c:forEach items="${boardImages}" var="boardImages" varStatus="status">
					                <li class="item">
					                	<img class="landscape" src="http://cjhftp.dothome.co.kr/${boardImages.memberno}/board/${boardImages.boardno }/${boardImages.imagename}">
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
                            <img  src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png">                      
                        </div>             
                        <div class="proudct_product_profile_name">
                            <a class="proudct_product_profile_name_name">${memberInfo.name }</a><br>
                            <a class="proudct_product_profile_name_address" >${memberInfo.address }</a>
                        	<input style="float: right;" onclick="Confirm();" type="button" value="당근채팅">
                        </div>
                        
                    </div>
                    <div class="cr" ></div>

                    <div class= "product_detail">
                        <h1>${boardInfo.title }</h1>
                        <a class="product_detail_kinds">
                            ${boardInfo.category }
                        </a>
                        <a class="product_detail_time">
                            · ${diffHor }시간전
                        </a><br>
                        <a class="product_detail_price">
                            ${boardInfo.price }원
                        </a><br>
                        <textarea class="product_detail_content"   readonly >
							${boardInfo.content }
                        </textarea>
                        <a class="product_detail_favorite" >관심</a>
                        <a class="product_detail_chatting" >채팅</a>
                        <a class="product_detail_select" >조회</a>
                    </div>

                </div>
                <div class="cr" ></div>
                  
            </div>
         

        </div>
      </main>   
      

      <div class="main">
        <div class="main_product" >
            <p>인기중고</p>
            <div class="main_product_div">
                <img alt="아이폰xs 256GB" src="https://dnvefa72aowie.cloudfront.net/origin/article/202111/9D520DB0335DB62D95F06EA80E43DC34A0F189314277C2632AEC8E588BD695C9.jpg?q=82&amp;s=300x300&amp;t=crop">
                <div class="main_product_title" >아이폰xs 256GB</div><br>
                <div class="main_product_address">경기도 안양시 동안구 호계3동</div><br>
                <div>
                    <div class="main_product_price" >50,000원
                        <div class="main_product_favorit">
                            3
                        </div>
                    </div>
                    
                </div>    
            </div>
            <div class="main_product_div">
                <img alt="아이폰xs 256GB" src="https://dnvefa72aowie.cloudfront.net/origin/article/202111/9D520DB0335DB62D95F06EA80E43DC34A0F189314277C2632AEC8E588BD695C9.jpg?q=82&amp;s=300x300&amp;t=crop">
                <div class="main_product_title" >아이폰xs 256GB</div><br>
                <div class="main_product_address">경기도 안양시 동안구 호계3동</div><br>
                <div>
                    <div class="main_product_price" >50,000원
                        <div class="main_product_favorit">
                            3
                        </div>
                    </div>
                    
                </div>    
            </div>
            <div class="main_product_div">
                <img alt="아이폰xs 256GB" src="https://dnvefa72aowie.cloudfront.net/origin/article/202111/9D520DB0335DB62D95F06EA80E43DC34A0F189314277C2632AEC8E588BD695C9.jpg?q=82&amp;s=300x300&amp;t=crop">
                <div class="main_product_title" >아이폰xs 256GB</div><br>
                <div class="main_product_address">경기도 안양시 동안구 호계3동</div><br>
                <div>
                    <div class="main_product_price" >50,000원
                        <div class="main_product_favorit">
                            3
                        </div>
                    </div>
                    
                </div>    
            </div>
            <div class="main_product_div">
                <img alt="아이폰xs 256GB" src="https://dnvefa72aowie.cloudfront.net/origin/article/202111/9D520DB0335DB62D95F06EA80E43DC34A0F189314277C2632AEC8E588BD695C9.jpg?q=82&amp;s=300x300&amp;t=crop">
                <div class="main_product_title" >아이폰xs 256GB</div><br>
                <div class="main_product_address">경기도 안양시 동안구 호계3동</div><br>
                <div>
                    <div class="main_product_price" >50,000원
                        <div class="main_product_favorit">
                            3
                        </div>
                    </div>
                    
                </div>    
            </div>
            <div class="main_product_div">
                <img alt="아이폰xs 256GB" src="https://dnvefa72aowie.cloudfront.net/origin/article/202111/9D520DB0335DB62D95F06EA80E43DC34A0F189314277C2632AEC8E588BD695C9.jpg?q=82&amp;s=300x300&amp;t=crop">
                <div class="main_product_title" >아이폰xs 256GB</div><br>
                <div class="main_product_address">경기도 안양시 동안구 호계3동</div><br>
                <div>
                    <div class="main_product_price" >50,000원
                        <div class="main_product_favorit">
                            3
                        </div>
                    </div>
                    
                </div>    
            </div>

        </div>
      </div>   
      <footer class="footer">

      </footer>
</body>
<script>
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
</script>

<script type="text/javascript">
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
				/* document.formm.action = "/chat";
		    	document.formm.submit(); */
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
</script>
</html>