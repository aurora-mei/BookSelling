<%-- 
    Document   : headerIndex
    Created on : Jul 5, 2024, 1:11:51 AM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <meta charset="utf-8">
        <title>Kittens Bookstore</title>
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
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Kittens </span>Bookstore</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form onsubmit="event.preventDefault(); searchByKeyWord();">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search books by title,year publish,description">
                            <div onclick="searchByKeyWord()" class="input-group-append" style="cursor: pointer;">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 col-6 text-right">
                    <a href="BookAction?action=viewCart" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge">0</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function searchByKeyWord() {
                            var keyword = $('input[placeholder="Search books by title,year publish,description"]').val();
                            console.log("key word " + keyword);                    
                            if (keyword.length === 0) {
                               return;
                            }
                            var form = $('<form></form>').attr('action', 'BookAction').attr('method', 'get');
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'action').attr('value', 'search'));
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'by').attr('value', 'key'));
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'keyword').attr('value', keyword));
                                // Append the form to the body and submit it
                                $('body').append(form);
                                form.submit();
                        }
    
</script>