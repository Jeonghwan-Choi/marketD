<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ include file = "header.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css ">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css ">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Kirang+Haerang&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cjhwebsocket.cafe24app.com:80/socket.io/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<style>


</style>
<body>

        <div style="display:none;"> 
               <label>MemberNO : </label><input id="memberno" type="text" value="${boardMemberno} "><br>
      	 	 <label>RoomNO : </label><input id="roomno" type="text" value="${boardBoardno}"><br>
      		 <label>LoginMemberNO : </label><input id="loginmemberno" type="text" value="${loginMemberno}"><br>
        	 <label>MyProfile : </label><input id="myprofilename" type="text" value="${sessionScope.memberVO.profile}"><br>
        	 <label>Profile : </label><input id="profilename" type="text" value=""><br>
        	 <input type="hidden" id="location" value="0">
        </div>
        
  <%--   <header>
        <div class = "header_img_div">
            <img class="fixed-logo" alt="당근마켓" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-24b18257ac4ef693c02233bf21e9cb7ecbf43ebd8d5b40c24d99e14094a44c81.svg">
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
                        <input class="header_chatting_btn" type="button" value="당근채팅">
                    </div>
                    <div>
                    <input class="header_chatting_btn" type="button" value="로그인" onclick="loginform()">
                    </div>
                    <div class="header_login_div">
                        <img class="header_login_div_profile" src="http://cjhftp.dothome.co.kr/${loginMemberno}/profile/${sessionScope.memberVO.profile}">
                        <span>${sessionScope.memberVO.name}</span>
                     </div>

                                
                    
                    
                </div>
            </nav>


      </header> --%>


   <div class = "chat_main">
        <div>

        </div>
        <div id="chat_user">
            <div class= "chat_user_left">

            </div>
            <div id="chat_user_list" class="chat_user_list">
                <div id="chat_user_myname" class="chat_user_myname">
                    <span>${memberVO.name}</span>
                </div>
                <div id="chat_user_readm" class="chat_user_readm">
                  
                    
                         <div class="readm_img_span">안읽은 메시지만 보기
                            <img id="readm_img" class="readm_img" src="http://cjhftp.dothome.co.kr/ico/tick2.png" onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';">
                        </div>
                    
                </div>
                <!-- 여기서 부터 사람 한명 -->
                <c:forEach items="${mychatList}" var="chatVO" varStatus="status">
                	<input type="hidden" id="user${status.count}" name="user${status.count}" value="${chatVO.user2}">
                
                   <div class="chat_user_list_room">
                   <a id="chatroomno" class="chatroom${chatVO.chatroomno }" >
                   <span id="${chatVO.user2 }" class="${chatVO.chatroomno }-${chatVO.user2 }" style="display:none;"></span>
                   <span class="boardMemberno" style="display:none;">${chatVO.user2}</span>
                	<input type="hidden" id="boardMemberno" name="boardMemberno" value="${chatVO.user2}">
                          <span class="boardRoomno" style="display:none;">${chatVO.chatroomno}</span>
                          <span class="boardname" style="display:none;">${chatVO.name}</span>
                              <div class="chat_user_list_room_m">
                                  <div class="chat_user_list_room_m_img_div">
<%--                                   <c:choose>
                                    <c:when test="${sessionScope.memberVO==null}"> --%>
                                         <img src="http://cjhftp.dothome.co.kr/${chatVO.user2}/profile/${chatVO.profile}" onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';">
                                          <span style="display:none;" id="userprofile">${chatVO.profile}</span> 
   <%--                              </c:when>
                                 </c:choose> --%>
                                      
                                  </div>
                                  <div class="chat_user_list_room_m_center_div">
                                      <div style="width:600px;" id="chat_user_list_room_m_member_div${chatVO.chatroomno }" class="chat_user_list_room_m_member_div">
                                          <span>${chatVO.name }</span>   
                                         <%--  <c:if test="${not empty chatVO.datetime }"> --%>
                                          <span id="chat_user_list_room_m_datetime${chatVO.chatroomno }">· ${chatVO.datetime } </span>
                                        <%--   </c:if> --%>
                							<span>· ${chatVO.title }</span>
                                      </div>
                                      <br>
                                      <div id="chat_user_list_room_m_message_div${chatVO.chatroomno }" class="chat_user_list_room_m_message_div">
                                          <span>
                                              ${chatVO.chatmessage }
                                          </span>
                                          
                                      </div>
                                      <c:choose>
										         	<c:when test="${chatVO.readst != 0 }">
										         	<div  id="${chatVO.chatroomno}_chat_user_list_room_read" class="chat_user_list_room_read" >
	  													<span id="${chatVO.chatroomno}_chat_user_list_room_read_span" class="chat_user_list_room_read_span">${chatVO.readst }</span>
	  												</div>	
	 								    		 	</c:when>
	 								    		 	<c:when test="${chatVO.readst == 0 }">
										         	<div  id="${chatVO.chatroomno}_chat_user_list_room_read" class="chat_user_list_room_read" style="display:none;">
	  													<span id="${chatVO.chatroomno}_chat_user_list_room_read_span" class="chat_user_list_room_read_span">0</span>
	  												</div>	
	 								    		 	</c:when>
								         		</c:choose> 
                                  </div>
                              </div>
                          </a>                
                    </div>
                    
          
                </c:forEach> 
                 <!-- 여기까지 -->
            </div>
        </div>
        <div id="chat_box" >
            <div class="chat_box_user">
                <div>
                  <!-- <img id="chat_box_user_img" onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';" class="chat_box_user_img" src=""> -->
                    <img style="display:none;" id="chat_box_user_img" class="chat_box_user_img" onerror="this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png';">
                    <!-- <img style="display:none;" id="chat_box_user_img" class="chat_box_user_img" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png"> -->
                  </div>
                <div>
                    <span id="chat_box_user_span"></span>
                </div>
                <input type="hidden" id="firstvalue" value="0">
			<input type="hidden" id="lastvalue" value="15">
            </div>
             
		
            <div id="chat_box_ms"  style=" text-align:center; margin-top:27%;" class="chat_box_ms">
            <div class="chat_box_ms_first">
             <img id="messageimg" src="http://cjhftp.dothome.co.kr/ico/message (2).png"><br><br>
             <input style="border:none; width:200px;" id="chat_box_ms_input" type="text" value="채팅할 상대를 선택해주세요">
             </div>
            </div>
            
            
            
              <div class="chat_box_send_div" style="display:none;">
            <div class="chat_box_send_text_div"><input type="text" id="msg" placeholder="메세지를 입력해보세요."></div>
                   <div class="chat_box_send_btn_div"><button id="msg_location">약속잡기</button>&nbsp;<button id="msg_process">전송</button></div> 
                
            </div> 
               <div class="chat_box_notsend">
               
               </div>
        </div>
        
    </div>

</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25eb93196f96f5e9cacf100023363c56"></script>
<script>

		$("#msg_location").click(function(){
			var user1 = $('#loginmemberno').val();
			var user2 = $('#memberno').val();
			var chatroomno = $('#roomno').val();
			var location = $('#location').val();
		    var calendarLocationno = 0;
				window.open("chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+chatroomno+"&locationjsp="+location+"&calendarLocationno="+calendarLocationno, "_blank", "width=900, height=620,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no" ); 
		
		})



	var nick = $("#loginmemberno").val();
	$(function () {
     var socket = io("http://cjhwebsocket.cafe24app.com:80"); 
     /*var socket = io("http://localhost:80");*/
    socket.emit('newuser', nick);
    // Regular forum submission event handler below this.
    
    
    

    $('.chat_user_readm div').on({ 
        'click': function(){
            if(jQuery('#readm_img').attr("src")=='http://cjhftp.dothome.co.kr/ico/tick.png'){
                $('#readm_img').attr('src','http://cjhftp.dothome.co.kr/ico/tick2.png');
            //읽음과 상관없이 전체가 나옴
            	$.ajax({
				        url : 'allReadSelectChat',
				        method : 'POST',
				        data : 'seller=' + $("#loginmemberno").val() ,
				        type : "POST",
				
				        success : function(data) {
							 $(".chat_user_list_room").remove();
							 
							
			               
				           $(data).each(
				                 function(index) {
				                	 
				                	 
									
									
				                    var maindiv = $('<div class="chat_user_list_room">'+
				                    '<a id="chatroomno" class="chatroom'+this.chatroomno+'" >'+
				                    '<span id="'+this.user2+'" class="'+this.chatroomno+'-'+this.user2+'" style="display:none;"></span>'+
				                    '<span class="boardMemberno" style="display:none;">'+this.user2+'</span>'+
				                    '<span class="boardRoomno" style="display:none;">'+this.chatroomno+'</span>'+
				                    '<span class="profilename" style="display:none;">'+this.profile+'</span>'+
				                    '<div class="chat_user_list_room_m">'+
				                    '<div class="chat_user_list_room_m_img_div">'+
				                    '<img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.user2+'/profile/'+this.profile+'">'+    
				                    '</div>'+
				                    '<div class="chat_user_list_room_m_center_div">'+
				                    '<div class="chat_user_list_room_m_member_div">'+
				                    '<span>'+this.name+'</span>'+
				                    '<span> · </span>'+
				                    '<span>'+this.datetime+' </span>'+
				                    '</div>'+
				                    '<br>'+
				                    '<div class="chat_user_list_room_m_message_div" id="chat_user_list_room_m_message_div'+this.chatroomno+'">'+
				                    '<span>'+
				                    ''+this.chatmessage+''+
				                    '</span>'+
				                    '</div>'+
				                    '<div  id="'+this.chatroomno+'_chat_user_list_room_read" class="chat_user_list_room_read" >'+
					                '<span id="'+this.chatroomno+'_chat_user_list_room_read_span" class="chat_user_list_room_read_span"></span>'+
					                '</div>'+ 
				                    '</div>'+
				                    '</div>');
				                    console.log("roomno:"+this.chatroomno);
				                    console.log("read:"+this.readst);
				                    $('.chat_user_list').append(maindiv);
				                    if(this.readst == 0){
				                    	$("#"+this.chatroomno+"_chat_user_list_room_read_span").text(0)
				                    	$("#"+this.chatroomno+"_chat_user_list_room_read").css("display","none")
				                    }else if(this.readst != 0){
				                    	$("#"+this.chatroomno+"_chat_user_list_room_read_span").text(this.readst)
				                    	$("#"+this.chatroomno+"_chat_user_list_room_read").css("display","block")
				                    }
				                    
				                           
				                 });
				        },
				        error : function() {
				           alert("request error!");
				        }
				     })
                console.log("읽은 메세지만 나옴  ");
            }else if(jQuery('#readm_img').attr("src")=='http://cjhftp.dothome.co.kr/ico/tick2.png'){
                $('#readm_img').attr('src','http://cjhftp.dothome.co.kr/ico/tick.png');
            //안읽은 메세지만 나옴    
            console.log("안읽은 메세지만 나옴  ");
                $.ajax({
				        url : 'notReadSelectChat',
				        method : 'POST',
				        data : 'seller=' + $("#loginmemberno").val() ,
				        type : "POST",
				
				        success : function(data) {
							 $(".chat_user_list_room").remove();
				
				           $(data).each(
				                 function(index) {
				                    console.log(index)
				                    var maindiv = $('<div class="chat_user_list_room">'+
				                    '<a id="chatroomno" class="chatroom'+this.chatroomno+'" >'+
				                    '<span id="'+this.user2+'" class="'+this.chatroomno+'-'+this.user2+'" style="display:none;"></span>'+
				                    '<span class="boardMemberno" style="display:none;">'+this.user2+'</span>'+
				                    '<span class="boardRoomno" style="display:none;">'+this.chatroomno+'</span>'+
				                    '<span class="profilename" style="display:none;">'+this.profile+'</span>'+
				                    '<div class="chat_user_list_room_m">'+
				                    '<div class="chat_user_list_room_m_img_div">'+
				                    '<img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.user2+'/profile/'+this.profile+'">'+    
				                    '</div>'+
				                    '<div class="chat_user_list_room_m_center_div">'+
				                    '<div class="chat_user_list_room_m_member_div">'+
				                    '<span>'+this.name+'</span>'+
				                    '<span> · </span>'+
				                    '<span>'+this.datetime+' </span>'+
				                    '</div>'+
				                    '<br>'+
				                    '<div class="chat_user_list_room_m_message_div" id="chat_user_list_room_m_message_div'+this.chatroomno+'">'+
					                '<span>'+
				                    ''+this.chatmessage+''+
				                    '</span>'+
				                    '</div>'+
				                    '<div  id="'+this.chatroomno+'_chat_user_list_room_read" class="chat_user_list_room_read" >'+
					                '<span id="'+this.chatroomno+'_chat_user_list_room_read_span" class="chat_user_list_room_read_span"></span>'+
					                '</div>'+ 
				                    '</div>'+	 
				                    '</div>'+
				                    '</div>');
				                    $('.chat_user_list').append(maindiv);
				                    $('.chat_user_list').append(maindiv);
				                    if(this.readst == 0){
				                    	$("#"+this.chatroomno+"chat_user_list_room_read_span").text(0)
				                    	$(".chat_user_list_room_read").css("display","none")
				                    }else if(this.readst != 0){
				                    	$("#"+this.chatroomno+"_chat_user_list_room_read_span").text(this.readst)
				                    	$(".chat_user_list_room_read").css("display","block")
				                    } 
				                 });
				        },
				        error : function() {
				           alert("request error!");
				        }
				     })
				 //여기까지 ajax    
	            }           
	        } 
	    });
    
    
    
    
    $(document).ready(function() {
           
 
            //msg에서 키를 누를떄
            $("#msg").keydown(function(key) {
                //해당하는 키가 엔터키(13) 일떄
                if (key.keyCode == 13) {
                    //msg_process를 클릭해준다.
                    msg_process.click();
                }
            });
 
            //msg_process를 클릭할 때
            $("#msg_process").click(function() {
            	const message = $("#msg").val();
            	const today = new Date();   

            	const year = today.getFullYear(); // 년도
            	const month = today.getMonth() + 1;  // 월
            	if(month < 10){ '0' + month.toString()}else{ month.toString()};
            	const day = today.getDate();  // 날짜
            	if(day < 10){ '0' + day.toString()}else{ day.toString()};
            	const hour = today.getHours(); // 시
            	if(hour < 10){ '0' + hour.toString()}else{ hour.toString()};
            	const minutes = today.getMinutes();  // 분
            	if(minutes < 10){ '0' + minutes.toString()}else{ minutes.toString()};
				const datetime = (year+"/"+month+"/"+day+" "+hour+":"+minutes);
            	
            	if(typeof message==null||message=="undefined"||message==""){
            		swal("INFO", "메세지를 입력해주세요", "info");
            	}else{
            
                //time 
                let today = new Date();
                let time = (today.getMonth()+1)+'.'+today.getDate()+' '+today.getHours()+':'+today.getMinutes();
                //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                socket.emit("send_msg", "2//"+$("#roomno").val()+"//"+$("#loginmemberno").val()+"//"+$("#msg").val()+"//"+time+"//1");/* *** */
                //ajax insert sql
		        
                const recentroomno = $("#roomno").val();
                $("#chat_user_list_room_m_message_div"+recentroomno).html(message);
                $("#chat_user_list_room_m_datetime"+recentroomno).html("· "+datetime);
  
	                    	
	                    if($("."+$("#roomno").val()+"-"+$("#memberno").val()).html()==1){
	                    		//상대가 내방에 접속중
	                    	$.ajax({
	           			         url : 'insertMessage',
	           			         method : 'POST',
	           			         data : 'roomno=' + $("#roomno").val() +'&seller='+$("#loginmemberno").val() +'&chatmessage='+$("#msg").val()+"&readst=0"  ,
	           			         type : "POST",
	           		
	           			         success : function(data) {
	           						console.log(data);
	           		                
	           		         },
	           		            error : function() {
	           		               alert("request error!");
	           		            }
	           		         }) 	
	                    	}else{
	                    		//상대가 내방에 접속중이 아님
	                    	$.ajax({
	           			         url : 'insertMessage',
	           			         method : 'POST',
	           			         data : 'roomno=' + $("#roomno").val() +'&seller='+$("#loginmemberno").val() +'&chatmessage='+$("#msg").val()+"&readst=1"  ,
	           			         type : "POST",
	           		
	           			         success : function(data) {
	           						console.log(data);
	           		                
	           		         },
	           		            error : function() {
	           		               alert("request error!");
	           		            }
	           		         }) 
	                    }
                
 
                //#msg에 벨류값을 비워준다.
                $("#msg").val("");
            }  });
 
            //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
            socket.on('send_msg', function(msg) {
            	
            
            	 console.log(msg)	
            	
                var jbSplit = msg.split('//');
                if(jbSplit[0]==1){
                	$("#"+jbSplit[2]).html("");
					$("."+jbSplit[1]+"-"+jbSplit[2]).html("1");
					
					console.log("roomno: "+$("#roomno").val());
					console.log("loginmemberno: "+$("#loginmemberno").val());
					
					if(jbSplit[1]==$("#roomno").val()){
						if(jbSplit[2]!=$("#loginmemberno").val()){
							$(".chat_box_m_div_read_div_span").html("")
						}
					}
					
				} 
                
                
                
              //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                
                //jbSplit[0]==2 "상대방에 보낸 메세지일때 읽음 표시에 대한 여부 0이면 1로 올라가면서 목록에 표시" 
                  if(jbSplit[0]==2){  
                	
                	var SumReadst = parseInt($("#"+jbSplit[1]+"_chat_user_list_room_read_span").html()) + 1
               		
                	if($("#roomno").val() != jbSplit[1]){
                		if( jbSplit[2] != $("#loginmemberno").val() ){
                			
                    		$("#"+jbSplit[1]+"_chat_user_list_room_read").css("display","block");
                        	$("#"+jbSplit[1]+"_chat_user_list_room_read_span").html(SumReadst);
                    	}
                	}
                	
                	
                	/* 현재 내가 접속중인 방일 때 실시간 load  */
	                if($("#roomno").val()==jbSplit[1]){    
	                    if($("#memberno").val()==jbSplit[2]){
	                    	 if(jbSplit[5]==1){
	                    		//a
	                    		 $('<div class="a"><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+jbSplit[2]+'/profile/'+$("#profilename").val()+'" ></div><div class="chat_box_m_div" > <span>'+jbSplit[3]+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+jbSplit[4]+'</span></div></div>').appendTo("#chat_box_ms");
	 	                    	}else if(jbSplit[5]==2){
	 	                    		const memberno = $('#memberno').val();
	                    		//c
	 	                    		$(
											' <div class="c"><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'
													+ jbSplit[2]
													+ '/profile/'
													+ $('#profilename').val()
													+ '" >'
													+ '</div><div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+jbSplit[10]+'" class="chat_box_m_div_map"></div>'
													+ ' <div class="chat_box_m_div_date">날짜: '
													+ jbSplit[9]
													+ '</div><div class="chat_box_m_div_location">장소: '
													+ jbSplit[6]
													+ '</div>'
													/* + '<input type="button" value= "일정보기"></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >' */
													+ '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+jbSplit[2]+'&user2='+memberno+'&chatroomno='+jbSplit[1]+'\',\'window_name\',\'width=430,height=500,location=no,status=no,scrollbars=yes\');"></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'
													+ jbSplit[4]
													+ '</span></div></div>').appendTo("#chat_box_ms");	
	 	                    	// 이미지 지도에서 마커가 표시될 위치입니다 
									var markerPosition = new kakao.maps.LatLng(jbSplit[2],jbSplit[1]);

									// 이미지 지도에 표시할 마커입니다
									// 이미지 지도에 표시할 마커는 Object 형태입니다
									var marker = {
										position : markerPosition
									};

									var staticMapContainer = document.getElementById("staticMap"+ jbSplit[10]), // 이미지 지도를 표시할 div  
									staticMapOption = {
										center : new kakao.maps.LatLng(
												jbSplit[8],
												jbSplit[7]), // 이미지 지도의 중심좌표
										level : 3, // 이미지 지도의 확대 레벨
										marker : marker
									// 이미지 지도에 표시할 마커 
									};

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(
											staticMapContainer,
											staticMapOption);
	                    		
					                const recentroomno = $("#roomno").val();
					                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
	                    	}
	                    	 

	                    	
	                    	
	                    }else{
	                    	if($("."+$("#roomno").val()+"-"+$("#memberno").val()).html()==1){
	                    		//상대가 내방에 접속중
	                    		
	                    		if(jbSplit[5]==1){
	                    			$('<div class="b"><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+jbSplit[4]+'</span></div><div class="chat_box_m_div" ><span>'+jbSplit[3]+'</span></div><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+jbSplit[2]+'/profile/'+$("#myprofilename").val()+'" ></div></div>').appendTo("#chat_box_ms");
	        	                   }else if(jbSplit[5]==2){
	        	                	   $(
												' <div class="d"><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'
														+ jbSplit[4]
														+ '</span></div>'
														+ '<div class="chat_box_m_div" ><div> 약속이 공유되었습니다.</div><div id="staticMap'+jbSplit[10]+'" class="chat_box_m_div_map">'
														+ '</div><div class="chat_box_m_div_date">날짜: '
														+ jbSplit[9]
														+ '</div><div class="chat_box_m_div_location">장소: '
														+ jbSplit[6]
														+ '</div>'
														+ '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+jbSplit[2]+'&user2='+memberno+'&chatroomno='+jbSplit[1]+'\',\'window_name\',\'width=430,height=500,location=no,status=no,scrollbars=yes\');"></div><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'
														+ jbSplit[2]
														+ '/profile/'
														+ $("#myprofilename").val()
														+ '" ></div></div>').appendTo("#chat_box_ms");// 이미지 지도에서 마커가 표시될 위치입니다 
										var markerPosition = new kakao.maps.LatLng(
												jbSplit[8],
												jbSplit[7]);

										// 이미지 지도에 표시할 마커입니다
										// 이미지 지도에 표시할 마커는 Object 형태입니다
										var marker = {
											position : markerPosition
										};

										var staticMapContainer = document.getElementById("staticMap"+ jbSplit[10]), // 이미지 지도를 표시할 div  
										staticMapOption = {
											center : new kakao.maps.LatLng(
													jbSplit[8],
													jbSplit[7]), // 이미지 지도의 중심좌표
											level : 3, // 이미지 지도의 확대 레벨
											marker : marker
										// 이미지 지도에 표시할 마커 
										};

										// 이미지 지도를 생성합니다
										var staticMap = new kakao.maps.StaticMap(
												staticMapContainer,
												staticMapOption);
										 const recentroomno = $("#roomno").val();
							                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");	
	        	                   }
	                    	
	                    	
	                    	}else{
	                    		//상대가 내방에 접속중이 아님
	                    		if(jbSplit[5]==1){
	                    			$('<div class="b"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span">1</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+jbSplit[4]+'</span></div><div class="chat_box_m_div" ><span>'+jbSplit[3]+'</span></div><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+jbSplit[2]+'/profile/'+$("#myprofilename").val()+'" ></div></div>').appendTo("#chat_box_ms");
	          	                 }else if(jbSplit[5]==2){
	                    			$('<div class="d"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span">1</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'
											+ jbSplit[4]
											+ '</span></div>'
											+ '<div class="chat_box_m_div" ><div> 약속이 공유되었습니다.</div><div id="staticMap'+ jbSplit[10]+'" class="chat_box_m_div_map">'
											+ '</div><div class="chat_box_m_div_date">날짜: '
											+ jbSplit[9]
											+ '</div><div class="chat_box_m_div_location">장소:'
											+ jbSplit[6]
											+ '</div>'
											+ '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+jbSplit[2]+'&user2='+memberno+'&chatroomno='+jbSplit[1]+'\',\'window_name\',\'width=430,height=500,location=no,status=no,scrollbars=yes\');"></div><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'
											+ jbSplit[2]
											+ '/profile/'
											+ $("#myprofilename").val()
											+ '" ></div></div>').appendTo("#chat_box_ms");// 이미지 지도에서 마커가 표시될 위치입니다 
									var markerPosition = new kakao.maps.LatLng(
											jbSplit[8],
											jbSplit[7]);

									// 이미지 지도에 표시할 마커입니다
									// 이미지 지도에 표시할 마커는 Object 형태입니다
									var marker = {
										position : markerPosition
									};

									var staticMapContainer = document.getElementById("staticMap"+ jbSplit[10]), // 이미지 지도를 표시할 div  
									staticMapOption = {
										center : new kakao.maps.LatLng(
												jbSplit[8],
												jbSplit[7]), // 이미지 지도의 중심좌표
										level : 3, // 이미지 지도의 확대 레벨
										marker : marker
									// 이미지 지도에 표시할 마커 
									};

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(
											staticMapContainer,
											staticMapOption);
									 const recentroomno = $("#roomno").val();
						                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");	
	          	                 }
	                    	}
	                    }
	                } 
                 }
                //스크롤 자동으로 내려가기
/*                 $('#chat_box_ms').stop().animate({scrollTop:$('#chat_box_ms')[0].scrollHeight},100)
 */            
                $("#chat_box_ms").scrollTop($("#chat_box_ms")[0].scrollHeight);

                
            });
            
        });
    
    /* 채팅목록 사람 클릭  */
    $(document).on("click","a",function(){
    	$("#messageimg").remove();
    	

		$("#firstvalue").val(0);
		$("#lastvalue").val(14);
    	$('.chat_box_send_div').css('display','block');
    	$('.chat_box_ms').css('margin-top','0');
    	$('.chat_box_ms').css('text-align','left');
    	$('.chat_box_ms_first').css('display','none');
    	
    	//$('.search_more').css('display','block');
    	/* $('<div class="chat_box_send_div"><div class="chat_box_send_text_div"><input type="text" id="msg" placeholder="메세지를 입력해보세요."></div>'
    			+'<div class="chat_box_send_btn_div"><button id="msg_location">약속잡기</button><button id="msg_process">전송</button></div>'
    			+'</div> ').appendTo('#chat_box'); */	
    
    
/*     $("a").click(function() { */
        var myClass = $(this).attr("class");
        
		
        var boardMemberno = $("."+myClass).children('.boardMemberno').html();//memberno
        var boardRoomno = $("."+myClass).children('.boardRoomno').html();
        var loginmemberno = $("#loginmemberno").val();//loginuser
         var profilename = $("."+myClass).children('.chat_user_list_room_m').children('.chat_user_list_room_m_img_div').children('#userprofile').html(); 
         var boardname = $("."+myClass).children('.boardname').html();
        

     	$('#chat_box_user_img').css("display","block");
     	$('#chat_box_user_span').html(boardname);
        
        $("#"+boardRoomno+"_chat_user_list_room_read").css("display","none");
    	
    	$("#"+boardRoomno+"_chat_user_list_room_read_span").html(0);
        
        $("#memberno").val(boardMemberno);
        $("#roomno").val(boardRoomno);
        $("#profilename").val(profilename);
        

     	$('#chat_box_user_img').attr("src", "http://cjhftp.dothome.co.kr/"+boardMemberno+"/profile/"+profilename);
        socket.emit("send_msg", "1//"+boardRoomno+"//"+loginmemberno+"//"+boardMemberno);
        
        $.ajax({
	         url : 'selectChat?firstvalue=0&lastvalue=14',
	         method : 'POST',
	         data : 'roomno=' + $("#roomno").val() +'&seller='+$("#memberno").val() +'&chatmessage='+$("#msg").val()+"&readst=0",
	         type : "POST",
	         success : function(data) {
	        	 $(".a").remove();
	        	 $(".b").remove();
	        	 $(".c").remove();
	        	 $(".d").remove();
	        	 $(data).each(
		           function(index) {
		        	    
		        	   
			           	
		              if(loginmemberno == this.seller){
		            	  
							if(this.readst == 0){
								if(this.locationno!=0){

					        	    const location = this.location;
									const jbSplit = location.split('//');
		 	                    	const memberno = $('#memberno').val();
									const loginmemberno = $('#loginmemberno').val();
									const roomno = $('#roomno').val();
									 $('<div class="d"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'
												+ this.datetime
												+ '</span></div>'
												+ '<div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+this.locationno+'" class="chat_box_m_div_map"></div>'
												+ '<div class="chat_box_m_div_date">날짜: '
												+ this.locationdate
												+ '</div>'
												+ '<div class="chat_box_m_div_location">장소:'
												+ jbSplit[0]
												+ '</div>'
												+ '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+loginmemberno+'&user2='+memberno+'&chatroomno='+roomno+'&calendarLocationno='+this.locationno+'\',\'_blank\',\'width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no\');"></div><div class="chat_box_p_div">'
												+ '<img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'"></div></div>').appendTo("#chat_box_ms");

									// 이미지 지도에서 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(jbSplit[2], jbSplit[1]); 

								// 이미지 지도에 표시할 마커입니다
								// 이미지 지도에 표시할 마커는 Object 형태입니다
								var marker = {
								    position: markerPosition
								};

								var staticMapContainer  = document.getElementById('staticMap'+this.locationno), // 이미지 지도를 표시할 div  
								    staticMapOption = { 
								        center: new kakao.maps.LatLng(jbSplit[2], jbSplit[1]), // 이미지 지도의 중심좌표
									        level: 3, // 이미지 지도의 확대 레벨
									        marker: marker // 이미지 지도에 표시할 마커 
									    };    

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
									 const recentroomno = $("#roomno").val();
						                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
									
								}else{
									$('<div class="b"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div" ><span>'+this.chatmessage+'</span></div><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'" ></div></div>').appendTo("#chat_box_ms");
								}
							
								
							}else{
								if(this.locationno!=0){

					        	    const location = this.location;
									 const jbSplit = location.split('//');
									 const memberno = $('#memberno').val();
										const loginmemberno = $('#loginmemberno').val();
										const roomno = $('#roomno').val();
								
									$('<div class="d"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span">'+this.readst+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div>'+
								      '<div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+this.locationno+'" class="chat_box_m_div_map"></div>'+
									  '<div class="chat_box_m_div_date">날짜: '+this.locationdate+'</div>'+
								      '<div class="chat_box_m_div_location">장소: '+jbSplit[0]+'</div>'+
								      '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+loginmemberno+'&user2='+memberno+'&chatroomno='+roomno+'&calendarLocationno='+this.locationno+'\',\'_blank\',\'width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no\');"></div><div class="chat_box_p_div">'+
								      '<img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'"></div></div>').appendTo("#chat_box_ms");
									

									// 이미지 지도에서 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(jbSplit[2], jbSplit[1]); 

								// 이미지 지도에 표시할 마커입니다
								// 이미지 지도에 표시할 마커는 Object 형태입니다
								var marker = {
								    position: markerPosition
								};

								var staticMapContainer  = document.getElementById('staticMap'+this.locationno), // 이미지 지도를 표시할 div  
								    staticMapOption = { 
								        center: new kakao.maps.LatLng(jbSplit[2], jbSplit[1]), // 이미지 지도의 중심좌표
									        level: 3, // 이미지 지도의 확대 레벨
									        marker: marker // 이미지 지도에 표시할 마커 
									    };    

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
									 const recentroomno = $("#roomno").val();
						                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
									
									
								}else{$('<div class="b"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span">'+this.readst+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div" ><span>'+this.chatmessage+'</span></div><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'" ></div></div>').appendTo("#chat_box_ms");
								}

							
								
							}
	                        
		              }else if(loginmemberno != this.seller){
		            	  if(this.locationno!=0){
		            		  const location = this.location;
								 const jbSplit = location.split('//');
								 const memberno = $('#memberno').val();
									const loginmemberno = $('#loginmemberno').val();
									const roomno = $('#roomno').val();

								//넣어야함c
								$('<div class="c"><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'"></div><div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+this.locationno+'" class="chat_box_m_div_map"></div>'+

				                        '<div class="chat_box_m_div_date">날짜: ' +this.locationdate+'</div><div class="chat_box_m_div_location">장소:'+jbSplit[0]+'</div>'+
				                        '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+loginmemberno+'&user2='+memberno+'&chatroomno='+roomno+'&calendarLocationno='+this.locationno+'\',\'_blank\',\'width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no\');"> </div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div> </div>').appendTo("#chat_box_ms");
								
								

								// 이미지 지도에서 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(jbSplit[2], jbSplit[1]); 

								// 이미지 지도에 표시할 마커입니다
								// 이미지 지도에 표시할 마커는 Object 형태입니다
								var marker = {
								    position: markerPosition
								};

								var staticMapContainer  = document.getElementById('staticMap'+this.locationno), // 이미지 지도를 표시할 div  
								    staticMapOption = { 
								        center: new kakao.maps.LatLng(jbSplit[2], jbSplit[1]), // 이미지 지도의 중심좌표
								        level: 3, // 이미지 지도의 확대 레벨
								        marker: marker // 이미지 지도에 표시할 마커 
								    };    

								// 이미지 지도를 생성합니다
								var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
								
								 const recentroomno = $("#roomno").val();
					                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
							}else{  $('<div class="a"><div class="chat_box_p_div"><img onerror="this.src=\'https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png\';" src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'" ></div><div class="chat_box_m_div" > <span>'+this.chatmessage+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div></div>').appendTo("#chat_box_ms");
				              }
	                       
		              }
		              $("#chat_box_ms").scrollTop($("#chat_box_ms")[0].scrollHeight);
		              /* $('#chat_box_ms').scroll(function () {
		                  if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
		                      alert("dd");
		                  }
		              }); */
		             /*  if($('#chat_box_ms').scrollTop()==0){
	                      alert("dd");
	                  } */

		              
		              
		       	   });
         	},
            error : function() {
               alert("request error!");
            }
         })  

    });	
    			
    			
    			
    function moredata(){
		console.log("run moredate()!");
		
		var firstvalue = parseInt($("#firstvalue").val());
		var lastvalue = parseInt($("#lastvalue").val());
		console.log("chk"+firstvalue)
		//console.log("chk"+lastvalue)
		var roomno = $('#roomno').val();
		var seller = $('#memberno').val();
		var msg = $('#msg').val();
        var loginmemberno = $("#loginmemberno").val();//loginuser
		
		$("#firstvalue").val(firstvalue + 15);
		//$("#lastvalue").val(lastvalue + 15);
		console.log("chk"+parseInt($("#firstvalue").val()))
		//console.log("chk"+parseInt($("#lastvalue").val()))
		 $.ajax({
			 url : 'searchmorechat',
		      method : 'POST',
		      data : 'firstvalue='+parseInt($("#firstvalue").val())+'&lastvalue='+parseInt($("#lastvalue").val())+'&roomno=' + roomno +'&seller='+seller +'&chatmessage='+msg+'&readst=0',
		      type : "POST",
	         success : function(data) {
	        	 
	        	 if($(data).length != 0){
	     			
	        	 
	        	 $(data).each(
		           function(index) {
		              if(loginmemberno == this.seller){
		            	  
							if(this.readst == 0){
								if(this.locationno!=0){

					        	    const location = this.location;
									const jbSplit = location.split('//');
		 	                    	const memberno = $('#memberno').val();
									const loginmemberno = $('#loginmemberno').val();
									const roomno = $('#roomno').val();
									 $("#chat_box_ms").prepend('<div class="d"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'
												+ this.datetime
												+ '</span></div>'
												+ '<div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+this.locationno+'" class="chat_box_m_div_map"></div>'
												+ '<div class="chat_box_m_div_date">날짜: '
												+ this.locationdate
												+ '</div>'
												+ '<div class="chat_box_m_div_location">장소:'
												+ jbSplit[0]
												+ '</div>'
												+ '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+loginmemberno+'&user2='+memberno+'&chatroomno='+roomno+'&calendarLocationno='+this.locationno+'\',\'_blank\',\'width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no\');"></div><div class="chat_box_p_div">'
												+ '<img src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'"></div></div>');

									// 이미지 지도에서 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(jbSplit[2], jbSplit[1]); 

								// 이미지 지도에 표시할 마커입니다
								// 이미지 지도에 표시할 마커는 Object 형태입니다
								var marker = {
								    position: markerPosition
								};

								var staticMapContainer  = document.getElementById('staticMap'+this.locationno), // 이미지 지도를 표시할 div  
								    staticMapOption = { 
								        center: new kakao.maps.LatLng(jbSplit[2], jbSplit[1]), // 이미지 지도의 중심좌표
									        level: 3, // 이미지 지도의 확대 레벨
									        marker: marker // 이미지 지도에 표시할 마커 
									    };    

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
									 const recentroomno = $("#roomno").val();
						                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
									
								}else{
									 $("#chat_box_ms").prepend('<div class="b"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div" ><span>'+this.chatmessage+'</span></div><div class="chat_box_p_div"><img src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'" ></div></div>');
								}
							
								
							}else{
								if(this.locationno!=0){

					        	    const location = this.location;
									 const jbSplit = location.split('//');
									 const memberno = $('#memberno').val();
										const loginmemberno = $('#loginmemberno').val();
										const roomno = $('#roomno').val();
								
										 $("#chat_box_ms").prepend('<div class="d"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span">'+this.readst+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div>'+
								      '<div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+this.locationno+'" class="chat_box_m_div_map"></div>'+
									  '<div class="chat_box_m_div_date">날짜: '+this.locationdate+'</div>'+
								      '<div class="chat_box_m_div_location">장소: '+jbSplit[0]+'</div>'+
								      '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+loginmemberno+'&user2='+memberno+'&chatroomno='+roomno+'&calendarLocationno='+this.locationno+'\',\'_blank\',\'width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no\');"></div><div class="chat_box_p_div">'+
								      '<img src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'"></div></div>');
									

									// 이미지 지도에서 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(jbSplit[2], jbSplit[1]); 

								// 이미지 지도에 표시할 마커입니다
								// 이미지 지도에 표시할 마커는 Object 형태입니다
								var marker = {
								    position: markerPosition
								};

								var staticMapContainer  = document.getElementById('staticMap'+this.locationno), // 이미지 지도를 표시할 div  
								    staticMapOption = { 
								        center: new kakao.maps.LatLng(jbSplit[2], jbSplit[1]), // 이미지 지도의 중심좌표
									        level: 3, // 이미지 지도의 확대 레벨
									        marker: marker // 이미지 지도에 표시할 마커 
									    };    

									// 이미지 지도를 생성합니다
									var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
									 const recentroomno = $("#roomno").val();
						                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
									
									
								}else{ $("#chat_box_ms").prepend('<div class="b"><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span">'+this.readst+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div" ><span>'+this.chatmessage+'</span></div><div class="chat_box_p_div"><img src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'" ></div></div>');
								}

							
								
							}
	                        
		              }else if(loginmemberno != this.seller){
		            	  if(this.locationno!=0){
		            		  const location = this.location;
								 const jbSplit = location.split('//');
								 const memberno = $('#memberno').val();
									const loginmemberno = $('#loginmemberno').val();
									const roomno = $('#roomno').val();

								//넣어야함c
								 $("#chat_box_ms").prepend('<div class="c"><div class="chat_box_p_div"><img src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'"></div><div class="chat_box_m_div" ><div>약속이 공유되었습니다.</div><div id="staticMap'+this.locationno+'" class="chat_box_m_div_map"></div>'+

				                        '<div class="chat_box_m_div_date">날짜: ' +this.locationdate+'</div><div class="chat_box_m_div_location">장소:'+jbSplit[0]+'</div>'+
				                        '<input type="button" value= "일정보기" onclick="window.open(\'chatlocation?user1='+loginmemberno+'&user2='+memberno+'&chatroomno='+roomno+'&calendarLocationno='+this.locationno+'\',\'_blank\',\'width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no\');"> </div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div> </div>');
								
								

								// 이미지 지도에서 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(jbSplit[2], jbSplit[1]); 

								// 이미지 지도에 표시할 마커입니다
								// 이미지 지도에 표시할 마커는 Object 형태입니다
								var marker = {
								    position: markerPosition
								};

								var staticMapContainer  = document.getElementById('staticMap'+this.locationno), // 이미지 지도를 표시할 div  
								    staticMapOption = { 
								        center: new kakao.maps.LatLng(jbSplit[2], jbSplit[1]), // 이미지 지도의 중심좌표
								        level: 3, // 이미지 지도의 확대 레벨
								        marker: marker // 이미지 지도에 표시할 마커 
								    };    

								// 이미지 지도를 생성합니다
								var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
								
								 const recentroomno = $("#roomno").val();
					                $("#chat_user_list_room_m_message_div"+jbSplit[1]).html("약속이 공유되었습니다.");
					                
					                
							}else{   $("#chat_box_ms").prepend('<div class="a"><div class="chat_box_p_div"><img src="http://cjhftp.dothome.co.kr/'+this.seller+'/profile/'+this.profile+'" ></div><div class="chat_box_m_div" > <span>'+this.chatmessage+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+this.datetime+'</span></div><div class="chat_box_m_div_read_div"><span class="chat_box_m_div_read_div_span"></span></div></div>');
				              }
	                       
		              }
		       	   });
	        	 }else if($(data).length == 0){
		     			/* $("#firstvalue").val($("#firstvalue").val()-15);
		     			$("#lastvalue").val($("#lastvalue").val()-15);
		     			console.log($(data).length);
		     			console.log(firstvalue);
		     			console.log(lastvalue); */
	     			
	     		}
	     	},
	        error : function() {
	           alert("request error!");
	        }
	           })  
		

	}

	//스크롤 닿으면 moredata
	$('.chat_box_ms').scroll(function() {
    	if (Math.round( $('.chat_box_ms').scrollTop()) == 0) {
    		moredata();
    	}
    })
});    
    

	//more data

	
	
</script>

<script>
</script>

</html>