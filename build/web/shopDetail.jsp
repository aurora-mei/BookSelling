<%-- 
    Document   : shopDetail
    Created on : Jul 2, 2024, 3:12:39 AM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.math.BigDecimal, Model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<jsp:useBean id="book" class="Model.Book" scope="request"/>
<jsp:useBean id="publisher" class="Model.Publisher" scope="request"/>
<jsp:useBean id="langList" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="imgList" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="auList" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="lang" class="Model.Language" scope="request"/>
<jsp:useBean id="author" class="Model.Author" scope="request"/>
<jsp:useBean id="uReviewed" class="Model.User" scope="request"/>
<jsp:useBean id="cReviewed" class="Model.Comment" scope="request"/>
<jsp:useBean id="category" class="Model.Category" scope="request"/>
<!-- Shop Detail Start -->

<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 pb-5">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <c:choose>
                    <c:when test="${imgList!=null}">
                        <div class="carousel-inner border">
                            <% 
                            for(int i = 0; i < imgList.size(); i++){
                                String imgURL = (String) imgList.get(i);
                            %>
                            <div class="carousel-item <% if(i == 0) out.print("active"); %>">
                                <img class="w-100 h-100" src="<%= imgURL %>" alt="Image">
                            </div>
                            <% 
                            }
                            %>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="carousel-inner border">
                            <div class="carousel-item active">
                                <img class="w-100 h-100" src="images/sale1.jpg" alt="Image">
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                </a>
            </div>
        </div>

        <div class="col-lg-7 pb-5">
            <h3 class="font-weight-semi-bold">${book.title}</h3>
            <div class="d-flex mb-3">
                <div class="text-primary mr-2">
                    <%                                             
                    BigDecimal rate = (BigDecimal) request.getAttribute("avgRating");
                    for(int i = 1; i <= 5; i++) {
                        BigDecimal iAsBigDecimal = new BigDecimal(i);
                        if(iAsBigDecimal.compareTo(rate) <= 0) {
                            out.print("<small class=\"fas fa-star\"></small>");
                        } else if (iAsBigDecimal.subtract(rate).compareTo(BigDecimal.ONE) < 0) {
                            out.print("<small class=\"fas fa-star-half-alt\"></small>");
                        } else {
                            out.print("<small class=\"far fa-star\"></small>");
                        }
                    }
                    %>
                </div>
                <small class="pt-1">(50 Reviews)</small>
            </div>
            <c:choose>
                <c:when test="${book.priceDiscount !=book.price}">
                    <h3 class="font-weight-semi-bold mb-4">
                        <pre>${book.priceDiscount} <del style="font-weight: lighter; color: gray; font-size: 17px;">${book.price}</del></pre>
                    </h3>
                </c:when>
                <c:when test="${book.priceDiscount ==book.price}">
                    <h3 class="font-weight-semi-bold mb-4">${book.priceDiscount}</h3>
                </c:when>
            </c:choose>
            <p class="mb-4">
                ${book.descriptions}       
            <div class="d-flex mb-3">
                <p class="text-dark font-weight-medium mb-0 mr-3">Number of Pages:</p>${book.pages}                      
            </div>
            <div class="d-flex mb-3">
                <p class="text-dark font-weight-medium mb-0 mr-3">Category:</p>
                <c:choose>
                    <c:when test="${category!=null}">
                        ${category.categoryName}          
                    </c:when>
                    <c:otherwise>
                        none
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="d-flex mb-3">
                <p class="text-dark font-weight-medium mb-0 mr-3">Publish date:</p>${book.publishDate}                      
            </div>
            <div class="d-flex mb-3">
                <p class="text-dark font-weight-medium mb-0 mr-3">Publisher: </p>${publisher.publisherName}                      
            </div>
            <div class="d-flex mb-3">  
                <p class="text-dark font-weight-medium mb-0 mr-3">Languages:</p>
                <c:choose><c:when test="${langList!=null}">
                <form>
                            <%            
        for(Object o:langList){
        request.setAttribute("lang",(Model.Language)o);
                            %>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="${lang.languageID}" value="${lang.languageID}" name="lang">
                        <label class="custom-control-label" for="${lang.languageID}">${lang.languageName}</label>
                    </div>
                            <%
        }
                            %>
                </form>  
                    </c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
            </div>
            <div class="d-flex align-items-center mb-4 pt-2">
                <div class="input-group quantity mr-3" style="width: 130px;">
                    <div class="input-group-btn">
                        <button class="btn btn-primary btn-minus" >
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <input type="text" class="form-control bg-secondary text-center" value="1" name="quantity">
                    <div class="input-group-btn">
                        <button class="btn btn-primary btn-plus">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>

                <button class="btn btn-primary px-3" onclick="addToCart()">
                    <i class="fa fa-shopping-cart mr-1"></i> Add To Cart
                </button>

                <button class="btn btn-primary px-3" onclick="goToCart()" style='margin-left:18px;'>
                    <i class="fa fa-shopping-cart mr-1"></i> Buy Now
                </button>
            </div>
            <div class="d-flex pt-2">
                <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                <div class="d-inline-flex">
                    <a class="text-dark px-2" href="https://www.facebook.com/facebook">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="https://x.com/X">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="https://www.linkedin.com/company/linkedin/">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="https://www.pinterest.com/pinterest/">
                        <i class="fab fa-pinterest"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Book Description</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Author Information</a>
                <a id="review" class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3" data-bookID="${book.bookID}">Reviews </a>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h4 class="mb-3">Product Description</h4>
                    <p>${book.longDescriptions}</p>
                </div>
                <div class="tab-pane fade" id="tab-pane-2">
                    <div class="row">
                    
                    <!--<p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>-->
                        <%            
    for(Object o:auList){
    request.setAttribute("author",(Model.Author)o);
                        %>
                    
                        <div class="col-md-6">
                            <h4 class="mb-3">Author Information</h4>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item px-0">
                                    <img src="${author.authorImageURL}" alt="alt" style="width: 100px;border-radius: 50%;"/>
                                </li>
                                <li class="list-group-item px-0">
                                    <h5>Name: </h5>${author.authorName}
                                </li>
                                <li class="list-group-item px-0">
                                    <h5>Date of Birth:</h5>${author.authorDOB}
                                </li>
                                <li class="list-group-item px-0">
                                    <h5>Description: </h5>${author.authorDescript}
                                </li>
                            </ul> 
                        </div>
                        <%
}
                        %>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-pane-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h4 class="mb-4">Top review for "${book.title}"</h4>
                            <div class="media mb-4">
                                <c:choose>
                                    <c:when test="${uReviewed!=null && cReviewed!=null}">
                                <img src="${uReviewed.avatar}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 50px;border-radius: 30%;">
                                <div class="media-body">
                                    <h6>${uReviewed.name}<small> - <i>${cReviewed.commentDate}</i></small></h6>
                                    <div class="text-primary mb-2">
                                                <%                                             
                                                    Comment comReviewed = (Comment) request.getAttribute("cReviewed");
        BigDecimal rating = comReviewed.getRating();
        for(int i = 1; i <= 5; i++) {
            BigDecimal iAsBigDecimal = new BigDecimal(i);
            if(iAsBigDecimal.compareTo(rating) <= 0) {
                out.print("<i class='fas fa-star'></i>");
            } else if (iAsBigDecimal.subtract(rating).compareTo(BigDecimal.ONE) < 0) {
                out.print("<i class='fas fa-star-half-alt'></i>");
            } else {
                out.print("<i class='far fa-star'></i>");
            }
        }
                                                %>
                                    </div>
                                        <p> ${cReviewed.comment}</p>
                                </div>
                                    </c:when>
                                    <c:otherwise>                              
                                <div class="media-body">
                                    <div class="text-primary mb-2">
                                    </div>
                                        <p> No review.</p>
                                </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="mb-4">Leave a review</h4>
<!--                            <small>Your email address will not be published. Required fields are marked *</small>-->
                            <div class="d-flex my-3">
                                <p class="mb-0 mr-2">Your Rating * :</p>
                                <div class="text-primary">
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                            </div>
                            <form>
                                <div class="form-group">
                                    <label for="message">Your Review *</label>
                                    <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                </div>
                                <div class="form-group mb-0">
                                    <input id="submitCommentButton" type="button" value="Leave Your Review" class="btn btn-primary px-3">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
                    function addToCart() {
                        var quantity = document.querySelector('input[name="quantity"]').value;
                        var lang = document.querySelector('input[name="lang"]:checked').value;
                        if (quantity === '0') {
                            alert("Choose at least 1!");
                            return;
                        }
                        // Use AJAX to send a request to add the product to the cart
                        $.ajax({
                            url: 'BookAction?action=addCart',
                            method: 'GET',
                            data: {
                                bookID: ${book.bookID},
                                price: ${book.price},
                                priceDiscount: ${book.priceDiscount},
                                quantity: quantity,
                                langID: lang
                            },
                            success: function (response) {
                                if (response === 'success') {
                                    alert('Add Cart Successful!');
                                    // Update UI if necessary
                                } else {
                                    alert('Failed Add Cart!');
                                }
                            },
                            error: function (xhr) {
                                if (xhr.getResponseHeader('REDIRECT') === 'REDIRECT') {
                                    var redirectPath = xhr.getResponseHeader('CONTENTPATH');
                                    window.location.href = redirectPath;
                                } else {
                                    alert('Error occurred while adding to cart!');
                                }
                            }
                        });
                    }
                    function goToCart() {
                        window.location.href = 'BookAction?action=viewCart';
                    }

                    $(document).ready(function () {
                        $("#submitCommentButton").on("click", function (e) {
                            e.preventDefault();
                            newComment();
                        });

                        function newComment() {
                            var rating = $(".text-primary .fa-star").length; // Get the number of stars
                            var comment = $("#message").val(); // Get the review content
                            var bookID = $("#review").data("bookid");

                            $.ajax({
                                url: "BookAction?action=newComment",
                                method: "GET",
                                data: {
                                    bookID: bookID,
                                    comment: comment,
                                    rating: rating
                                },
                                success: function (response) {
                                    if (response === 'success') {
                                        alert('Comment submitted successfully!');
                                        location.reload();
                                    } else {
                                        alert('Comment submission failed!');
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.error("Error occurred while submitting comment: " + textStatus, errorThrown);
                                }
                            });
                        }
                        calNoReviews();

                        function calNoReviews() {
                            var bookID = $("#review").data("bookid");
                            console.log("book id: " + bookID);
                            $.ajax({
                                url: "BookAction?action=calNoReviews",
                                method: "GET",
                                data: {bookID: bookID},
                                success: function (response) {
                                    if (response.trim() !== "") { // Check if response is not empty
                                        $("#review").text("Reviews (" + response + ")");
                                        console.log("response: " + response);
                                        console.log("Reviews calculated successfully: " + response);
                                    } else {
                                        console.log("Empty response received or response is null.");
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.error("Error occurred while calculating no reviews: " + textStatus, errorThrown);
                                }
                            });
                        }
                        $(".text-primary i").click(function () {
                            $(this).toggleClass("far fas"); // Toggle between far (empty star) and fas (filled star)
                            $(this).prevAll().removeClass("far").addClass("fas"); // Fill all stars before the clicked one
                            $(this).nextAll().removeClass("fas").addClass("far"); // Empty all stars after the clicked one
                        });
                    });

</script>

<!-- Shop Detail End -->
