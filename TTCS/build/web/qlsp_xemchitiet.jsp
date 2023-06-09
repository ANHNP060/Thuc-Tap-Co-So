<%-- 
    Document   : qlsp_xemchitiet
    Created on : May 21, 2023, 1:17:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set var="p" value="${requestScope.pro}" />
        <c:set var="d" value="${requestScope.des}" />
        <title>${p.namePro}</title>
            <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"> 
        <style>
            .xemchitiet {
                width: 70%;
                margin-left:250px;
                margin-top: 100px;
            }
            
            .xemchitiet .product h2 a {
                text-decoration: none;
                color:red;
            }
            
            .xemchitiet .product h2 a:hover{
                color: #cc0033;
            }
            
            .xemchitiet .nut {
                width: 200px;
                font-size: 25px;
                text-align: center;
                float: left;
                margin-left: 150px;
                margin-right: 150px;
                margin-bottom: 100px;
            }
            
            .xemchitiet .color_1 a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: white;
                border: 1px solid #485fc7;
                font-weight: bold;
                border-radius: 10px;
                background-color: #485fc7;
            }
            
            .xemchitiet .color_1 a:hover {
                background: blue;
            }
            
            .xemchitiet .color_2 a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: white;
                border: 1px solid red;
                font-weight: bold;
                border-radius: 10px;
                background-color: red;
            }
            
            .xemchitiet .color_2 a:hover {
                background: #cc0033;
            }

            
            .xemchitiet .product {
                margin-bottom: 100px;
                font-family: Tahoma, Geneva, sans-serif;
                overflow: auto;
                background: rgb(253, 243, 243);
                box-shadow: 0 1px 2px 0 rgb(60 64 67/ 10%), 0 2px 6px 2px
                        rgb(60 64 67/ 15%);
            }
            
            .xemchitiet .product h3 {
                margin: 10px;
            }

            .xemchitiet .product_name {
                    margin: 50px 50px 0px 50px;
            }

            .xemchitiet .product hr {
                    border: 1px solid gray;
            }
            
            .xemchitiet .box {
                float: left;
            }

            .xemchitiet .product_img {
                    width: 350px;
                    height: 400px;
                    margin: 50px 50px 20px 50px;
                    padding: 25px;
                    border-radius: 20px;
                    background: white;
                    box-shadow: 0 1px 2px 0 rgb(60 64 67/ 10%), 0 2px 6px 2px
                            rgb(60 64 67/ 15%);
            }
            
            .xemchitiet .product_img img {
                    width: 100%;
                    margin-bottom: 20px;
            }

            .xemchitiet .product_order_price {
                margin: 50px 50px 20px 50px;
                width: 350px;
                border-radius: 10px;
                font-size: 23px;
                background: white;
            }

            .xemchitiet .product_order_price label {
                    margin-left: 30px;
                    margin-right: 20px;
                    line-height: 70px;
            }

            .xemchitiet .product_order_price span {
                    margin-left: 30px;
                    color: red;
            }

            

            .xemchitiet .product_content {
                    float: left;
                    width: 500px;
                    display: block;
                    padding: 20px;
            }

            .xemchitiet .product_content_features {
                    padding: 11px 0px 10px 3px;
                    border-top: 1px solid gray;
            }

            .xemchitiet .product_content_features label {
                    display: inline-block;
                    width: 200px;
                    /* float: left; */
            }

            .xemchitiet .product_content_features span {
                    display: block;
                    margin-left: 205px;
            }
            
            .xemchitiet .product_infor {
                margin: 50px;
            }
            
            .xemchitiet .product_infor ul {
                margin-top: 10px;
                margin-left: 20px;
            }

            .xemchitiet .product_infor a {
                text-decoration: none;
                color: red;
            }
            
            .clr {
                clear: both;
            }
            
            
        </style>
    </head>
    <body>
        
	<%@include file="headadmin.jsp" %>
        <div class="xemchitiet">
            <div class="product">
                <div class="product_name">
                    
                    <h2><a href="qlsp">Sản phẩm</a> >> ${p.namePro}</h2>
                    <hr>
                </div>
                    
                    <div class="box">
                        
                        <div class="product_img">
                            <img src="img/product/${p.imagePro}" alt="${p.namePro}">                      
                        </div>
                        
                        <div class="product_order_price">
                            <label><b>Số lượng: </b></label> <span><b>${p.quantity}</b></span><br/>
                                <label><b>Giá tiền: </b></label> <span>$<b>${p.price} </b></span>

                        </div>
                    </div>
                
                <div class="product_content">
                        <h3>Thông tin sản phẩm</h3>
                        <div class="product_content_features">
                                <label>Màu Săc:</label> <span>${d.mauSac}</span>
                        </div>
                        <div class="product_content_features">
                                <label>Kích Thước:</label> <span>${d.kichThuoc}</span>
                        </div>
                        <div class="product_content_features">
                                <label>Chất Liệu:</label> <span>${d.chatLieu}</span>
                        </div>
                        <div class="product_content_features">
                                <label>Nơi Sản Xuất:</label> <span>${d.noiSanXuat}</span>
                        </div>
                        
                </div>
         <div class="clr"></div>

                <div class="product_infor">
                        
                        <h3>Đặc điểm nổi bật:</h3>
                        <hr>
                        <ul>
                                <c:forEach items="${d.dacDiemNoiBat}" var="i">
                                        <li>${i}</li>
                                </c:forEach>
                        </ul>

                </div>
            </div>
            
            <div class="nut color_1"><a href="qlsp?action=suasp&ProId=${p.proId}">Sửa sản phẩm</a></div>
            <div class="nut color_2"><a href="qlsp?action=xoasp&ProId=${p.proId}" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa sản phẩm</a></div>
        </div>
        
    </body>
</html>