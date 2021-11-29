<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/chatcalendar.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
	
    <title>calendar</title>
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
                    $("#calendar_top_table #chatcalendar_top_tbody:last").append("<td class='chatcalendar_top_date'>"+ i +"</td>");
                    
                }
                
                console.log()
                
                $(".chatcalendar_top_date").append("<div class='chatcalendar_top_event'>d</div>");
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


       
        
    </script>

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
    
</div>
</body>
</html>