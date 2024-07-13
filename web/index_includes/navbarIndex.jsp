<%-- 
    Document   : navbarIndex
    Created on : Jul 5, 2024, 1:14:33 AM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.time.*,java.time.temporal.TemporalAdjusters "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!-- Video Section Start -->
<!--    <div class="container my-5 video-section">
        <div class="row">
            <div class="col-md-6 video-container">
                <video class="custom-video" controls autoplay muted loop>
                    <source src="images/video1.MOV" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>

            <div class="col-md-6 video-container">
                <video class="custom-video" controls autoplay muted loop>
                    <source src="images/video2.MOV" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>
    </div>
<!-- Video Section End -->

<!-- Navbar Start -->
<div class="container-main">
    <div class="row">
        <!-- Thanh Slide Bar -->
        <div class="col-12 col-lg-3">
            <div class="sidebar">
<!--                <div class="widget widget_menu d-none d-md-block">
                    <h3 class="sidebar-title">Danh mục</h3>
                    <div class="sidebar-menu">
                        <ul>

                            <li class="has-child dropdown">
                                <a style="color: #000">Sách Kinh Tế <i class="fal fa-angle-right"></i></a>
                            </li>

                            <li class="has-child dropdown">
                                <a style="color: #000">Sách Văn Học Trong Nước <i class="fal fa-angle-right"></i></a>   
                            </li>

                            <li class="has-child dropdown">
                                <a style="color: #000">Sách Văn Học Nước Ngoài <i class="fal fa-angle-right"></i></a>
                            </li>  

                            <li class="has-child dropdown">
                                <a style="color: #000">Sách Thưởng Thức Đời Sống <i class="fal fa-angle-right"></i></a>       
                            </li>

                            <li class="has-child dropdown">
                                <a style="color: #000">Sách Thiếu Nhi <i class="fal fa-angle-right"></i></a>
                            </li>
                            <li class="has-child dropdown">
                                <a style="color: #000">Sách Phát Triển Bản Thân <i class="fal fa-angle-right"></i></a>
                            </li>

                             Mục "Xem thêm" 
                            <details>
                                <summary style="color: #000;">Xem thêm</summary>
                                 Các mục bị ẩn 
                                <ul>

                                    <li class="has-child dropdown">
                                        <a style="color: #000">Sách Tin Học Ngoại Ngữ <i class="fal fa-angle-right"></i></a>
                                    </li>    

                                    <li class="has-child dropdown">
                                        <a style="color: #000">Sách Chuyên Ngành <i class="fal fa-angle-right"></i></a>
                                    </li>

                                    <li class="has-child dropdown">
                                        <a style="color: #000">Sách Giáo Khoa - Giáo Trình <i class="fal fa-angle-right"></i></a>
                                    </li>

                                    <li class="has-child dropdown">
                                        <a style="color: #000">Sách Mới Phát Hành <i class="fal fa-angle-right"></i></a>
                                    </li>
                                </ul>
                            </details>

                    </div>

                </div>-->

                <div class="widget widget_banner banner-effect">
                    <a href="BookAction?action=bookShoppingImg&imgURL=images/sale1.jpg">
                        <div class="widget_text">Featured books</div>

                        <img src="images/sale1.jpg" alt="Tuổi Trẻ Đáng Giá bao nhiêu">

                        <span class="hover hover1"></span>

                        <span class="hover hover2"></span>

                        <span class="hover hover3"></span>

                        <span class="hover hover4"></span>

                    </a>
                </div>

                <div class="widget widget_collection d-none d-md-block">
                    <div class="widget-title">
                        Bestselling Books
                    </div>
                    <div class="widget_collection_list">

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <a href="BookAction?action=bookShoppingTitle&title=Bước Nhảy Tới Mùa hè">
                                    <img class="" src="images/sale41.jpg"  alt="Bước Nhảy Tới Mùa hè" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Bước Nhảy Tới Mùa hè" title="Bước Nhảy Tới Mùa Hè">
                                        Bước Nhảy Tới Mùa hè
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price ">
                                        <span class="current-price">62,000₫</span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Cảm Ơn Người Lớn">
                                    <img class="" src="images/sale33.jpg"  alt="Cảm Ơn Người Lớn" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Cảm Ơn Người Lớn" title="Cảm Ơn Người Lớn">
                                        Cảm Ơn Người Lớn
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">116,100₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                129,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Vừa Nhắm Mắt Vừa Mở Cửa Sổ">
                                    <img class="" src="images/sale32.jpg"  alt="Vừa Nhắm Mắt Vừa Mở Cửa Sổ" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Vừa Nhắm Mắt Vừa Mở Cửa Sổ" title="Vừa Nhắm Mắt Vừa Mở Cửa Sổ">
                                        Vừa Nhắm Mắt Vừa Mở Cửa Sổ
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">128,700₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                143,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Ra Bờ Suối Ngắm Hoa Kèn Hồng">
                                    <img class="" src="images/sale35.jpg"  alt="Ra Bờ Suối Ngắm Hoa Kèn Hồng" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Ra Bờ Suối Ngắm Hoa Kèn Hồng" title="Ra Bờ Suối Ngắm Hoa Kèn Hồng">
                                        Ra Bờ Suối Ngắm Hoa Kèn Hồng
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">170,100₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                189,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Làm Bạn Với Bầu Trời">
                                    <img class="" src="images/sale38.jpg"  alt="Làm Bạn Với Bầu Trời" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Làm Bạn Với Bầu Trời" title="Làm Bạn Với Bầu Trời">
                                        Làm Bạn Với Bầu Trời
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">115,200₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                128,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div> 

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Tôi Thấy Hoa Vàng Trên Cỏ Xanh">
                                    <img class="" src="images/sale37.jpg"  alt="Tôi Thấy Hoa Vàng Trên Cỏ Xanh" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Tôi Thấy Hoa Vàng Trên Cỏ Xanh" title="Tôi Thấy Hoa Vàng Trên Cỏ Xanh">
                                        Tôi Thấy Hoa Vàng Trên Cỏ Xanh
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">143,100₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                159,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Doraemon Tập 1">
                                    <img class="" src="images/sale42.jpg"  alt="Doraemon Tập 1" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Doraemon Tập 1" title="Doraemon Tập 1">
                                        Doraemon Tập 1
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">118,800₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                132,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Mắt Biếc">
                                    <img class="" src="images/sale36.jpg"  alt="Mắt Biếc" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Mắt Biếc" title="Mắt Biếc">
                                        Mắt Biếc
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">364,500₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                405,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Cho Tôi Xin 1 Vé Đi Tuổi Thơ">
                                    <img class="" src="images/sale39.jpg"  alt="Cho Tôi Xin 1 Vé Đi Tuổi Thơ" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Cho Tôi Xin 1 Vé Đi Tuổi Thơ" title="Cho Tôi Xin 1 Vé Đi Tuổi Thơ">
                                        Cho Tôi Xin 1 Vé Đi Tuổi Thơ 
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">116,100₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                129,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Mùa Hè Không Tên">
                                    <img class="" src="images/sale40.jpg"  alt="Mùa Hè Không Tên" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Mùa Hè Không Tên" title="Mùa Hè Không Tên">
                                        Mùa Hè Không Tên
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">509,000₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                566,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Chân Lý Và Sự Thật">
                                    <img class="" src="images/sale46.jpg"  alt="Chân Lý Và Sự Thật" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Chân Lý Và Sự Thật" title="Chân Lý Và Sự Thật">
                                        Chân Lý Và Sự Thật
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">103,500₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                120,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Mình là cá, Việc của mình là bơi">
                                    <img class="" src="images/sale48.jpg"  alt="Mình là cá, Việc của mình là bơi" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Mình là cá, Việc của mình là bơi" title="Mình là cá, Việc của mình là bơi">
                                        Mình là cá, Việc của mình là bơi
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">109,000₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                120,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Yêu, Cần Phải Học">
                                    <img class="" src="images/sale47.jpg"  alt="Yêu, Cần Phải Học" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Yêu, Cần Phải Học" title="Yêu, Cần Phải Học">
                                        Yêu, Cần Phải Học
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">125,000₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                135,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Xin Chào Tôi Là Người Dọn Xác">
                                    <img class="" src="images/sale45.jpg"  alt="Xin Chào Tôi Là Người Dọn Xác" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Xin Chào Tôi Là Người Dọn Xác" title="Xin Chào Tôi Là Người Dọn Xác">
                                        Xin Chào Tôi Là Người Dọn Xác
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">105,000₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                120,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-item-mini">
                            <div class="side-img" style="border: none;">
                                <div class="product-sale" style="background: #f03737;"><span>-10%</span></div>      

                                <a href="BookAction?action=bookShoppingTitle&title=Triết Lý Sống Của Chó Và Mèo">
                                    <img class="" src="images/sale49.jpg"  alt="Triết Lý Sống Của Chó Và Mèo" >
                                </a>    
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="BookAction?action=bookShoppingTitle&title=Triết Lý Sống Của Chó Và Mèo" title="Triết Lý Sống Của Chó Và Mèo">
                                        Triết Lý Sống Của Chó Và Mèo
                                    </a>
                                </h3>
                                <div class="box-pro-prices">    
                                    <p class="pro-price highlight">
                                        <span class="current-price">170,100₫</span>

                                        <span class="pro-price-del">
                                            <del class="compare-price">
                                                189,000₫
                                            </del>
                                        </span>

                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>

        <div class="col-12 col-lg-9">
            <div class="body-right">

                <div class="container-fluid mb-5">
                    <div class="row border-top px-xl-5">
                        <div class="main-content">
                            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                                <a href="" class="text-decoration-none d-block d-lg-none">
                                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                                </a>
                                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                    <div class="navbar-nav mr-auto py-0">
                                        <a href="index.html" class="nav-item nav-link active">Home</a>
                                        <a href="BookAction?action=filter&by=none" class="nav-item nav-link">Shop</a>
                                        <a href="BookAction?action=bookShoppingTitle&title=${sessionScope.lastTitle}" class="nav-item nav-link">Shop Detail</a>
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                            <div class="dropdown-menu rounded-0 m-0">
                                                <a href="BookAction?action=viewCart" class="dropdown-item">Shopping Cart</a>
                                                <a href="BookAction?action=viewOrder" class="dropdown-item">Orders</a>
                                            </div>
                                        </div>
                                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                                    </div>
                                    <div class="navbar-nav ml-auto py-0">
                                        <!--<a href="Authenticate?action=loginForm" class="nav-item nav-link">Login</a>-->
                                        <!--<a href="Authenticate?action=registerForm" class="nav-item nav-link">Register</a>-->
                                        <c:choose>
                                            <c:when test="${sessionScope.userName != null}">
                                                <a href="Authenticate?action=logout" class="nav-item nav-link">Logout</a>
                                            </c:when>      
                                            <c:when test="${sessionScope.userName == null}">
                                                <a href="Authenticate?action=loginForm" class="nav-item nav-link">Login</a>
                                            </c:when> 
                                        </c:choose>
                                    </div>
                                </div>
                            </nav>
                            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active" style="height: 410px;">
                                        <img class="img-fluid" src="images/books1.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Book week</h3>
                                                <% 
String currentDate = LocalDate.now().toString();
LocalDate today = LocalDate.now();
LocalDate firstDayOfWeek = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
String firstDayOfWeekStr = firstDayOfWeek.toString();
                                                %>
                                                <a href="BookAction?action=filter&by=time&minDay=<%=firstDayOfWeekStr%>&maxDay=<%=currentDate%>" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item" style="height: 410px;">
                                        <img class="img-fluid" src="images/books2.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Political Books</h3>
                                                <a href="BookAction?action=filter&by=category&cate=Cách Mạng-Chính Trị" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item" style="height: 410px;">
                                        <img class="img-fluid" src="images/books3.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                                <a href="BookAction?action=filter&by=price&min=0.00&max=25.00" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item" style="height: 410px;">
                                        <img class="img-fluid" src="images/books4.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Romcom Novel</h3>
                                                <a href="BookAction?action=filter&by=category&cate=Romcom Novel" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item" style="height: 410px;">
                                        <img class="img-fluid" src="images/books5.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Shoujo Manga</h3>
                                                <a href="BookAction?action=filter&by=category&cate=Manga" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item" style="height: 410px;">
                                        <img class="img-fluid" src="images/books6.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Comic Books</h3>
                                                <a href="BookAction?action=filter&by=category&cate=Comic Book" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item" style="height: 410px;">
                                        <img class="img-fluid" src="images/books7.jpg" alt="Image">
                                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                            <div class="p-3" style="max-width: 700px;">
                                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Harry Potter List</h3>
                                                <a href="BookAction?action=filter&by=series&seriesName=Harry Potter and" class="btn btn-light py-2 px-3">Shop Now</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                        <span class="carousel-control-prev-icon mb-n2"></span>
                                    </div>
                                </a>
                                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                        <span class="carousel-control-next-icon mb-n2"></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Navbar End -->
                <!--   
                   <div class="flashsale-header">
                <!-- flash sale--
                <img src="https://cdn0.fahasa.com/media/wysiwyg/icon-menu/ico_flashsale@3x.png" 
                style="width: 25px; height: 25px; margin-left: 10px;">
                <span class="flash-header-title" style="margin-right: 5px">FLASH SALE |</span>
                <span class="flashsale-page-countdown-label">Kết thúc trong</span>
                <div class="flashsale-header-countdown">
                <span class="flashsale-header-countdown-item">00</span>
                <span>:</span>
                <span class="flashsale-header-countdown-item">40</span>
                <span>:</span>
                <span class="flashsale-header-countdown-item">26</span>
                <span>:</span>
                </div>
            </div>
                -->
