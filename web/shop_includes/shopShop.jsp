<%-- 
    Document   : shopShop
    Created on : Jul 2, 2024, 10:41:57 AM
    Author     : THANH HUYEN
--%>
<%@page import="java.util.*,Model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.math.BigDecimal, Model.*" %>
<%@page import="com.google.gson.Gson"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<jsp:useBean id="bookList" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="bo" class="Model.Book" scope="request"/>
<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Author Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Tác Giả</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">


                        <a href=""><input type="checkbox" class="custom-control-input" id="authors-0">
                            <label class="custom-control-label" for="authors-0">Tất Cả</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""><input type="checkbox" class="custom-control-input" id="authors-1">
                            <label class="custom-control-label" for="authors-1">Nguyễn Nhật Ánh</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""><input type="checkbox" class="custom-control-input" id="authors-2">
                            <label class="custom-control-label" for="authors-2">Karuho Shiina</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""><input type="checkbox" class="custom-control-input" id="authors-3">
                            <label class="custom-control-label" for="authors-3">Clamp</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""><input type="checkbox" class="custom-control-input" id="authors-4">
                            <label class="custom-control-label" for="authors-4">Antoine de Saint-Exupéry</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <a href=""><input type="checkbox" class="custom-control-input" id="authors-5">
                            <label class="custom-control-label" for="authors-5">Susan David</label></a>
                    </div>
                </form>
            </div>

            <!-- Author End -->

            <!-- Specifies Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Thể Loại</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""> <input type="checkbox" class="custom-control-input" id="cates-0">
                            <label class="custom-control-label" for="cates-0">Tất Cả</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""> <input type="checkbox" class="custom-control-input" id="cates-1">
                            <label class="custom-control-label" for="cates-1">Tình Cảm Học Đường</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""> <input type="checkbox" class="custom-control-input" id="cates-2">
                            <label class="custom-control-label" for="cates-2">Tâm Lý Học</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""> <input type="checkbox" class="custom-control-input" id="cates-3">
                            <label class="custom-control-label" for="cates-3">Manga</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href=""> <input type="checkbox" class="custom-control-input" id="cates-4">
                            <label class="custom-control-label" for="cates-4">Comic Book</label></a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <a href=""> <input type="checkbox" class="custom-control-input" id="cates-5">
                            <label class="custom-control-label" for="cates-5">Cách Mạng-Chính Trị</label></a>
                    </div>
                </form>
            </div>
            <!-- Specifies End -->

            <!-- Years Start -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Năm Xuất Bản</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href="">
                            <input type="checkbox" class="custom-control-input" id="years-0">
                            <label class="custom-control-label" for="years-0">2005 --> 2010</label>
                        </a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href="">
                            <input type="checkbox" class="custom-control-input" id="years-1">
                            <label class="custom-control-label" for="years-1">2011 --> 2016</label>
                        </a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href="">
                            <input type="checkbox" class="custom-control-input" id="years-2">
                            <label class="custom-control-label" for="years-2">2017 --> 2021</label>
                        </a>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <a href="">
                            <input type="checkbox" class="custom-control-input" id="years-3">
                            <label class="custom-control-label" for="years-3">2022 --> 2024</label>
                        </a>

                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">          
                        <a href="">
                            <input type="checkbox" class="custom-control-input" id="years-4">
                            <label class="custom-control-label" for="years-4">Đã Hoàn Thành</label>
                        </a>

                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <a href="">                            
                            <input type="checkbox" class="custom-control-input" id="years-5">
                            <label class="custom-control-label" for="years-5">Đang ra</label>
                        </a>
                    </div>
                </form>
            </div>
            <!-- Years End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form onsubmit="event.preventDefault(); searchByName();">
                            <div class="input-group">
                                <c:choose>
                                    <c:when test="${name != null}">
                                        <input type="text" class="form-control" placeholder="Search by name" value="${name}">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" placeholder="Search by name">
                                    </c:otherwise>
                                </c:choose>
                                <div onclick="searchByName()" class="input-group-append" style="cursor: pointer;">                           
                                    <span class="input-group-text bg-transparent text-primary">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">

                                <a style='cursor: pointer;' class="dropdown-item" onclick="sortBooks('latest')">Latest</a>
                                <a style='cursor: pointer;' class="dropdown-item" onclick="sortBooks('popularity')">Popularity</a>
                                <a style='cursor: pointer;' class="dropdown-item" onclick="sortBooks('bestRating')">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%            
for(Object o:bookList){
request.setAttribute("bo",(Model.Book)o);
                %>
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="${bo.imageURL}" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">${bo.title}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>${bo.price}</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="BookAction?action=bookShoppingTitle&title=${bo.title}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href="BookAction?action=viewCart" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>View Cart</a>
                        </div>
                    </div>
                </div>
                <%
}
                %>

                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>

<% 
String currentYear = "" + Calendar.getInstance().get(Calendar.YEAR);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
                                    $(document).ready(function () {
                                        var years = [
                                            {id: 0, minY: "2005", maxY: "2010"},
                                            {id: 1, minY: "2011", maxY: "2016"},
                                            {id: 2, minY: "2017", maxY: "2021"},
                                            {id: 3, minY: "2022", maxY: "2024"},
                                            {id: 4, minY: "0001", maxY: "<%=currentYear%>"},
                                            {id: 5, minY: "<%=currentYear%>", maxY: "<%=currentYear%>"}
                                        ];

                                        years.forEach(function (year) {
                                            var checkbox = "#years-" + year.id;
                                            // Retrieve and apply the stored state
                                            if (localStorage.getItem('checkbox_state_' + year.id) === 'true') {
                                                $(checkbox).prop('checked', true);
                                            }
                                            $(checkbox).click(function () {
                                                localStorage.setItem('checkbox_state_' + year.id, $(checkbox).is(':checked'));
                                                if ($(checkbox).is(':checked')) {
                                                    window.location.href = "BookAction?action=filter&by=year&minY=" + year.minY + "&maxY=" + year.maxY;
                                                } else {
                                                    window.location.href = "BookAction?action=filter&by=none";
                                                }
                                            });
                                        });

                                        var authors = [
                                            {id: 0, nameAuthor: "all"},
                                            {id: 1, nameAuthor: "Nguyễn Nhật Ánh"},
                                            {id: 2, nameAuthor: "Karuho Shiina"},
                                            {id: 3, nameAuthor: "Clamp"},
                                            {id: 4, nameAuthor: "Antoine de Saint-Exupéry"},
                                            {id: 5, nameAuthor: "Susan David"}
                                        ];

                                        authors.forEach(function (author) {
                                            var checkbox = "#authors-" + author.id;
                                            // Retrieve and apply the stored state
                                            if (localStorage.getItem('checkbox_state_' + author.id) === 'true') {
                                                $(checkbox).prop('checked', true);
                                            }
                                            $(checkbox).click(function () {
                                                localStorage.setItem('checkbox_state_' + author.id, $(checkbox).is(':checked'));
                                                if ($(checkbox).is(':checked')) {
                                                    window.location.href = "BookAction?action=filter&by=author&nameAuthor=" + author.nameAuthor;
                                                } else {
                                                    window.location.href = "BookAction?action=filter&by=none";
                                                }
                                            });
                                        });

                                        var cates = [
                                            {id: 0, name: "all"},
                                            {id: 1, name: "Tình Cảm Học Đường"},
                                            {id: 2, name: "Tâm Lý"},
                                            {id: 3, name: "Manga"},
                                            {id: 4, name: "Comic Book"},
                                            {id: 5, name: "Cách Mạng-Chính Trị"}
                                        ];

                                        cates.forEach(function (cate) {
                                            var checkbox = "#cates-" + cate.id;
                                            // Retrieve and apply the stored state
                                            if (localStorage.getItem('checkbox_state_' + cate.id) === 'true') {
                                                $(checkbox).prop('checked', true);
                                            }
                                            $(checkbox).click(function () {
                                                localStorage.setItem('checkbox_state_' + cate.id, $(checkbox).is(':checked'));
                                                if ($(checkbox).is(':checked')) {
                                                    window.location.href = "BookAction?action=filter&by=category&cate=" + cate.name;
                                                } else {
                                                    window.location.href = "BookAction?action=filter&by=none";
                                                }
                                            });
                                        });
                                    });
</script>

<!-- Shop End -->

