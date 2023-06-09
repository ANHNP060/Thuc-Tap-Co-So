<%-- 
    Document   : shopping-cart
    Created on : Apr 26, 2023, 4:31:50 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart </title>
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shopping Cart</h4>
                            <div class="breadcrumb__links">
                                <a href="./home">Home</a>
                                <a href="./shop">Shop</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="shopping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th >Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="o" value="${sessionScope.cart}" />
                                    <c:forEach var="i" items="${o.items}" >
                                        <tr>
                                            <td class="product__cart__item">
                                                <div class="product__cart__item__text" style="width: 35%;height:35%;">
                                                    <img src="img/product/${i.product.imagePro}" alt="${i.product.namePro}"/>

                                                </div>
                                            </td>
                                            <td style="font-weight: bold;">${i.price}</td>
                                            <td class="quantity__item">
                                                <div class="quantity">
                                                    <div class="pro-qty-2">
                                                        <button><a href="process?num=-1&id=${i.product.proId}">-</a></button>
                                                        <input type="text" readonly value="${i.quantity}">
                                                        <button><a href="process?num=+1&id=${i.product.proId}">+</a></button>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="cart__price">$ ${i.price * i.quantity}</td>
                                            <td class="cart__close" style="width:20px;">
                                                <form action="process" method="post">
                                                    <input type="hidden" name="id" value="${i.product.proId}"/>
                                                    <button style="border-radius: 50%;" type="submit"><i class="fa fa-close"></i></button>
                                                </form>
                                            </td>
                                        </tr>   
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn">
                                    <a href="shop">Continue Shopping</a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn update__btn">
                                    <form action="checkout" method="get">
                                        <input style="background:black;color:white;border:none;font-size: 18px" type="submit" value="Check out"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>               
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <%@include file="footer.jsp" %>
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
