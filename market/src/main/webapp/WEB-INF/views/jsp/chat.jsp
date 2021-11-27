<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cjhwebsocket.cafe24app.com:80/socket.io/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<style>


</style>
<body>

    <header>
    	<div style="display:none;">
       		 <label>MemberNO : </label><input id="memberno" type="text" value="${boardMemberno} "><br>
      	 	 <label>RoomNO : </label><input id="roomno" type="text" value="${boardBoardno}"><br>
      		 <label>LoginMemberNO : </label><input id="loginmemberno" type="text" value="${loginMemberno}"><br>
        </div>
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
                        <img class="header_login_div_profile" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_256_disabled-97ac2510cb2860b9e37caf23beb1e8e0ca130152a119b65402c4673af18bf2a1.png">
                        <span>최정환</span>
                        <img class="header_login_div_down"  src="https://cdn-icons.flaticon.com/png/512/2985/premium/2985150.png?token=exp=1637135271~hmac=3f62a84e9d5a4112839b78e572418d09" >
                    </div>

                                
                    
                    
                </div>
            </nav>


      </header>


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
                            <img id="readm_img" class="readm_img" src="http://cjhftp.dothome.co.kr/ico/tick2.png">
                        </div>
                    
                </div>
                <!-- 여기서 부터 사람 한명 -->
                <c:forEach items="${mychatList}" var="chatVO">
	                <div class="chat_user_list_room">
		                    <a id="chatroomno" class="chatroom${chatVO.chatroomno }" >
		                    <span class="boardMemberno" style="display:none;">${chatVO.user2}</span>
		                    <span class="boardRoomno" style="display:none;">${chatVO.chatroomno}</span>
		                        <div class="chat_user_list_room_m">
		                            <div class="chat_user_list_room_m_img_div">
<%-- 		                            <c:choose>
									         <c:when test="${sessionScope.memberVO==null}"> --%>
									         	  <img src="http://cjhftp.dothome.co.kr/${chatVO.user2}/profile/${chatVO.profile}">
	<%-- 								     </c:when>
							         	</c:choose> --%>
		                                
		                            </div>
		                            <div class="chat_user_list_room_m_center_div">
		                                <div class="chat_user_list_room_m_member_div">
		                                    <span>${chatVO.name }</span>	
		                                    <span> · </span>
		                                    <span>${chatVO.datetime } </span>
		                                </div>
		                                <br>
		                                <div class="chat_user_list_room_m_message_div">
		                                    <span>
		                                        ${chatVO.chatmessage }
		                                    </span>
		                                </div>
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
                    <img class="chat_box_user_img" src="">
                </div>
                <div>
                    <span>최정환</span>
                </div>
                
            </div>
            <div id="chat_box_ms" class="chat_box_ms">
            </div>
            <div class="chat_box_send_div">
                <div class="chat_box_send_text_div">
                    <input type="text" id="msg" placeholder="메세지를 입력해보세요.">
                </div>
                <div class="chat_box_send_btn_div">
                    <button id="msg_process">전송</button>
                </div>
            </div>
        </div>
        
    </div>
    
    <input type="button" value="약속잡기" onclick="open2()">

</body>
<script>
	function open2(){
	    
		window.open("/chatlocation", "_blank", "width=1100, height=700,toolbar=no,location=no,resizable=no,left=30,top=30,menubar=no" ); 
	
	}

    $('.chat_user_readm div').on({ 
        'click': function(){
            if(jQuery('#readm_img').attr("src")=='http://cjhftp.dothome.co.kr/ico/tick.png'){
                $('#readm_img').attr('src','http://cjhftp.dothome.co.kr/ico/tick2.png');
            }else if(jQuery('#readm_img').attr("src")=='http://cjhftp.dothome.co.kr/ico/tick2.png'){
                $('#readm_img').attr('src','http://cjhftp.dothome.co.kr/ico/tick.png');
            }           
        } 
    });

    $(document).ready(function() {
            var socket = io("http://cjhwebsocket.cafe24app.com:80");
 
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

                //time 
                let today = new Date();
                let time = (today.getMonth()+1)+'.'+today.getDate()+' '+today.getHours()+':'+today.getMinutes();
                //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                socket.emit("send_msg", $("#roomno").val()+"//"+$("#memberno").val()+"//"+$("#msg").val()+"//"+time);

                //ajax insert sql 


                //#msg에 벨류값을 비워준다.
                $("#msg").val("");
            });
 
            //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
            socket.on('send_msg', function(msg) {
                var jbSplit = msg.split('//');
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                console.log(msg)
                    
                if($("#roomno").val()==jbSplit[0]){    
                    if($("#memberno").val()==jbSplit[1]){
                        $('<div class="b"><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+jbSplit[3]+'</span></div><div class="chat_box_m_div" ><span>'+jbSplit[2]+'</span></div><div class="chat_box_p_div"><img></div></div>').appendTo("#chat_box_ms");
                    }else{
                        $('<div class="a"><div class="chat_box_p_div"><img src="" ></div><div class="chat_box_m_div" > <span>'+jbSplit[2]+'</span></div><div class="chat_box_m_div_time_div"><span class="chat_box_m_div_time" >'+jbSplit[3]+'</span></div></div>').appendTo("#chat_box_ms");
                    }
                }    

                //스크롤 자동으로 내려가기
                $('#chat_box_ms').stop().animate({scrollTop:$('#chat_box_ms')[0].scrollHeight},1000)
            });

            
        });
    $("a").click(function() {
        var myClass = $(this).attr("class");
        console.log(myClass);
        console.log($("."+myClass).children('.boardMemberno').html());
        console.log($("."+myClass).children('.boardroomno').html());
		
        var boardMemberno = $("."+myClass).children('.boardMemberno').html()
        var boardRoomno = $("."+myClass).children('.boardRoomno').html()
        
        $("#memberno").val(boardMemberno);
        $("#roomno").val(boardRoomno);
        
        
        $.ajax({
            url : 'addwish',
            method : 'POST',
            data : 'memberno=' + memberno + '&boardno=' + boardno,
            type : "POST",

            success : function(data) {
                 alert("해당 상품을 찜했습니다.")
                
         },
            error : function() {
               alert("request error!");
            }
         })  
        
    });	


</script>
</html>