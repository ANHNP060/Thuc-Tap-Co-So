<%-- 
    Document   : Login
    Created on : May 22, 2023, 5:45:49 PM
    Author     : ADMIN
--%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dal.ProductDAO"%>
<%@page import="dal.DBContext"%>
<%@page import="model.Cart" %>
<%@page import="model.user" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

        <title>Login</title>
        <link rel="stylesheet" href="css/login.css"/>
        <style>
            #signup a{
                text-decoration: none;
                color:white;
            }
            </style>
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
        request.setAttribute("cart_list",cart_list);
    }
    %>
    <body>
        <%
		String error = request.getAttribute("error") + "";
		error = (error.equals("null") ? "" : error);
		%>
        <div class="signup">
            <div class="signup__container">
                <h1>Sign In</h1>
                <small style="color:red;text-align: center;" id="error"><%=error%></small>
                <form  method="post"  action="user">
                    <input type="hidden" name="hanhDong" value="login" />

                    <div class="form-group"> 
                        <h5>Email</h5>
                        <input type="text" placeholder="Enter your email"  name="email" id="name" ><br/>
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <h5>Password</h5>
                        <input type="text" placeholder="Enter your password"  name="password" id="email" ><br/>
                        <span class="form-message"></span>
                    </div>
                    <button style="margin-bottom: 15px;" type="submit" name="ok"  id="form-submit"">Đăng nhập</button>
                    <br/>
                    <h3 style="color:blue">Bạn chưa có tài khoản?</h3>
                    <button type="submit" name="ok"  id="signup" ><a href="signup.jsp">Đăng ký ngay</a></button>

                </form>

               
            </div>
        </div>
    </body>
</html>
