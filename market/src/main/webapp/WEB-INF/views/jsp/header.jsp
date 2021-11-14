<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css " >
</head>


<body>
    <header>
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
           		<input class="header_chatting_btn" type="button" value="로그인">
                <input class="header_chatting_btn" type="button" value="당근채팅">
            </div>
        </nav>





      </header>
