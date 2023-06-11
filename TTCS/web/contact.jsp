<%-- 
    Document   : contact
    Created on : Apr 20, 2023, 10:28:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>JSP Page</title>

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
            .box {
                width: 700px;
                margin: auto;
                padding: 20px;
                font-family: sans-serif;
                line-height: 1.5em;
            }

            .k1 {
                font-size: 22px;
                display: flex;
                padding: 10px;
            }

            .k1 .k1_1 i {
                color: #000;
                font-size: 27px;
            }
            .k1 .k1_2 {
                margin:0px 0px 0px 20px;
                padding-top: 2px;
            }

            .k2 {
                width: 630px;
                margin-left: 100px;
                height:2600px;
            }

            .k2_1 {
                display: flex;
                margin: 15px 0px 0px;
            }

            .k2_1 p{
                font-size: 16px;
                color: #4a4a4a;
                height: 60px;
                margin: auto;
            }

            iframe {
                margin-top: 30px;
                margin-bottom: 30px;
                height:2300px;
            }
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
                margin-left: 390px;
            }
        </style>
    </head>

    <body>
        <%
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
//    in ra product
ProductDAO pd = new ProductDAO();
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}
        %>
        <div><%@include file="header.jsp" %></div>

        <div class="box">
            <div class="k1">
                <div class="k1_1">
                    <!--				<a href="#"><i class="fa-solid fa-arrow-left"></i></a>-->
                </div>
                <div class="k1_2">
                    <b>GÓP Ý VÀ PHẢN HỒI</b>
                </div>
            </div>
            <div class="k2">
                <div class="k2_1">
                    <div>
                        <img src="img/smember.png" alt="Smember">
                    </div>
                    <p>Mời bạn đánh giá mức độ hài lòng về chương trình ưu đãi
                        BBmember của BoonBoon. Hãy cho chúng mình thêm góp ý để cải thiện
                        tốt hơn</p>
                </div>
                <iframe
                    src="https://forms.gle/ZyGcqeMs2EMToxpKA"
                    width="630" height="520" frameborder="0" marginheight="0"
                    marginwidth="0">Đang tải…</iframe>
            </div>
        </div>
        <div><%@include file="footer.jsp" %></div>
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
