<%-- 
    Document   : headadmin
    Created on : Jun 9, 2023, 9:27:25 PM
    Author     : ADMIN
--%>
<%@page import="model.user"%>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            .account{
                position: relative;
                display: flex;
                flex-direction: row;
            }
            .info-name {
	display: flex;
	justify-content: center;
}

.logout {
	display: none;
	position: absolute;
	top: 100%;
	border-radius: 10px;
	background-color: white;
	padding: 5px;
	border: 1px solid black;
	z-index: 1;
        color:black;
}
#info-name{
    background: none;
    color:white;
    border:none;
}
#content{
    margin-left: 400px;
}
</style>
    </head>
    <script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('info-name').addEventListener('click',
				function() {
					var logoutDiv = document.getElementById('logout');
					if (logoutDiv.style.display === 'none') {
						logoutDiv.style.display = 'block';
					} else {
						logoutDiv.style.display = 'none';
					}
				});
	});
	

</script>
    <body>
        <%
	String error = request.getAttribute("error") + "";
	error = (error.equals("null") ? "" : error);
	%>
        

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-7">
                            <div class="header__top__left">
                                <p>Free shipping, 30-day return or refund guarantee.</p>
                            </div>
                        </div>
                        <%
		Object object = session.getAttribute("user");
		user user = null;
		if (object != null) {
			user = (user) object;
		}
		if (user == null) {
		%>
                        <div class="col-lg-6 col-md-5">
                            <div class="header__top__right">
                                <div class="header__top__links">
                                        <div id="login_item" >
                                            <a href="login.jsp">Sign in </a>
                                        </div>
                                        <%
                                            } else {
                                            %>
                                           
                                        <div id="content" class="account">
                                            <button class="header_member info-name" id="info-name">
                                            <i style="color:white; font-size: 20px" class="fa fa-user"></i>
                                            <h5 style="color:white"> ADMIN</h5>
                                            </button>
                                            <div class="logout" id="logout">
                                                <a style="color: black;"
                                                    href="user?hanhDong=logout"><i
                                                    class="fa-solid fa-right-from-bracket"></i> Đăng xuất </a>
                                            </div>
                                        </div>
                                       
                                        
                                                <%
                                                    }
                                                    %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="home"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="qlnd">Quản lý ND</a></li>
                                <li class="active"><a href="qlsp">Quản lý SP</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="header__nav__option">
                           
                            <a href="#"><img src="img/icon/heart.png" alt=""></a>
                            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>

                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </header>

        <!-- Header Section End -->
        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
    </body>
<!--    <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/signin.js"></script>-->
</html>
