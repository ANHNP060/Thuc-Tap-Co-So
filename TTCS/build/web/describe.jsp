<%-- 
    Document   : describe
    Created on : Apr 9, 2023, 10:49:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <c:set var="p" value="${requestScope.pro}"/>
        <c:set var="d" value="${requestScope.des}"/>
        <title>${p.namePro}</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <link rel="stylesheet" href="css/describe_css.css">
    </head>
    <script>
        function increaseQuantity() {
            var quantity = document.getElementById("quantity_order");
            var value = parseInt(quantity.value);
            if (value < parseInt(quantity.max)) {
              quantity.value = value + 1;
            }
          }

          function decreaseQuantity() {
            var quantity = document.getElementById("quantity_order");
            var value = parseInt(quantity.value);
            if (value > parseInt(quantity.min)) {
              quantity.value = value - 1;
            }
          }
          
          function buy(id){
              document.myForm.action = "buy?ProId="+id;
              document.myForm.submit();
          }
    </script>
    <body>
        <%@include file="header.jsp" %>
        <div class="product">
            <div class="product_name">
                <h2>${p.namePro}</h2>
                <hr>
            </div>
            <div class="product_img"><img src="img/product/${p.imagePro}" alt="${p.namePro}"></div>
            <div class="product_content">
                <h3>Thông tin sản phẩm </h3>
                <div class="product_content_features">
                    <label>Màu sắc:</label>
                    <span>${d.mauSac}</span>
                </div>
                <div class="product_content_features">
                    <label>Kích thước:</label>
                    <span>${d.kichThuoc}</span>
                </div>
                <div class="product_content_features">
                    <label>Chất liệu:</label>
                    <span>${d.chatLieu}</span>
                </div>
                <div class="product_content_features">
                    <label>Nơi sản xuất:</label>
                    <span>${d.noiSanXuat}</span>
                </div>
                
            </div>
            <form action="" method="post" name="myForm">
            <div class="product_order">
                <div class="product_order_price">
                <label>Số lượng: </label>
                <a class="fa-solid fa-minus" onclick="decreaseQuantity()"></a>
                <input type="number" id="quantity_order" name="num" readonly value="1" min="1" max="${p.quantity}">
                <a class="fa-solid fa-plus" onclick="increaseQuantity()"></a>
                <br/>
                <label><b>Giá tiền: </b></label>
                <span><b>$<fmt:formatNumber value="${p.price}" pattern="###,###,###"/> </b></span>
                    
                </div>

                <div class="product_order_button">
                    <div class="button_1"><a href="#"><b>MUA NGAY</b></a></div>
                    <div class="button_2"><a type="submit" onclick="buy(${p.proId})"> <i class="fa-solid fa-cart-shopping"></i></a></div>
                </div>
            </div>
            </form>

            <div class="product_infor">
             
                <h3>Đặc điểm nổi bật: </h3>
                <hr>
                <ul>
                    <c:forEach items="${d.dacDiemNoiBat}" var="i">
                        <li>${i}</li>
                    </c:forEach>
                </ul>
                  
            </div>
        </div>
                <%@include file="footer.jsp" %>
    </body>
</html>
