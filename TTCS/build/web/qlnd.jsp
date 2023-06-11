<%-- 
    Document   : quanlysanpham
    Created on : May 21, 2023, 12:52:41 AM
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
    <title>Quản lý thông tin khách hàng</title>
    <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    <style>
        .adminsp {    
            width: 70%;
            margin-top: 70px;
            margin-left: 250px;
            text-align: center;
            overflow: auto;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: rgb(246, 232, 232);
            padding-bottom: 30px;
            min-height: 600px;	
        }
        
        .adminsp h2{
            margin: 20px;
        }

        .adminsp .timkiem {
        }

        .adminsp .timkiem .timkiem_sp {
            width: 300px;
            height: 40px;
            font-size: 16px;
            border: 2px solid black;
            border-radius: 5px;
        }

        .adminsp .timkiem .timkiem_sm {
            width: 80px;
            height: 40px;
            font-size: 14px;
            background-color: blue;
            color: white;
            border: blue;
            border-radius: 5px;
            
        }

        .adminsp .timkiem .timkiem_sm:hover {
            background-color: rgb(3, 3, 193);
        }

        .adminsp .themsp {
            margin: 20px;
            width: 150px;
            float: right;
            margin-right: 60px;
        }

        .adminsp .themsp a {
            border: 1px solid rgb(2, 159, 202);
            background-color: rgb(2, 159, 202);
            border-radius: 5px;
            display: block;
            padding: 5px;
            font-weight: bold;
            text-decoration: none;
            color: white;

        }

        .adminsp .themsp a:hover {
            background-color: rgb(0, 119, 152);
        }

        .adminsp .dssp table {
            border-collapse: collapse;
            width: 90%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            background-color: white;
        }

        .adminsp .dssp tr {
            border-bottom: 1px solid #ddd;
        }

        .adminsp .dssp table tr:hover {
            background-color: #e2f7f9;
        }


        .adminsp .dssp .thaotac a {
            display: block;
            padding: 3px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            width: 110px;
            margin: auto;
            margin-top: 7px;
            margin-bottom: 7px;
        }

        .adminsp .dssp .thaotac .color_1 {
            border: 1px solid rgb(19, 162, 218);
            background-color: rgb(19, 162, 218);
        }

        .adminsp .dssp .thaotac .color_1:hover{
            background-color: rgb(15, 131, 177);
        }

        .adminsp .dssp img {
            display: block;
            width: 70px;
            height: 80px;
            border: 1px solid black;
            margin: 10px;
        }
        
        .adminsp .trang a{
            display: inline-block;
            padding: 5px;   
            text-decoration: none;
            font-weight: bold;
            color: gray;
        }
        
        .adminsp .trang a:hover {
            color: black;
        }
        
        .adminsp .trang a.active {
            color: red;
        }
        
        .mess_success {
            background-color: rgba(133, 235, 233,0.8); /* Màu xanh lá cây với độ mờ 50% */
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
    <jsp:include page="headadmin.jsp"></jsp:include>

    <div class="adminsp">
        <br/>
        <h2>THÔNG TIN KHÁCH HÀNG </h2>
        <div class="timkiem">
            <form action="qlnd" method="post">
                <input type="text" class="timkiem_sp" name="search" placeholder="Nhập tên khách hàng"/>
                <input type="submit" class="timkiem_sm" value="Tìm kiếm"/>
            </form>
        </div>

        <div class="dssp">
            <table>
                <tr>
                    <th style="width: 5%;">STT</th>
                    <th style="width: 20%;">Tên khách hàng</th>
                    <th style="width: 15%;">Email</th>
                    <th style="width: 15%;">Số điện thoại</th>
                    <th style="width: 20%;">Địa chỉ nhận hàng</th>
                    <th>Thao tác</th>
                </tr>
            <c:set value="1" var="i"/>
           	<c:forEach items="${requestScope.dsnd}" var="nd" >
           		<tr>
           			<td>${i}</td>
                    <c:set value="${i+1}" var="i"/>
           			<td>${nd.fullname }</td>
           			<td>${nd.email }</td>
           			<td>${nd.phoneNumber }</td>
           			<td>${nd.address }</td>
           			<td class="thaotac"><a href="xemnd?UserId=${nd.userId }&Name=${nd.fullname}" class="color_1">Xem chi tiết</a></td>
           		</tr>
           	</c:forEach>
                    
            </table>
                
        </div>
    </div>
                 <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/signin.js"></script>
  
                
</body>
</html>