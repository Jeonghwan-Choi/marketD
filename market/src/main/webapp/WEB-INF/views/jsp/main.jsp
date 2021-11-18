
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ include file = "header.jsp"%>
    <main class="main">
        <div class="main_product" >
            <p>인기중고</p>
            <c:forEach items="${productList}" var="productVO">
	            <div class="main_product_div">
	            	<a class="main_product_div_a" href="#">
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
        <a href="/insertBoardForm">최정환바보</a>
      </main>   
      <footer class="footer">

      </footer>
</body>
</html>