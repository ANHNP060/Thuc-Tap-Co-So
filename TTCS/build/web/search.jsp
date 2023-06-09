<%-- 
    Document   : search
    Created on : May 30, 2023, 7:31:35 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div> <%@include file="header.jsp" %></div>
        <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__links">
                            <a href="home" style="color:black"><div><i class="fa-solid fa-house"></i></div><div>Trang chủ</div></a>
                            
                            <span>Kết quả tìm kiếm cho: 'null'</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <div class="content" style="margin: 40px 40px;text-align: center;"><h2>Không có kết quả bạn cần tìm</h2></div>
        <div><%@include file="footer.jsp" %></div>
    </body>
</html>
