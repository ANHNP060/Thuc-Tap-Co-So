<%-- 
    Document   : Login
    Created on : May 22, 2023, 5:45:49 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

        <title>Login</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <div class="signup">
            <div class="signup__container">
                <h1>Sign In</h1>
                <form  method="post"  action="login">
                   
                    <div class="form-group"> 
                        <h5>Username</h5>
                        <input type="text" placeholder="Enter your name"  name="username" id="name" ><br/>
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <h5>Password</h5>
                        <input type="text" placeholder="Enter your password"  name="password" id="email" ><br/>
                        <span class="form-message"></span>
                    </div>
                    <button type="submit" name="ok"  id="form-submit"">Đăng nhập</button> 
                    <br/>
                    <h3 style="color:red">Bạn chưa có tài khoản?</h3><br/>
                    
                </form>
                <a href="signup"><button type="submit" name="ok"  id="form-submit" >Đăng ký ngay</button></a>

                <h3 style="color:red">${requestScope.error}</h3>
            </div>
        </div>
    </body>
</html>
