<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/chatcalendar.css?ver=1.1" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
   
    <title>calendar</title>
</head>
<body>
<div class="chatcalendar">
    <div class="chatcalendar_top">
        <table id="calendar_top_table">
            <thead>
                <tr>
                    <th><input name="chatcalendar_top_preMon" id="chatcalendar_top_preMon" type="button" value="<"></th>
                    <th colspan="5" class="calendar_top_year_mon"></th>
                    <th><input name="chatcalendar_top_nextMon" id="chatcalendar_top_nextMon" type="button" value=">"></th>
                </tr>
                <tr>
                    <th class="chatcalendar_top_day">일</th>
                    <th class="chatcalendar_top_day">월</th>
                    <th class="chatcalendar_top_day">화</th>
                    <th class="chatcalendar_top_day">수</th>
                    <th class="chatcalendar_top_day">목</th>
                    <th class="chatcalendar_top_day">금</th>
                    <th class="chatcalendar_top_day">토</th>
                </tr>
            </thead>
            <tbody id="chatcalendar_top_tbody">
            </tbody>
        </table>
    </div>
    <c:forEach items="${calendarList}" var="list" varStatus="status">
       <input type="hidden" id="calendarDate${status.count }" name="calendarDate" value="${list.locationdate }">
       <input type="hidden" id="calendarMember${status.count }" name="calendarMember" value="${list.member }">
       <input type="hidden" id="calendarTitle${status.count }" name="calendarTitle" value="${list.locationtitle }">
       <input type="hidden" id="calendarUser1${status.count }" name="calendarUser1" value="${list.user1 }">
       <input type="hidden" id="calendarUser2${status.count }" name="calendarUser2" value="${list.user2 }">
       <input type="hidden" id="calendarRoomno${status.count }" name="calendarRoomno" value="${list.chatroomno }">
       <input type="hidden" id="calendarLocationno${status.count }" name="calendarRoomno" value="${list.locationno }">
       
        <script>
        var count = ${status.count };
           var date = $("#calendarDate"+count).val();
          var now = date.substring(8,10);
          
          
       </script> 
    </c:forEach>
    
       
</div>
</body>

    <script>
        $(function(){
            var today = new Date();
            var date = new Date();           

            $("input[name=chatcalendar_top_preMon]").click(function() { // 이전달
                $("#calendar_top_table > #chatcalendar_top_tbody > td").remove();
                $("#calendar_top_table > #chatcalendar_top_tbody > tr").remove();
                today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
                buildCalendar();
            })
            
            $("input[name=chatcalendar_top_nextMon]").click(function(){ //다음달
                $("#calendar_top_table > #chatcalendar_top_tbody > td").remove();
                $("#calendar_top_table > #chatcalendar_top_tbody > tr").remove();
                today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
                buildCalendar();
            })


            function buildCalendar() {
                
                nowYear = today.getFullYear();
                nowMonth = today.getMonth();
                firstDate = new Date(nowYear,nowMonth,1).getDate();
                firstDay = new Date(nowYear,nowMonth,1).getDay(); //1st의 요일
                lastDate = new Date(nowYear,nowMonth+1,0).getDate();

                if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { //윤년 적용
                    lastDate[1]=29;
                }

                $(".calendar_top_year_mon").text(nowYear+"년 "+(nowMonth+1)+"월");

                for (i=0; i<firstDay; i++) { //첫번째 줄 빈칸
                    $("#calendar_top_table #chatcalendar_top_tbody:last").append("<td></td>");
                }
                for (i=1; i <=lastDate; i++){ // 날짜 채우기
                    plusDate = new Date(nowYear,nowMonth,i).getDay();
                    if (plusDate==0) {
                        $("#calendar_top_table #chatcalendar_top_tbody:last").append("<tr></tr>");
                    }
                    $("#calendar_top_table #chatcalendar_top_tbody:last").append("<td class='chatcalendar_top_date' id='chatcalendar_top_date"+ i +"'>"+ i +"</td>");


                   /*  var now = nowYear+"-"+(nowMonth+1)+"-"+i;
                    $("#test").val(now);
                    var calendarDate = $("#calendarDate").val(); */
                    
                }
                for(i=1;i<=lastDate;i++){
            if(i<10){
               if((nowMonth+1)<10){
                  var now = nowYear+"-0"+(nowMonth+1)+"-0"+i;
                  console.log("now:"+now);
                      for(j=1;j<=31;j++){
                         var calendarDate = $("#calendarDate"+j).val();
                         var calendarMember = $("#calendarMember"+j).val();
                         var calendarTitle = $("#calendarTitle"+j).val();
                         var user1 = $("#calendarUser1"+j).val();
                         var user2 = $("#calendarUser2"+j).val();
                         var calendarRoomno =  $("#calendarRoomno"+j).val();
                         var calendarLocationno = $("#calendarLocationno"+j).val();
                         var calendarLocationno= $("#calendarLocationno"+j).val();
                        /*  if(now===calendarDate){   $("#chatcalendar_top_date"+ i +"").append("<div class='testdong'><img id='carrotimg' src='http://cjhftp.dothome.co.kr/ico/carrot.png'><div style='display:inline;' class='chatcalendar_top_event'><a href='/chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+calendarRoomno+"&locationjsp=1&calendarLocationno="+calendarLocationno+"'> "+calendarTitle+"</a></div></div>");} */
                         /* if(now===calendarDate){   $("#chatcalendar_top_date"+ i +"").append("<a href='/chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+calendarRoomno+"&locationjsp=1&calendarLocationno="+calendarLocationno+"'><img id='carrotimg' src='http://cjhftp.dothome.co.kr/ico/carrot.png'><div class='testdong'><div style='display:inline;' class='chatcalendar_top_event'> "+calendarTitle+"</div></div></a>");} */
                         if(now===calendarDate){   $("#chatcalendar_top_date"+ i +"").append("<a href='/chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+calendarRoomno+"&locationjsp=1&calendarLocationno="+calendarLocationno+"'><div class='testdong'><span>ㆍ</span><div style='display:inline;' class='chatcalendar_top_event'> "+calendarTitle+"</div></div></a>");}
               }}else{
                  var now = nowYear+"-"+(nowMonth+1)+"-0"+i;
                  console.log("now:"+now);
                        for(j=1;j<=31;j++){
                           var calendarDate = $("#calendarDate"+j).val();
                           var calendarMember = $("#calendarMember"+j).val();
                           var calendarTitle = $("#calendarTitle"+j).val();
                         var user1 = $("#calendarUser1"+j).val();
                         var user2 = $("#calendarUser2"+j).val();
                         var calendarRoomno =  $("#calendarRoomno"+j).val();
                         var calendarLocationno= $("#calendarLocationno"+j).val();
                         if(now===calendarDate){   $("#chatcalendar_top_date"+ i +"").append("<a href='/chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+calendarRoomno+"&locationjsp=1&calendarLocationno="+calendarLocationno+"'><div class='testdong'><span>ㆍ</span><div style='display:inline;' class='chatcalendar_top_event'> "+calendarTitle+"</div></div></a>");}
               }}
               
            }else{  
               if((nowMonth+1)<10){var now = nowYear+"-0"+(nowMonth+1)+"-"+i;
                   for(j=1;j<=31;j++){
                      var calendarDate = $("#calendarDate"+j).val();
                      var calendarMember = $("#calendarMember"+j).val();
                      var calendarTitle = $("#calendarTitle"+j).val();
                      var user1 = $("#calendarUser1"+j).val();
                      var user2 = $("#calendarUser2"+j).val();
                      var calendarRoomno =  $("#calendarRoomno"+j).val();
                      var calendarLocationno= $("#calendarLocationno"+j).val();
                      if(now===calendarDate){   $("#chatcalendar_top_date"+ i +"").append("<a href='/chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+calendarRoomno+"&locationjsp=1&calendarLocationno="+calendarLocationno+"'><div class='testdong'><span>ㆍ</span><div style='display:inline;' class='chatcalendar_top_event'> "+calendarTitle+"</div></div></a>");}
                   }}else{var now = nowYear+"-"+(nowMonth+1)+"-"+i;
                   for(j=1;j<=31;j++){
                      var calendarDate = $("#calendarDate"+j).val();
                      var calendarMember = $("#calendarMember"+j).val();
                      var calendarTitle = $("#calendarTitle"+j).val();
                      var user1 = $("#calendarUser1"+j).val();
                      var user2 = $("#calendarUser2"+j).val();
                      var calendarRoomno =  $("#calendarRoomno"+j).val();
                      var calendarLocationno= $("#calendarLocationno"+j).val();
                      if(now===calendarDate){   $("#chatcalendar_top_date"+ i +"").append("<a href='/chatlocation?user1="+user1+"&user2="+user2+"&chatroomno="+calendarRoomno+"&locationjsp=1&calendarLocationno="+calendarLocationno+"'><div class='testdong'><span>ㆍ</span><div style='display:inline;' class='chatcalendar_top_event'> "+calendarTitle+"</div></div></a>");}
                   }}   
            
               
                   console.log(now);}
                }
                
                
         /* if(now=calendarDate){ */
         
         
                
                if($("#calendar_top_table > #chatcalendar_top_tbody > td").length%7!=0) { //마지막 줄 빈칸
                    for(i=1; i<= $("#calendar > #chatcalendar_top_tbody > td").length%7; i++) {
                        $("#calendar_top_table #chatcalendar_top_tbody:last").append("<td></td>");
                    }
                }
                $(".chatcalendar_top_date").each(function(index){ // 오늘 날짜 표시
                    if(nowYear==date.getFullYear() && nowMonth==date.getMonth() && $(".chatcalendar_top_date").eq(index).text()==date.getDate()) {
                        $(".chatcalendar_top_date").eq(index).css("background-color","rgb(235, 206, 188,0.8)");
                    }
                }) 
            }
            buildCalendar();


        })


       $(".chatcalendar_top_event").html();
        
    </script>

</html>