<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css?ver=1.0 "  >
<body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25eb93196f96f5e9cacf100023363c56&libraries=services"></script>


    <script>
    
    function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {
                
                console.log(data);
                
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                var sigungu = data.sigungu;
                var bname = data.bname;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_post').value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("member_addr").value = sigungu+" "+bname;
                } 
                else if(jibunAddr !== ''){
                    document.getElementById("member_addr").value = sigungu+" "+bname;
                }
            }
        }).open();
    }
    
    function addressSearch(){
    	 if (navigator.geolocation) {
    		 $("#address-t").html("주소를 찾고 있습니다.");
    		 $("#address-t").css("color","red");
             //위치 정보를 얻기
                 navigator.geolocation.getCurrentPosition (function(pos) {
                     console.log(pos.coords.latitude);
                     console.log(pos.coords.longitude);  

                     let geocoder = new kakao.maps.services.Geocoder();
             
                     let coord = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
                     let callback = function(result, status) {

                     
                        
                 };
                 let lat = pos.coords.latitude;
                 let lng = pos.coords.longitude;
                 getAddr(lat,lng);
                 function getAddr(lat,lng){
                     let geocoder = new kakao.maps.services.Geocoder();

                     let coord = new kakao.maps.LatLng(lat, lng);
                     let callback = function(result, status) {
                         if (status === kakao.maps.services.Status.OK) {
                             console.log(result)
                             console.log(result[0].address.region_2depth_name+" "+result[0].address.region_3depth_name);
                             $("#member_addr").val(result[0].address.region_2depth_name+" "+result[0].address.region_3depth_name);
                             $("#address-t").html("주소인증을 완료하였습니다.");
                    		 $("#address-t").css("color","blue");

                         }
                     };
                     geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
                 }
             });
         }      
    }


    
    </script>
        <form id ="join_form" method="post" action="/insertMember" name = "formm"  enctype="multipart/form-data">

            <div>
            <input type="text" value="${sessionScope.naverID}" style="display:none;">
                <a id = "main_text">회원가입</a>
                <br>
                <br>
                <div>*필수 항목</div>
                <br>
                <div>
                    <div>* 성함 :</div>
                    <input type = "text" id = "name" name = "name" value="${sessionScope.joinName}" >
    
                    <div>* 성별 :</div>
                    <select name="gender" id="gender" style="height:50px; width:622px;" >
                        <option value = "1">남자</option>
                        <option value = "2">여자</option>
                    </select>
                    
<!--                     <div>* 권한 :</div>
                    <select name="admin" id="admin" style="height:50px; width:622px;" >
                        <option value = "2">일반회원</option>
                        <option value = "1">관리자</option>    
                    </select> -->
    
    
                    

                         <div>* 휴대전화 번호 :</div>
	                    <input type="text" id="to" name="phone" placeholder="- 를 빼고 입력해주세요." >   <!-- 인증번호 받을사람 휴대폰 번호 -->
	                    <input id="send" class="phonebtn" type="button" value="인증번호 발송"  ><br>
                        <div id = "usediv">
                      	  <input type='text' id='userNum' placeholder='인증번호를 입력해주세요.'>
                 		  <input type='button' id='enterBtn' value='확인'>
                        </div>
                       
					  
						<input type="hidden" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
                        

                       
	                    

                    <div>* 주소 :</div>
                    <input style="width:234px;" class="content_td_address" id = "member_post" name ="member_post" type = "text" value ="" readonly>
                    <input style="width:234px;" class="content_td_address" id = "member_addr" name ="member_addr"type = "text" value ="" readonly>
                    <input class="addr_button" type="button" value="주소인증" onclick="addressSearch()" ><br>
<!--                     <input class="content_td_address" name = "member_addr_1"type="text" placeholder="상세주소">
 -->                
                    <p style="float:right; margin-right:25px" id = "address-t"></p>
     	
                    <br>
                    <br>
    
                    <a id = "main_text">계정정보</a>
                    <br>
                    <br>
                    <div>* 이메일 :<br>
                        <input type = "text" id = "email" name = "email" value="${sessionScope.joinEmail}" >
                        <input id="emailCk" class="addr_button" type="button" value="중복확인" onclick="emailcheck()" ><br>
                        <p id = "email-t">이메일 주소는 고객님의 안전한 거래와 회원정보 보호를 위해 정확하게 입력해 주세요.</p><br>
                        <p id = "checkMsg"></p>
                    </div>
                    
                    
                    <div>* 이메일 확인 :</div>
                    <input type = "text" id = "email-chk" name = "emailchk" >
                    
    
                    <div>* 비밀번호 :</div>
                    <input type = "password" id = "password" name = "password"  onkeyup="checkPwd()" >
                    <div>* 비밀번호 확인 :</div>
                    <input type = "password" id = "password_chk" name = "passwordchk" onkeyup="checkPwd()" >
                    <div id="checkPwd" style="margin-left:15px; font-size:13px;"> 암호를 입력하세요.</div>
                    <br>
                    <br>
                    <div style="margin-left: 10px;"> 프로필사진 </div>
                     <img style="width: 150px; margin: 20px; border-radius: 100%;" id="preview-image" name="prview" src=${profile_image}>
                

 					<span>${email}</span>
 					<input style="display: block;" type="file" id="input-image" name = "profileimg">
                    
                    
                </div>
                <input class = "join_button" type = "submit" value = "계정생성" >

            </div>
        </form>
        
        <script>

        function readImage(input) {
            // 인풋 태그에 파일이 있는 경우
            if(input.files && input.files[0]) {
                // 이미지 파일인지 검사 (생략)
                // FileReader 인스턴스 생성
                const reader = new FileReader()
                // 이미지가 로드가 된 경우
                reader.onload = e => {
                    const previewImage = document.getElementById("preview-image")
                    previewImage.src = e.target.result
                }
                // reader가 이미지 읽도록 하기
                reader.readAsDataURL(input.files[0])
            }
        }

        // input file에 change 이벤트 부여
        const inputImage = document.getElementById("input-image")
        inputImage.addEventListener("change", e => {
            readImage(e.target)
        })
        
        function checkPwd(){
              var f1 = document.forms[0];
              var pw1 = formm.password.value;
              var pw2 = formm.password_chk.value;
              if(pw1!=pw2){
               document.getElementById('checkPwd').style.color = "red";
               document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
              }else{
               document.getElementById('checkPwd').style.color = "black";
               document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
               
              }
              
       }
        
        function idcheck() {
              if (document.formm.email.value != document.formm.emailchk.value) {
                alert('이메일이 일치하지 않습니다.');
                document.formm.password.focus();
              }else if (document.formm.password.value != document.formm.passwordchk.value) {
                alert('비밀번호가 일치하지 않습니다.');
                document.formm.password.focus();
              }else {
                   
                    document.formm.submit();
              }
        }	  
        
        function test() {
  
        	
        	
        		document.formm.action = "/test";
                  document.formm.submit();
          
  	    }	 
        
        function emailcheck() {
              if (document.formm.email.value == "") {
                alert('이메일을 입력하여 주십시오.');
                document.formm.email.focus();
                return;
              }
              console.log($('#email').val());
              $.ajax({
     	         url : 'emailChk.do',
     	         method : 'POST',
     	         data : 'email=' + $('#email').val() ,
     	         type : "POST",
				
     	         success : function(data) {
     	        	 
     	        	 console.log(data);
     	        	 
     	        	if(data == 0){
     	        		$('#checkMsg').html('<p style="color:blue;margin-left:15px; font-size:13px;">사용가능한 아이디입니다.</p>');

     	        	}else{ 
     	        		$('#checkMsg').html('<p style="color:red;margin-left:15px; font-size:13px;">이미 사용중인 아이디입니다.</p>');
     	        	}


     	         },
     	         error : function() {
     	            alert("request error!");
     	         }
     	      }) 	
              
        }
        
        
     
        </script>
        
<script>
   $(function(){
      $("#usediv").hide();
   });        
          


   
          
  var count = 0; /* 문자 중복을 막기 위한 인증번호 */
   
 $(document).ready(function() {
	 

	 

    $("#send").click(function() {
       
       var number = Math.floor(Math.random() * 100000) + 100000;
          if(number>100000){
             number = number - 10000;
          }

          $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
       
       var to = $("#to").val();
       
       if(to == "" || to == null){
          alert("빈칸이나 공백을 채워주세요");
       }
       
       else {
       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
          
          if(con_test == true){
               
             if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
                 
               $.ajax({
                   url:"sendSms.do",
                   type:"post",
                   data:{to: $("#to").val(),
                        text: $("#text").val()
                        },
                 success:function(){
                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
                   $("#usediv").show();
                  
                   
                   count++;
                   
                   },
                   error(){
                      
                   }
                   
                });
             } else {
                alert("휴대폰 인증 그만하세요")
             }
          
          }
             else if(con_test == false){
                
             }
         }   
    })
    
    $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
       
       var userNum = $("#userNum").val();
       
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       }     
       else{     
          if(userNum.trim() == sysNum.trim()){
        	  $("#usediv").hide();
        	  $("to").css("background-color","gray");
        	  document.getElementById('to').readOnly = true;

        	  
           }
           else {
              alert("인증번호가 틀립니다.");
           }          
       }
    });
  });
	
</script>

        
        
    </body>
    </html>