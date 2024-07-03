<%-- 
    Document   : index
    Created on : Jul 2, 2024, 2:16:18 AM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta charset="utf-8">
    <title>Tiệm sách Kittens</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <link href="images/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="https://www.facebook.com/dtrg.1101/">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="https://instagram.com/dtrg.1101">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Kittens</span>Bookstore</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                <a href="" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge">0</span>
                </a>
                <a href="" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">0</span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->

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
    <div class="widget widget_menu d-none d-md-block">
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
   
        <!-- Mục "Xem thêm" -->
    <details>
        <summary style="color: #000;">Xem thêm</summary>
        <!-- Các mục bị ẩn -->
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

    </div>
    
    <div class="widget widget_banner banner-effect">
        <a href="BookAction?action=bookShoppingImg&imgURL=images/sale1.jpg">
            <div class="widget_text">Sách nổi bật</div>

            <img src="images/sale1.jpg" alt="Tuổi Trẻ Đáng Giá bao nhiêu">
            
            <span class="hover hover1"></span>
            
            <span class="hover hover2"></span>
            
            <span class="hover hover3"></span>
            
            <span class="hover hover4"></span>
            
        </a>
    </div>

    <div class="widget widget_collection d-none d-md-block">
        <div class="widget-title">
            Sách Bán Chạy
        </div>
        <div class="widget_collection_list">

<div class="product-item-mini">
    <div class="side-img" style="border: none;">
        <a href="">
            <img class="" src="images/sale41.jpg"  alt="Bước Nhảy Tới Mùa hè" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Bước Nhảy Tới Mùa Hè">
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
            
        <a href="">
            <img class="" src="images/sale33.jpg"  alt="Cảm Ơn Người Lớn" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Cảm Ơn Người Lớn">
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
            
        <a href="">
            <img class="" src="images/sale32.jpg"  alt="Vừa Nhắm Mắt Vừa Mở Cửa Sổ" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Vừa Nhắm Mắt Vừa Mở Cửa Sổ">
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
            
        <a href="">
            <img class="" src="images/sale35.jpg"  alt="Ra Bờ Suối Ngắm Hoa Kèn Hồng" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Ra Bờ Suối Ngắm Hoa Kèn Hồng">
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
            
        <a href="">
            <img class="" src="images/sale38.jpg"  alt="Làm Bạn Với Bầu Trời" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Làm Bạn Với Bầu Trời">
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
            
        <a href="">
            <img class="" src="images/sale37.jpg"  alt="Tôi Thấy Hoa Vàng Trên Cỏ Xanh" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Tôi Thấy Hoa Vàng Trên Cỏ Xanh">
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
            
        <a href="">
            <img class="" src="images/sale42.jpg"  alt="Doraemon Tập 1" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Doraemon Tập 1">
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
            
        <a href="">
            <img class="" src="images/sale36.jpg"  alt="Mắt Biếc" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Mắt Biếc">
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
            
        <a href="">
            <img class="" src="images/sale39.jpg"  alt="Cho Tôi Xin 1 Vé Đi Tuổi Thơ" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Cho Tôi Xin 1 Vé Đi Tuổi Thơ">
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
            
        <a href="">
            <img class="" src="images/sale40.jpg"  alt="Mùa Hè Không Tên" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Mùa Hè Không Tên">
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
            
        <a href="">
            <img class="" src="images/sale46.jpg"  alt="Chân Lý Và Sự Thật" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Chân Lý Và Sự Thật">
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
            
        <a href="">
            <img class="" src="images/sale48.jpg"  alt="Mình là cá, Việc của mình là bơi" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Mình là cá, Việc của mình là bơi">
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
            
        <a href="">
            <img class="" src="images/sale47.jpg"  alt="Yêu, Cần Phải Học" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Yêu, Cần Phải Học">
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
            
        <a href="">
            <img class="" src="images/sale45.jpg"  alt="Xin Chào Tôi Là Người Dọn Xác" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Xin Chào Tôi Là Người Dọn Xác">
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
            
        <a href="">
            <img class="" src="images/sale49.jpg"  alt="Triết Lý Sống Của Chó Và Mèo" >
        </a>    
    </div>
    <div class="product-content">
        <h3 class="product-title">
            <a href="" title="Triết Lý Sống Của Chó Và Mèo">
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
                            <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                            <a href="BookAction?action=bookShoppingImg&imgURL=images/sale1.jpg" class="nav-item nav-link">Shop Detail</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="BookAction?action=viewCart" class="dropdown-item">Shopping Cart</a>
                                    <a href="checkout.html" class="dropdown-item">Checkout</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                            <!--<a href="Authenticate?action=loginForm" class="nav-item nav-link">Login</a>-->
                            <!--<a href="Authenticate?action=registerForm" class="nav-item nav-link">Register</a>-->
                            <a href="Authenticate?action=logout" class="nav-item nav-link">Logout</a>
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
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="images/books2.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Political Books</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="images/books3.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="images/books4.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Romcom Novel</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="images/books5.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Shoujo Manga</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="images/books6.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Comic Books</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="images/books7.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Harry Potter List</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
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
    


    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-12 col-md-6 ">
                <img class="img-fluid tap-highlight-custom" src="images/sale30.jpg" alt="Image">
            </div>
            <div class="col-12 col-md-6">
                <img class="img-fluid tap-highlight-custom" src="images/sale31.jpg" alt="Image">
            </div>            
        </div>
    </div>
    <!-- Featured End -->

    
    <div class="container-category"> <!-- Start container-category -->
            <div class="container-category-child">
                <img src="images/icon1.jpg" alt="category1">
                <a>Mã Giảm Giá</a>
            </div>
            <div class="container-category-child">
                <img src="images/icon2.jpg" alt="category2">
                <a>Quà Tặng Khách Hàng</a>
            </div>
            <div class="container-category-child">
                <img src="images/icon3.jpg" alt="category3">
                <a>BestSellers</a>
            </div>
            <div class="container-category-child">
                <img src="images/icon4.jpg" alt="category4">
                <a>Sản Phẩm Mới</a>
            </div>
            <div class="container-category-child">
                <img src="images/icon5.jpg" alt="category5">
                <a>Shelf Steals</a>
            </div>
            <div class="container-category-child">
                <img src="images/icon6.jpg" alt="category6">
                <a>Văn Phòng Phẩm</a>
            </div>
    </div> <!-- End container-category -->


    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Healing List</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale2.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Tuổi Trẻ Đáng Giá Bao Nhiêu </h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 50%;"></div>
                        <span class="progress-label">Đã bán 30</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale32.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Vừa nhắm mắt vừa mở cửa sổ</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 25%;"></div>
                        <span class="progress-label">Đã bán 15</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale4.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Hoàng Tử Bé</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width:75%;"></div>
                        <span class="progress-label">Đã bán 35</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="BookAction?action=bookShoppingTitle&title=Hoàng Tử Bé" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale47.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Yêu, Cần phải học </h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 20%;"></div>
                        <span class="progress-label">Đã bán 10</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
        </div>

    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Chính Trị & Cách Mạng</span></h2>
        </div>
    
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale46.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Chân Lý Và Sự Thật</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 50%;"></div>
                        <span class="progress-label">Đã bán 30</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale5.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Chính Trị thế giới sau 1945</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 25%;"></div>
                        <span class="progress-label">Đã bán 15</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale6.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Văn Kiện Đảng</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width:75%;"></div>
                        <span class="progress-label">Đã bán 35</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale51.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Cách Mạng Tháng 8</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 20%;"></div>
                        <span class="progress-label">Đã bán 10</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
        </div>

    </div>    

    </div>
    <!-- Categories End -->


    <!-- Offer Start -->
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white\\ mb-2 py-5 px-5">
                    <img src="images/background.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Shoujo Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="images/background1.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">Free Shipping</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Sakura Kinomoto</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->


    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Romcom Nover</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale8.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">The love Hypothesis</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 50%;"></div>
                        <span class="progress-label">Đã bán 30</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale9.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">The Summer Broken The Rule</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 25%;"></div>
                        <span class="progress-label">Đã bán 15</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale28.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">HeartStopper</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width:75%;"></div>
                        <span class="progress-label">Đã bán 35</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale10.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">What Happen After Midnight </h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 20%;"></div>
                        <span class="progress-label">Đã bán 10</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Harry Potter Lists</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
          
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale21.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Harry Potter</h6>
                        <h6 class="text-truncate mb-3">and The Philosopher's Stone</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 80%;"></div>
                        <span class="progress-label">Đã bán 70</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale25.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Harry Potter</h6>
                        <h6 class="text-truncate mb-3">and The Goblet Of Fire</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 85%;"></div>
                        <span class="progress-label">Đã bán 80</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale23.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Harry Potter</h6>
                        <h6 class="text-truncate mb-3">and The Deathly Hallows</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 50%;"></div>
                        <span class="progress-label">Đã bán 45</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale29.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Harry Potter</h6>
                        <h6 class="text-truncate mb-3">and The Half-Blood Prince</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 90%;"></div>
                        <span class="progress-label">Đã bán 85</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->


    <!-- Subscribe Start -->
    <div class="container-fluid bg-secondary my-5">
        <div class="like">
        <div class="row justify-content-md-center py-5 px-xl-5">
            <div class="col-md-6 col-12 py-5">
                <div class="text-center mb-2 pb-2">
                    <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                    <p>Amet lorem at rebum amet dolores. Elitr lorem dolor sed amet diam labore at justo ipsum eirmod duo labore labore.</p>
                </div>
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Subscribe</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
    <!-- Subscribe End -->


    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Shoujo Manga</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale11.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Bạch Tuyết Tóc Đỏ</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 50%;"></div>
                        <span class="progress-label">Đã bán 35</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale12.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Fruit Basket</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 70%;"></div>
                        <span class="progress-label">Đã bán 50</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale13.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Skip To Loafer</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 25%;"></div>
                        <span class="progress-label">Đã bán 20</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale14.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Last Game</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 35%;"></div>
                        <span class="progress-label">Đã bán 15</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale15.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Sailor Moon</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 90%;"></div>
                        <span class="progress-label">Đã bán 80</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale16.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Con Đường Mùa Xuân</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 50%;"></div>
                        <span class="progress-label">Đã bán 50</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale27.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Thủ Lĩnh Thẻ Bài Sakura</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 80%;"></div>
                        <span class="progress-label">Đã bán 80</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="images/sale26.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Kimi Ni Todoke</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                        <div class="progress">
                        <div class="progress-bar" style="width: 55%;"></div>
                        <span class="progress-label">Đã bán 55</span> == $0
                    </div>
                    <div class="ratingbox">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span class="fa fa-star "></span>
                    </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
    <!-- Products End -->


    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">NXB Trẻ</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="images/logo1.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo2.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo3.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo4.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo5.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo6.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo7.png" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="images/logo8.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Vendor End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                </a>
                <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                            <a class="text-dark mb-2" href="BookAction?action=viewCart"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                            <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                            <a class="text-dark mb-2" href="BookAction?action=viewCart"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                            <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                        <form action="">
                            <div class="form-group">
                                <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                    required="required" />
                            </div>
                            <div>
                                <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top border-light mx-xl-5 py-4">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                    by
                    <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
                    Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>