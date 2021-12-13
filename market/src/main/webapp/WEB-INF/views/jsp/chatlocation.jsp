<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatlocation.css ">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
 <script src="http://cjhwebsocket.cafe24app.com:80/socket.io/socket.io.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatlocation.css ">
    <title>Document</title>
</head>
<body>
<!-- <form action="/chatcalendar" method="post"> -->
<form method="post">
    <div class="main">
        <div class="location_header">
        <input type="hidden" id="user1" name="user1" value="${chatList.user1 }">
        <input type="hidden" value="${chatList.user2 }">
        <input type="hidden" id="chatroomno" name="chatroomno" value="${chatList.chatroomno }">
        
        <input type="hidden" id="location" name="location" value='<%=request.getParameter("locationjsp")%>'>
        <input type="hidden" id="calendarLocation" value="${calendarLocation.locationno }">
            <div class="location_header_img">
                <img src="http://cjhftp.dothome.co.kr/ico/cross.png">
            </div>
            <div class="location_header_title">
            <c:set var="jstlTitle" value="${calendarLocation.locationtitle }"/>
            <c:if test="${not empty jstlTitle }">
                <input type="text" id="location_header_input" name="location_header_input" value="${calendarLocation.locationtitle }" readonly>
            </c:if>
            <c:if test="${empty jstlTitle }">
                <input type="text" id="location_header_input" name="location_header_input" placeholder="일정제목">
            </c:if>
            </div>
        </div>
        
        <div class="location_center">
            <div class="location_center_left">
                <table class="location_table">
                    <tr class="location_tr">
                        <th class="location_th"><img src="http://cjhftp.dothome.co.kr/ico/calendar (1).png"></th>
                         <c:set var="jstlDate" value="${calendarLocation.locationdate }"/>
                     <c:if test="${not empty jstlDate }">
                          <td class="location_td"><input name="jstl_location_date_input" class="jstl_location_date_input" id="jstl_location_date_input" type="text" value="${calendarLocation.locationdate }" readonly></td>
                     </c:if>
                     <c:if test="${empty jstlDate }">
                         <td class="location_td"><input name="location_date_input" class="location_date_input" id="location_date_input" type="date"></td>
                     </c:if>
                       
                    </tr>
                    
                    <tr class="location_tr">
                        <th class="location_th"><img src="http://cjhftp.dothome.co.kr/ico/placeholder.png"></th>
                        <td class="location_td">
                     <div class="map_wrap">
                         <div id="map" style="border-radius:5px;width:490px;height:340px;position:relative;overflow:hidden;"></div>
                     
                         <div id="menu_wrap" class="bg_white">
                             <div class="option">
                                 <div>
                                 
                                 <c:set var="jstlLocation" value="${calendarLocation.location }"/>
                                 <c:if test="${not empty jstlLocation }">
                                    <input type="hidden" id="calendarlocation" value="${calendarLocation.location }">
                                    약속장소 : <input type="text" value="" id="keyword" size="15"> 
                                    
                                 <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
                                    <script>
                                         const jstllocation = $('#calendarlocation').val();
                                     const jbSplit = jstllocation.split('//');
                                      $('#keyword').val(jbSplit[0]);       
                                         
                                    </script>
                                        
                                    
                                </c:if>
                                 <c:if test="${empty jstlLocation }">
                                      키워드 : <input type="text" value="" id="keyword" size="15" placeholder="키워드입력"> 
                                         <input type="button" value="검색하기" id="keywordbutton" onclick="searchPlaces()">
                                 </c:if>
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 </div>
                             </div>
                             <hr>
                             <ul id="placesList"></ul>
                             <div id="pagination"></div>
                         </div>
                     </div>
                           
                        </td>
                    </tr>
                    <tr class="location_tr">
                        <th class="location_th"><img src="http://cjhftp.dothome.co.kr/ico/map.png"></th>
                        
                        
                        
                        <c:set var="jstlLocation" value="${calendarLocation.location }"/>
                     	<c:if test="${not empty jstlLocation }">
							<input type="hidden" id="calendarlocation" value="${calendarLocation.location }">
							<td class="location_td"><input class="jstl_location_location_input" id="jstl_location_location_input" name="jstl_location_location_input" type="text" value="" readonly></td>
							<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
							<script>
		                        const jstllocation2 = $('#calendarlocation').val();
		                        const jbSplit2 = jstllocation2.split('//');
		                        $('#jstl_location_location_input').val(jbSplit2[0]);    
	                                         
		                    </script>
	                    
                     </c:if>
                     
                     <c:if test="${empty jstlLocation }">
                         <td class="location_td"><input class="location_location_input" id="location_location_input" name="location_location_input" type="text" value="" readonly></td>
                     </c:if>
                        
                        
                        
                        
                        
                    </tr>
                    <tr class="location_tr">
                        <th class="location_th" style="vertical-align: top; padding-top: 10px;"><img src="http://cjhftp.dothome.co.kr/ico/memo.png"></th>
                        
                        
                        <c:set var="jstlDescription" value="${calendarLocation.locationdescription }"/>
                     <c:if test="${not empty jstlDescription }">
                          <td class="location_td"><input style="background:rgb(218, 218, 218,0.5);" name="jstl_location_textarea" class="jstl_location_textarea" id="jstl_location_textarea" type="text" value="${calendarLocation.locationdescription }" readonly></td>
                     </c:if>
                     <c:if test="${empty jstlDescription }">
                         <td class="location_td" style="padding-top: 10px;"><textarea cols="66" rows="15" id="location_textarea" name="location_textarea" class="location_textarea" placeholder="설명추가"></textarea></td>
                     </c:if>
                        
                        
                        
                        
                    </tr>
                    <tr class="location_tr" id="location_submit_tr">
                        <th class="location_th"></th>
                        
                        
                        <c:set var="jstlTitle2" value="${calendarLocation.locationtitle }"/>
                     <c:if test="${empty jstlTitle2 }">
                          <td class="location_td"><input name="location_submit_input" class="location_submit_input" id="location_submit_input" type="submit" value="약속잡기" formaction="/chatcalendar"></td>
                     </c:if>
                     <c:if test="${not empty jstlTitle2 }">
                         <td class="location_td"><input name="jstl_location_submit_input" class="jstl_location_submit_input" id="jstl_location_submit_input" type="submit" value="달력보기" formaction="/chatcalendarview"></td>
                     </c:if>
                        
                        
                        
                        
                    </tr>
                </table>
            </div>
            <div class="location_center_right">
                <div class="location_memberlist">
                    <div class="location_memberlist_title">
                        <button class="location_memberlist_title_button" disabled>참석자</button>
                    </div>
                    <div class="location_memberlist_content">
                        <div class="location_memberlist_div">
                             <img src="http://cjhftp.dothome.co.kr/${chatList.user1}/profile/${chatList.profile}">
                            <a class="location_memberlist_span">${chatList.login }</a>
                        </div>
                        <div class="location_memberlist_div">
                             <img src="http://cjhftp.dothome.co.kr/${chatList.user2}/profile/${chatList.memberprofile}">
                            <a class="location_memberlist_span">${chatList.member}</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="coordinate" name="coordinate" value="">
</form>
</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb6a99631a16b1a22bae6ea2a8990dee&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
   console.log(places);
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
            
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
   
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
       
        
        
        
        (function(marker, title ) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
               
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onclick =  function () {
                var index = $("li").index(this);
                   
                 var xxx =places[index].x;
                 var yyy =places[index].y;
                 
                displayInfowindow(marker, title,xxx,yyy);
                
                console.log(index+":"+xxx+"/"+yyy);
                console.log("title "+title);
                $(".location_location_input").val(title);
                
                
                $('#coordinate').val(title+"//"+xxx+"//"+yyy);
                
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title ,xxx,yyy) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
    
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
$("li").click(function(){
    
 });
 
 
   /*socket*/
  
 $(function () {
    var today = new Date();
     var time = (today.getMonth()+1)+'.'+today.getDate()+' '+today.getHours()+':'+today.getMinutes();
     
     var date = document.querySelector('input[name="location_date_input"]');
     var location = document.querySelector('input[name="location_location_input"]');
     var coordinate = document.querySelector('input[name="coordinate"]');
     
     var user1 = $("#user1").val();
     var chatroomno = $("#chatroomno").val();
     
     var socket = io("http://cjhwebsocket.cafe24app.com:80"); 
     /* socket.emit("send_msg", "2//"+$("#roomno").val()+"//"+$("#loginmemberno").val()+"//"+$("#msg").val()+"//"+time); ****/
 
     
    $("#location_submit_input").on({
       'click':function() {
           /* socket.emit("send_msg", "2//2//47//약속이 공유되었습니다.//"+time+"//2//37.000//127.000//"+date+"//안양역//40"); */
         socket.emit("send_msg", "2//"+chatroomno+"//"+user1+"//약속이 공유되었습니다.//"+time+"//2//"+coordinate.value+"//"+date.value+"//"+Math.random().toString(36));

       }
   });
 
    
 }); 
 
 $("#keyword").keydown(function(key) {
		//해당하는 키가 엔터키(13) 일떄
		if (key.keyCode == 13) {
			//msg_process를 클릭해준다.
	    event.preventDefault();
			keywordbutton.click();
		}
	});
</script>
</html>