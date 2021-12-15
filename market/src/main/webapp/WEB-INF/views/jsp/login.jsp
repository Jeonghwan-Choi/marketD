<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css?ver=1.1 "  >


<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<%@ include file = "header.jsp"%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumMyeongjoYetHangul.css" rel="stylesheet">

<%request.setCharacterEncoding("UTF-8"); %>


    <div class="login_main">
		<div class="login_main_sub">
			<div>
				<img src="https://w.namu.la/s/e333e0887c17ef96c77da7c2c9b49e9d342b02f01994851f69870be0bc786b1c1757e80f7e7dd00a5a99ec605b11e55ff7a3f20867b612ecccb493f4b68112dc06b7fa51d6052af753face6bbac777be">
				<span class="login_title">당근마켓</span><br>
				<br>
				<br>

				<span class="login_main_p">서비스사용을 위해 로그인을 해주세요.</span>
				<br><br>
			</div>
			<div class="login_content">
			<form id="formm"name="formm" method ="post" action="/loginMember" >
				<div class="email_div">이메일</div>
				<input type = "text" id="email" class="email_input" name = "email" placeholder="이메일을 입력해주세요.">
				<div class="pwd_div">비밀번호 </div>
				<input type = "password" id="password" class="pwd_input" name = "password" placeholder="비밀번호를 입력해주세요.">
					<br>
					<input class="login_input" type= "button" value="로그인" onclick="chkMember()">
					
					<input class="join_input" type=  "button" value="회원가입" onclick="joinform()">

				</form>

			</div>
		</div>
    </div>
          <footer class="footer">

      </footer>

</body>

<script>

	function joinform(){
		location.href = "/join";
	}
	
	
	var alert1 = function(msg, type) {
		swal({
		    title: "알림",   
		    text: "비밀번호가 일치하지 않습니다.",   
		    type: "error" 
		});
	 }
	
	
	function chkMember(){
	
		var Email = $("#email").val();
		var Password = $("#password").val();

		$.ajax({
	        url : 'checkMember',
	        method : 'POST',
	        data : 'Email=' + Email + '&Password=' + Password,
	        type : "POST",

	        success : function(data) {
	     		if(data == "Coincide"){    			
	     			$("#formm").submit();
	     		}else{
	     			alert1();
	     		}
	            
	     },
	        error : function() {
	           alert("request error!");
	        }
	     }) 
	}
	
	
	
	
</script>

</html>