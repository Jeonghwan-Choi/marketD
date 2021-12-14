
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ include file = "header.jsp"%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumMyeongjoYetHangul.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
    <main class="main">
        <div class="main_product" >
            <p>인기중고</p>
            <c:forEach items="${SearchBoard}" var="productVO">
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
        <div class="search_more"> 
			<input type="button" id="search_more" value="더보기" onclick="moredata()">

		</div>
		<div style="display:none;">
			<input type="text" id="firstvalue" value="6">
			<input type="text" id="lastvalue" value="11">
			<input type="text" id="searchData" value="${searchData }">
        	<input type="text" id="count" value="${count}">
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
	
var alert1 = function(msg, type) {
	swal({
	    title: "알림",   
	    text: "마지막 상품입니다.",   
	    type: "info" 
	});
 }
 

	
	function Alert() {
	      alert('gg', '더보기가 없습니다.');
	}


	function moredata(){
		
		
		
		var firstvalue = parseInt($("#firstvalue").val());
		var lastvalue = parseInt($("#lastvalue").val());
		var searchData = $("#searchData").val();
		var count = $("#count").val();
		
		
		
		$("#firstvalue").val(firstvalue + 6);
		$("#lastvalue").val(lastvalue + 6);
		
/* 		
		console.log(firstvalue);
		console.log(lastvalue); */
		
	
			$.ajax({
			      url : 'searchmoreboard',
			      method : 'POST',
			      data : 'searchData=' + searchData +"&firstvalue="+firstvalue+"&lastvalue="+lastvalue +"&count="+count,
			      type : "POST",
			
			  success : function(data) {
				
				
				if($(data).length != 0){
					
					$(data).each(
							 function(index) {

				            	  $('<div class="main_product_div">'+
				      	            	'<a class="main_product_div_a" href="board?boardno='+this.boardno+'&memberno='+this.memberno+'">'+
						                '<img class="product_img" src="http://cjhftp.dothome.co.kr/'+this.memberno+'/board/'+this.boardno+'/'+this.imagename+'">'+
						                '<div class="main_product_title" >'+this.title+'</div><br>'+
						                '<div class="main_product_address">'+this.address+'</div><br>'+
						                '<input type="hidden" value ="'+this.memberno+'">'+
						                '<input type="hidden" value ="'+this.boardno+'">'+
						                '<div>'+
						                    '<div class="main_product_price" >'+this.price+' 원'+
						                        '<div class="main_product_favorit">'+
						                        '<img class="watch-icon" alt="Watch count" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg" >'+
						                            ''+this.wish+''+ 
						                        '</div>'+
						                    '</div>'+
						                   
						                '</div>'+   
						            '</a>'+     
					            '</div>').appendTo(".main_product");

						     
							 }
					    
						)
				}else if($(data).length == 0){
					$("#firstvalue").val($("#firstvalue").val()-6);
					$("#lastvalue").val($("#lastvalue").val()-6);
					console.log($(data).length);
					console.log(firstvalue);
					console.log(lastvalue);
					 alert1('gg', '더보기가 없습니다.');
					
				}
				
			}
		})
	}
</script>
</html>