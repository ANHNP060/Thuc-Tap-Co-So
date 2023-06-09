<%-- 
    Document   : qlsp_themsp
    Created on : May 21, 2023, 12:08:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sản phẩm</title>
    <style>
        .themsp{
            width: 70%;
            margin-top: 70px;
            margin-left: 250px;
            padding-top: 30px;
            overflow: auto;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: rgb(246, 232, 232);  
        }
        
        .themsp h2 a {
            text-decoration: none;
            color:red;
            margin-left: 20px;
        }

        .themsp h2 a:hover{
            color: #cc0033;
        }
        
        .themsp .td {
            margin: 20px;
            text-align: center;
        }
        
        .mess_success {
            background-color: rgba(133, 235, 233,0.8); 
            color: white;
            padding: 10px;
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 400px;
            min-height: 200px;
            line-height: 200px;
            text-align: center;
            border-radius: 20px;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <%@include file="headadmin.jsp" %>
    <div class="themsp">
        <h2><a href="qlsp">Sản phẩm</a> >> Thêm</h2>
        <hr>
        <h2 class="td">THÊM SẢN PHẨM</h2>
        
         <div class="mess_success" id="message">
                <h1>${requestScope.error}</h1>
            </div>

        <c:if test="${requestScope.error != null}">
            <script type="text/javascript">
                function showMessageSuccess(time){
                    var successMess = document.getElementById('message');
                    successMess.style.display = 'block';
                    setTimeout(function() {
                        successMess.style.display = 'none';

                    }, time);
                }

                showMessageSuccess(2000);
            </script>
        </c:if>
    <jsp:include page="qlsp_sp.jsp"></jsp:include>
    </div>
</body>
</html>
    