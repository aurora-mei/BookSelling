<%-- 
    Document   : productDetail
    Created on : Jul 2, 2024, 3:11:59 AM
    Author     : THANH HUYEN
--%>
<!--sách cùng thể loại-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="booksSameCate" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="otherBook" class="Model.Book" scope="request"/>

<!-- Products Start -->
<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <%  
for(Object o : booksSameCate){
request.setAttribute("otherBook",(Model.Book)o);
                %>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <%
                            
                            Book bo = (Model.Book)request.getAttribute("otherBook");
                        String imgURL = bo.getImageURLByBook(bo.getBookID());
                        request.setAttribute("imgURL",imgURL);
                        System.out.println("img: "+imgURL);
                        %>
                        <a href="BookAction?action=bookShoppingTitle&title=${otherBook.title}" style="cursor:pointer;">
                            <img class="img-fluid w-100" src="${imgURL}" alt="${otherBook.title}"></a>
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${otherBook.title}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>${otherBook.price}</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="BookAction?action=bookShoppingTitle&title=${otherBook.title}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="BookAction?action=viewCart" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>View Cart</a>
                    </div>
                </div>
                <%
}
                %>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->