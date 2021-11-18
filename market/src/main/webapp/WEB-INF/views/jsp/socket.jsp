<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%response.setHeader("Access-Control-Allow-Origin","*"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>소켓 서버</title>
    </head>
    <body>
    
    
        <script src="http://cjhwebsocket.cafe24app.com/socket.io/socket.io.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
        <script>
            $(document).ready(function(){
                var socket = io("http://cjhwebsocket.cafe24app.com:80");
            });
        </script>
    </body>
</html>
