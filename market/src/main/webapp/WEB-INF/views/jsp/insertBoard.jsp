<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertBoard.css?ver=1.1 ">

<form action="/insertBoard" method="post" id="insertBoard" name="insertBoard" enctype="multipart/form-data">
    <main class="insertboard">
    <input type="hidden" value="${memberVO.memberno}" id="memberno" name="memberno">
        <div class="insertboard_insertboard">
            <div class="insertboard_insertboard_div">
                <div class="insertboard_insertboard_img_div">
                    <input type="file" name="input_imgs" id="input_imgs" maxlength="5" style="display: none;" multiple />
                    <div class="insertboard_insertboard_img_label_div">
                        <label class="insertboard_insertboard_img_div_label" for="input_imgs">
                            <img src="${pageContext.request.contextPath}/resources/image/camera.png"><br>
                            <span class="insertboard_insertboard_img_div_label_p_update">0</span>
                            <span class="insertboard_insertboard_img_div_label_p_limit">/ 5</span>
                        </label>
                    </div>
                    <div class="insertboard_insertboard_img_div_imgs_wrap" id="imgs_wrap"></div>
                    <div style="clear:both"></div>
                </div>
                <div class="insertboard_insertboard_content_div" style="display:inline;">
                    <hr>
                    <input type="text" name="title" id="insertboard_insertboard_content_title" value="" placeholder="글 제목">
                    <hr>
                    <div class="insertboard_insertboard_content_div_category">
                        <!-- onclick="location.href='categoryList.html'" data-transition="slide" -->
                        <input type="text" name="category" id="insertboard_insertboard_category" value="카테고리 선택">
                        <span style="float: right;">&#10095;</span>
                    </div>
                    <hr>
                    <input type="number" id="insertboard_insertboard_price" value="" placeholder="&#8361; 가격" name="price">
                    <span style="float: right;">원</span>
                    <hr>
                    <textarea style="width:100%;" rows="10"
                        placeholder="${memberVO.address }에 올릴게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)" value="" id="insertboard_insertboard_content" name="content"></textarea>
                </div>
                <div class="insertboard_insertboard_submitButton_div">

                    <input type="button" value="완료" class="insertBoard_submit_button" id="insertBoard" onclick="boardSubmit()">

                </div>
            </div>

        </div>
        <div class="insertboard_insertboard_category">
            <div class="category">
                <div class="categoryList"><img src="${pageContext.request.contextPath}/resources/image/privious.png"></div>
                <div class="categoryTitle">카테고리 선택</div>
                <hr>
                <div class="categoryList" id="디지털기기">디지털기기</div>
                <hr>
                <div class="categoryList" id="생활가전">생활가전</div>
                <hr>
                <div class="categoryList" id="가구/인테리어">가구/인테리어</div>
                <hr>
                <div class="categoryList" id="유아">유아</div>
                <hr>
                <div class="categoryList" id="의류">의류</div>
                <hr>
                <div class="categoryList" id="반려동물용품">반려동물용품</div>
                <hr>
                <div class="categoryList" id="식물">식물</div>
                <hr>
                <div class="categoryList" id="도서/티켓/음반">도서/티켓/음반</div>
                <hr>
            </div>
        </div>
    </main>
          <footer class="footer">

      </footer>
</form>
</body>
<script>
    $(function () {
        $(".insertboard_insertboard_category").hide();
        $(".insertboard_insertboard_content_div_category").click(function () {
            $(".insertboard_insertboard").hide();
            $(".insertboard_insertboard_category").show();
        })
        $(".categoryList").click(function () {
            var ca = $(this).attr('id');
            console.log(ca);
            document.getElementById("insertboard_insertboard_category").value=ca;
            $(".insertboard_insertboard").show();
            $(".insertboard_insertboard_category").hide();
        })
    })




    function readMultipleImage(input) {
        const multipleContainer = document.getElementById("imgs_wrap")
      $('.column').remove();
        // 인풋 태그에 파일들이 있는 경우
        if (input.files) {
            // 이미지 파일 검사 (생략)
            console.log(input.files)
            // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
            const fileArr = Array.from(input.files)
            const $colDiv1 = document.createElement("div")
            $colDiv1.classList.add("column")
            fileArr.forEach((file, index) => {
               if(index<5){
                  const reader = new FileReader()
                  const input = document.createElement('input');
                  input.setAttribute("type","image");
                  input.setAttribute("name",index);
                  input.setAttribute("value",index);
                  input.setAttribute("id","deleteImgBtn");
                  input.setAttribute("src","http://cjhftp.dothome.co.kr/ico/cross.png");
                  input.setAttribute("style","width:17px; height:17px;");
                    $colDiv1.appendChild(input)
                  
                    const $img = document.createElement("img")
                     $img.setAttribute("id","deleteimg"+index)
                    $img.alt = file.name
                    $img.classList.add("imagenum")
                    
                    $colDiv1.appendChild($img)
                    reader.onload = e => {
                        $img.src = e.target.result
                    }
                    console.log("파일이름: " + file.name)
                    reader.readAsDataURL(file)
                  
               }else{alert("사진등록은 5장까지 가능합니다.")
                   location.href("insertBoard");}
                
            })
            console.log(fileArr.length);
            $(".insertboard_insertboard_img_div_label_p_update").html(fileArr.length);
            multipleContainer.appendChild($colDiv1)
             /* if(fileArr.length>5){
               alert("사진등록은 5장까지 가능합니다.")
               location.href("insertBoard");
            } else */
               if(fileArr.length==0){
               alert("사진은 한 개 이상 등록해야합니다.")
               location.href("insertBoard");
            } 
        }
    }
    
    $(document).on("click","#deleteImgBtn",function(){
       var num = $(this).val(); 
       console.log(num);
       $('#deleteimg'+num).remove();
       $(this).remove();
       

        var imgnum = $(".imagenum").length;
        $(".insertboard_insertboard_img_div_label_p_update").html(imgnum);
    })
   
    
    const inputMultipleImage = document.getElementById("input_imgs")
    inputMultipleImage.addEventListener("change", e => {
        readMultipleImage(e.target)
    })


   function test() {
       event.preventDefault();    
      var length = document.getElementsByClassName("image").length
      //사진 개수 chk
      
      var title = document.getElementById("insertboard_insertboard_content_title").value
       var category = document.getElementById("insertboard_insertboard_category").value
       var content = document.getElementById("insertboard_insertboard_content").value
       var price = document.getElementById("insertboard_insertboard_price").value
       var today = new Date();
   
       var year = today.getFullYear();
       var month = ('0' + (today.getMonth() + 1)).slice(-2);
       var day = ('0' + today.getDate()).slice(-2);
   
       var hours = ('0' + today.getHours()).slice(-2); 
       var minutes = ('0' + today.getMinutes()).slice(-2);
       var seconds = ('0' + today.getSeconds()).slice(-2); 
   
       var datetime = year + '/' + month  + '/' + day + ' '+ hours + ':' + minutes  + ':' + seconds;
       console.log(datetime);
   
      
      $.ajax({
         url : 'insertBoard',
         method : 'POST',
         data : 'memberno=25&title=' +title+'&category='+category+'&datetime='+datetime+ '&content='+content+'&price='+price,
         type : "POST",
         success : function(data){
            console.log(length);
            console.log(data);
             for (let i = 1; i <= length; i++) {
   
               var imagename = jQuery(".image").eq(i-1).attr("alt");
               $.ajax({
                  url:'insertBoardImage',
                  enctype: 'multipart/form-data',  
                  method : 'POST',
                  data :'imageindex='+i+'&memberno=25&boardno='+data+'&imagename='+imagename,
                  type:'POST',
                  success:function(data){
                     
                  }
               }) 
             
            }
             alert("success");
         }
      
      })

      
    //ajax 먼저 board생성-> select 아이디로 최신의 boardno 찾아서 -> 

    //var rr =;//success
    //var length = document.getElementsByClassName("image").length

    console.log(length);
    for (let i = 1; i < length - 1; i++) {

        console.log(jQuery(".image").eq(i).attr("alt"))
        //boardno 가지고 image insert
    }
   /*  document.formm.action = "/insertBoardImage";
       document.formm.submit(); */
}
    function boardSubmit(){
          var str = $("#insertboard_insertboard_content").val();

           str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
           $("#insertboard_insertboard_content").val(str);
         $("#insertBoard").submit();

    }
</script>
</html>