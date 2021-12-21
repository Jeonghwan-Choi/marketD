<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ include file = "header.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Kirang+Haerang&family=Single+Day&display=swap" rel="stylesheet">
    <main class="main">
        <div class="main_product" >
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
			                            ${productVO.wish } 
			                        </div>
			                    </div>
			                   
			                </div>   
			            </a>   
		            
		              
	            </div>
			</c:forEach>
        </div>

	<c:choose>
		<c:when test="${sessionScope.memberVO==null}">
			<div>
				<a class="insertboardbtn" href="/login"> <img
					src="https://cdn-icons.flaticon.com/png/512/4274/premium/4274059.png?token=exp=1639301269~hmac=f58dc472843fb41dbf625eb5c07107bb">
				</a>
			</div>
		</c:when>
		<c:otherwise>
			<a class="insertboardbtn" href="/insertBoardForm"> <img
				src="https://cdn-icons.flaticon.com/png/512/4274/premium/4274059.png?token=exp=1639301269~hmac=f58dc472843fb41dbf625eb5c07107bb">
			</a>
		</c:otherwise>
	</c:choose>
	
</main>   
      <footer class="footer">

      </footer>
</body>

<script>


if(document.referrer=="http://localhost:8181/login"){
console.log("gaga"+document.referrer);
window.location.reload()}
/* window.onpageshow =  function(event) {
    //back 이벤트 일 경우
    if (event.persisted) {
    	location.href = document.referrer; 
    }
} */
$(document).on("pageload",function(){
	  window.location.reload(true);
	});
</script>
</html>