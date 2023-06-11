<%-- 
    Document   : shopping-cart
    Created on : Apr 26, 2023, 4:31:50 PM
    Author     : ADMIN
--%>
<%@page import="model.user"%>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dal.ProductDAO" %>
<%@ page import="dal.DBContext" %>
<%@ page import="java.util.List" %>
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
    <%
    user auth = (user) request.getSession().getAttribute("user");
   if (auth != null) {
        request.setAttribute("person", auth);
    }
//    lay ra sp trong cart_list
    ArrayList<Cart> cart_list= (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct=null;
    if(cart_list!=null){
        ProductDAO pDao=new ProductDAO();
        cartProduct=pDao.getCartProducts(cart_list);
//        tinh total
        long total=(long)pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list",cart_list);
        request.setAttribute("total",total);
    }
    %>
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
        <section style="margin-left: 200px;width: 1000px;" class="shopping-cart spad">
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
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if(cart_list!=null){
                                            for(Cart c:cartProduct){%>

                                    <tr>
                                        <td class="product__cart__item" style="width:200px;">
                                            <div class="product__cart__item__text" style="width: 50%;height:50%;">
                                                <img src="img/product/<%= c.getImagePro()%>" alt=""/>

                                            </div>
                                        </td>
                                        <td style="font-weight: bold; margin-left: 50px;">$<%=c.getPrice()%></td>
                                        <form action="ordernow" method="post">
                                        <input type="hidden" name="id" value="<%=c.getProId()%>" class="form-input" />
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <button><a href="quantityincdec?action=inc&id=<%=c.getProId()%>">-</a></button>
                                                <input type="text" name="quantity" readonly value="<%=c.getQuantity()%>">
                                                <button><a href="quantityincdec?action=dec&id=<%=c.getProId()%>">+</a></button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price" style="width:80px;">$<%=c.getPrice()*c.getQuantity()%> </td>
                                    <td class="cart__close" style="width:20px;">
                                        <a href="removeitem?id=<%=c.getProId()%>"><i class="fa fa-close"></i></a> 
                                    </td>
                                    
                                    <td style="border:black;"> 
                                        <button style="margin-left: 20px;background: white;color:black;" type="submit" class="btn btn-primary btn-sm">
                                            Buy
                                        </button></td>
                                </form>
                                </tr>   
                                <%}
                                  }
                                %>
                                </tbody>
                            </table>
                        </div>
                                <div style="margin-left: 470px">
                            <h3>Total: ${(total>0)?total:0} $</h3>
                            <br/>

                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn">
                                    <a href="shop">Continue Shopping</a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="continue__btn update__btn">
                                    <form action="check_out" method="">
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
