
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ include file = "header.jsp"%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumMyeongjoYetHangul.css" rel="stylesheet">
    <main class="main">

	<c:forEach items="${selectuser}" var="productVO" begin="0" end="0">
		<div class="main_user">
			<div class="user_profile-img">
				<img 
				src="http://cjhftp.dothome.co.kr/${productVO.memberno}/profile/${productVO.profile}" onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';"> 
			</div>

			<div class="user_profile-content1">
				<span class="content1-nickname">${productVO.name }</span>&nbsp; <span
					class="content1-address">${productVO.address }</span>
			</div>

			<div class="user_profile-content2">
				<span class="content2-proudct">거래중인 물품 수:</span> <span
					class="content2-proudct2">${fn:length(selectuser) }</span>
			</div>
		</div>
	</c:forEach>
	<div class="main_product">


		<c:forEach items="${selectuser}" var="productVO">
			<div class="main_product_div">
				<a class="main_product_div_a"
					href="board?boardno=${productVO.boardno }&memberno=${productVO.memberno}">
					<img class="product_img"
					src="http://cjhftp.dothome.co.kr/${productVO.memberno}/board/${productVO.boardno }/${productVO.imagename}">
					<div class="main_product_title">${productVO.title }</div>
					<br>
					<div class="main_product_address">${productVO.address }</div>
					<br> <input type="hidden" value="${productVO.memberno }">
					<input type="hidden" value="${productVO.boardno }">
					<div>
						<div class="main_product_price">${productVO.price }
							원
							<div class="main_product_favorit">
								<img class="watch-icon" alt="Watch count"
									src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg">
								${productVO.wish }
							</div>
						</div>

					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<a href="/insertBoardForm">피효정바보</a>
      </main>   
      <footer class="footer">

      </footer>
</body>
</html>