<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatlocation.css ">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* .main{
            margin-left: auto;
            margin-right: auto;
        } */
        .main{
            
        }
        .location_header{
            border-bottom: 2px gray solid;
            width:1100px;
            height: 80px;
            padding-bottom:2px;
        }
        .location_header_img{
            width:80px;
            height: 80px;
            float: left;
            text-align: center;
            line-height: 90px;
        }
        
        .location_header_title{
            width: 1000px;
            height: 80px;
            float:right;
            
            line-height: 80px;
        }
        #location_header_input{
            height: 80px;
            width:800px;
            font-size: 20px;
            font-weight: bold;
            border:none;
        }
        #location_header_input:focus{
            outline:none;
        }
        .location_center{
            
        }
        .location_center{
            width:1070px;
            height: 460px;
            padding-top: 5px;
        }
        .location_center_left{
            width:730px;
            height: 460px;
            float: left;
            padding-top:10px;
        }
        .location_date_input{
            height: 35px;
            border:rgb(179, 177, 177) 2px solid;
            border-radius: 5px;
        }
        .location_location_input{
            height: 35px;
            border:rgb(179, 177, 177) 2px solid;
            border-radius: 5px;

        }
        .location_th{
            width:80px;
            height: 50px;
            color:rgb(136, 136, 136);
        }
        .location_textarea{
            resize: none;
            border:rgb(179, 177, 177) 2px solid;
            border-radius: 5px;
        }
        .location_textarea:focus{
            outline: none;
        }

        /* right */
        
        .location_center_right{
            width:300px;
            height: 460px;
            float: right;
        }
        .location_memberlist{
            width:300px;
            height: 460px;

        }
        .location_memberlist_title{
            width:280px;
            height: 60px;
            border:rgb(179, 177, 177) 2px solid;
            border-radius: 5px;
            text-align: center;
            line-height: 60px;
            margin: 5px;
        }
        .location_memberlist_title_button{
            width:250px;
            height: 50px;
            font-size: 20px;
            background-color: white;
            color: gray;
            font-weight: bold;
            border:none;
        }
        .location_memberlist_content{

        }
        .location_memberlist_img{
            width:40px;
            height: 40px;
        }
        .location_memberlist_div{
            margin-left:20px;
            margin-top:20px;
            height: 40px;
            /* align-items: center; */
        }
        .location_memberlist_span{
            /* text-align: center;*/
            /* line-height: 40px; 
            margin:0 auto; */
        }
       .location_location_input{
       		background:rgb(218, 218, 218,0.5);
       }
       .location_submit_input{
       		background:white;
       		border:none;
       		color:gray;
       		font-weight:border;
       }
       
       
       /* map */
       
       .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:500px;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
    </style>
</head>
<body>
<form action="/chatcalendar" method="post">
    <div class="main">
        <div class="location_header">
        <input type="text" value="${login }">
        <input type="text" value="${chatList.member }">
        <input type="text" value="${chatList.profile }">
            <div class="location_header_img">
                <img src="http://cjhftp.dothome.co.kr/ico/cross.png">
            </div>
            <div class="location_header_title">
                <input type="text" id="location_header_input" name="location_header_input" placeholder="일정제목">
            </div>
        </div>
        
        <div class="location_center">
            <div class="location_center_left">
                <table class="location_table">
                    <tr class="location_tr">
                        <th class="location_th">일시</th>
                        <td class="location_td"><input name="location_date_input" class="location_date_input" id="location_date_input" type="date"></td>
                    </tr>
                    
                    <tr class="location_tr">
                        <th class="location_th">지도</th>
                        <td class="location_td">
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							
							    <div id="menu_wrap" class="bg_white">
							        <div class="option">
							            <div>
							                    키워드 : <input type="text" value="" id="keyword" size="15" placeholder="키워드입력"> 
							                    <input type="button" value="검색하기" onclick="searchPlaces()">
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
                        <th class="location_th">장소</th>
                        <td class="location_td"><input class="location_location_input" id="location_location_input" name="location_location_input" type="text" value="" readonly></td>
                        
                    </tr>
                    <tr class="location_tr">
                        <th class="location_th" style="vertical-align: top; padding-top: 10px;">설명</th>
                        <td class="location_td" style="padding-top: 10px;"><textarea cols="70" rows="15" id="location_textarea" name="location_textarea" class="location_textarea" placeholder="설명추가"></textarea></td>
                    </tr>
                    <tr class="location_tr">
                        <th class="location_th"></th>
                        <td class="location_td"><input name="location_submit_input" class="location_submit_input" id="location_submit_input" type="submit" value="약속잡기"></td>
                    </tr>
                </table>
            </div>
            <div class="location_center_right">
                <div class="location_memberlist">
                    <div class="location_memberlist_title">
                        <button class="location_memberlist_title_button">참석자</button>
                    </div>
                    <div class="location_memberlist_content">
                        <div class="location_memberlist_div">
                            <img class="location_memberlist_img" src="http://cjhftp.dothome.co.kr/ico/duck.jpg">
                            <span class="location_memberlist_span">${chatList.login }</span>
                        </div>
                        <div class="location_memberlist_div">
                            <img class="location_memberlist_img" src="http://cjhftp.dothome.co.kr/ico/duck.jpg">
                            <span class="location_memberlist_span">${chatList.member}</span>
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
                
                
                $('#coordinate').val(title+"/"+xxx+"/"+yyy);
                
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
</script>
</html>