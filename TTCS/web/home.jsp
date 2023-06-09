<%-- 
    Document   : home
    Created on : Apr 20, 2023, 9:18:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Trang chủ</title>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/product_home.css" type="text/css">
    </head>
    <body>
        <div><%@include file="header.jsp" %></div>

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="img/hero/hero-3.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collection</h6>
                                    <h2>Fall - Winter Collections 2030</h2>
                                    <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                        commitment to exceptional quality.</p>
                                    <a href="shop" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="img/hero/hero4.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collection</h6>
                                    <h2>Fall - Winter Collections 2030</h2>
                                    <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                        commitment to exceptional quality.</p>
                                    <a href="shop" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="banner spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-4">
                        <div class="banner__item">
                            <div class="banner__item__pic">
                                <img src="img/banner/banner-4.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Clothing Collections 2023</h2>
                                <a href="shop">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="banner__item banner__item--middle">
                            <div class="banner__item__pic">
                                <img src="img/banner/banner-2.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Accessories</h2>
                                <a href="shop">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="banner__item banner__item--last">
                            <div class="banner__item__pic">
                                <img src="img/banner/banner-3.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Shoes Spring 2023</h2>
                                <a href="shop">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->

        <!-- Product Section Begin -->
        <section class="product-pad">
            <div class="product_container">
                <h4><b>Best Seller</b></h4>
                <div class="list_product_ex">
                                <div class="product">
                                    <a href="describe?ProId=3" target="_blank" class="product_a">
                                        <div class="product_infor">
                                            <div class="product_img">
                                                <img src="img/product/product-4.jpg" alt="${pro.namePro}"/>
                                            </div>
                                            <div class="product_name">
                                                <h5>Áo khoác gió</h5>
                                            </div>
                                            <div class="product_price">
                                                <p>$<b>  60  </b></p>
                                            </div>
                                        </div>
                                        <div class="product_button">
                                            <div class="product_button_detail">
                                                <a href="describe?ProId=3" target="_blank"><b>CHI TIẾT </b></a>
                                            </div>
                                            <div class="product_button_order">
                                                <div class="order"><a href="#"><i class="fa fa-shopping-cart"></i>
                                                    </a></div>
                                                <div class="order"><a href="#"><b>MUA NGAY</b> </a></div>                       
                                            </div>
                                        </div>
                                    </a>
                                </div>
                             <div class="product">
                                    <a href="describe?ProId=8" target="_blank" class="product_a">
                                        <div class="product_infor">
                                            <div class="product_img">
                                                <img src="img/product/product-11.jpg" alt="${pro.namePro}"/>
                                            </div>
                                            <div class="product_name">
                                                <h5>Túi Chanel</h5>
                                            </div>
                                            <div class="product_price">
                                                <p>$<b>  30  </b></p>
                                            </div>
                                        </div>
                                        <div class="product_button">
                                            <div class="product_button_detail">
                                                <a href="describe?ProId=8" target="_blank"><b>CHI TIẾT </b></a>
                                            </div>
                                            <div class="product_button_order">
                                                <div class="order"><a href="#"><i class="fa fa-shopping-cart"></i>
                                                    </a></div>
                                                <div class="order"><a href="#"><b>MUA NGAY</b> </a></div>                       
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                            <div class="product">
                                    <a href="describe?ProId=9" target="_blank" class="product_a">
                                        <div class="product_infor">
                                            <div class="product_img">
                                                <img src="img/product/product-8.jpg" alt="${pro.namePro}"/>
                                            </div>
                                            <div class="product_name">
                                                <h5>Áo thun Slapa</h5>
                                            </div>
                                            <div class="product_price">
                                                <p>$<b>  8  </b></p>
                                            </div>
                                        </div>
                                        <div class="product_button">
                                            <div class="product_button_detail">
                                                <a href="describe?ProId=9" target="_blank"><b>CHI TIẾT </b></a>
                                            </div>
                                            <div class="product_button_order">
                                                <div class="order"><a href="#"><i class="fa fa-shopping-cart"></i>
                                                    </a></div>
                                                <div class="order"><a href="#"><b>MUA NGAY</b> </a></div>                       
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                            <div class="product">
                                    <a href="describe?ProId=12" target="_blank" class="product_a">
                                        <div class="product_infor">
                                            <div class="product_img">
                                                <img src="img/product/product-12.jpg" alt="${pro.namePro}"/>
                                            </div>
                                            <div class="product_name">
                                                <h5>Áo quân lục</h5>
                                            </div>
                                            <div class="product_price">
                                                <p>$<b>  40  </b></p>
                                            </div>
                                        </div>
                                        <div class="product_button">
                                            <div class="product_button_detail">
                                                <a href="describe?ProId=12" target="_blank"><b>CHI TIẾT </b></a>
                                            </div>
                                            <div class="product_button_order">
                                                <div class="order"><a href="#"><i class="fa fa-shopping-cart"></i>
                                                    </a></div>
                                                <div class="order"><a href="#"><b>MUA NGAY</b> </a></div>                       
                                            </div>
                                        </div>
                                    </a>
                                </div>
                        </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Instagram Section Begin -->
        <section class="instagram">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="instagram__pic">
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-1.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-2.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-3.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-4.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-5.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-6.jpg"></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="instagram__text">
                            <h2>Instagram</h2>
                            <p></p>
                            <h3>#Fashion</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section End -->
        <div><%@include file="footer.jsp" %></div>
    </body>
</html>
