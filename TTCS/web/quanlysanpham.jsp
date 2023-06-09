<%-- 
    Document   : quanlysanpham
    Created on : May 21, 2023, 12:52:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý sản phẩm</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css"/>
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

            .adminsp .dssp .thaotac ul{
                list-style: none;
                padding: 0;
            }

            .adminsp .dssp .thaotac li {
                display: inline-block;
                width: 50px;
            }

            .adminsp .dssp .thaotac .thaotac_1 {
                width: 110px;
            }

            .adminsp .dssp .thaotac a {
                display: block;
                padding: 3px;
                text-decoration: none;
                color: white;
                border-radius: 5px;
            }

            .adminsp .dssp .thaotac .color_1 {
                border: 1px solid rgb(19, 162, 218);
                background-color: rgb(19, 162, 218);
            }

            .adminsp .dssp .thaotac .color_1:hover{
                background-color: rgb(15, 131, 177);
            }

            .adminsp .dssp .thaotac .color_2 {
                border: 1px solid rgb(1, 42, 179);
                background-color: rgb(1, 42, 179);
            }

            .adminsp .dssp .thaotac .color_2:hover{
                background-color: rgb(0, 28, 119);
            }

            .adminsp .dssp .thaotac .color_3 {
                border: 1px solid rgb(229, 54, 54);
                background-color: rgb(229, 54, 54);
            }

            .adminsp .dssp .thaotac .color_3:hover{
                background-color: rgb(187, 42, 42);
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
        <%@include file="headadmin.jsp" %>
        <div class="adminsp">
            <br/>
            <h2>QUẢN LÝ SẢN PHẨM </h2>
            <div class="timkiem">
                <form action="qlsp" method="post">
                    <input type="text" class="timkiem_sp" name="seach" placeholder="Nhập tên hoặc loại sản phẩm"/>
                    <input type="submit" class="timkiem_sm" value="Tìm kiếm"/>
                </form>
            </div>
            <div class="themsp">
                <a href="qlsp?action=themsp">Thêm sản phẩm</a>
            </div>
            <div class="dssp">
                <table>
                    <tr>
                        <th style="width: 5%;">STT</th>
                        <th style="width: 10%;">Hình ảnh</th>
                        <th style="width: 30%;">Tên sản phẩm</th>
                        <th style="width: 15%;">Giá tiền</th>
                        <th style="width: 10%;">Số lượng</th>
                        <th>Thao tác</th>
                    </tr>
                    <c:set value="1" var="i"/>
                    <c:forEach items="${requestScope.dssp}" var="pro">
                        <tr>
                            <td>${i}</td>
                            <c:set value="${i+1}" var="i"/>
                            <td><img src="img/product/${pro.imagePro}" alt="${pro.namePro}"/></td>
                            <td>${pro.namePro}</td>
                            <td>$ <fmt:formatNumber value="${pro.price}" pattern="###,###,###" /> </td>
                            <td>${pro.quantity}</td>
                            <td class="thaotac">
                                <ul>
                                    <li class="thaotac_1"><a href="qlsp?action=xemsp&ProId=${pro.proId}" class="color_1">Xem chi tiết</a></li>
                                    <li><a href="qlsp?action=suasp&ProId=${pro.proId}" class="color_2">Sửa</a></li>
                                    <li><a href="qlsp?action=xoasp&ProId=${pro.proId}" onclick="return confirm('Bạn có chắc chắn muốn xóa?')" class="color_3">Xóa</a></li>
                                </ul>   
                            </td>
                        </tr>
                    </c:forEach>

                </table>

                <c:set value="${requestScope.page}" var="page"/>
                <div class="trang">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <a class="${i==page?"active":""}" href="qlsp?page=${i}" >${i}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="mess_success" id="message">
            <h1>${sessionScope.success}</h1>
        </div>

        <c:if test="${sessionScope.success != null}">
            <script type="text/javascript">
                function showMessageSuccess(time) {
                    var successMess = document.getElementById('message');
                    successMess.style.display = 'block';
                    setTimeout(function () {
                        successMess.style.display = 'none';

                    }, time);
                }

                showMessageSuccess(2000);
            </script>

            <% session.removeAttribute("success"); %>
        </c:if>
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