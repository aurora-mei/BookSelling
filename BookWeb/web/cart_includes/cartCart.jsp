<%-- 
    Document   : cartCart
    Created on : Jul 2, 2024, 11:10:59 PM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.math.BigDecimal, Model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                    <tr>
                        <th></th>
                        <th>Title</th>
                        <th>Language</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                    <c:forEach var="cart" items="${sessionScope.cartList}" varStatus="status">
                        <c:set var="b" value="${sessionScope.booksInCart[status.index]}" />
                        <c:set var="l" value="${sessionScope.langsInCart[status.index]}" />
                        <tr>
                            <td style="width:30px;"><input class='add-order-item' type="checkbox" id="cart-${status.index}" style="width: 20px;" value="${cart.cartItemID}"> </td>
                            <td class="align-middle" style="display:flex;justify-content: space-between;align-items: center;">
                                <img src="${b.imageURL}" alt="" style="width: 30px;"> 
                                <p style="font-size: 15px;">${b.title}</p>
                            </td>
                            <td class="align-middle">${l.languageName}</td>
                            <td class="align-middle"><pre>${cart.priceDiscount} <del>${cart.price}</pre></del></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${cart.quantity}">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">${cart.totalPrice}</td>
                            <td class="align-middle"> 
                                <button class="btn btn-sm btn-primary delete-cart-item" data-cartItemID="${cart.cartItemID}">
                                    <i class="fa fa-times"></i>
                                </button>
                        </tr>
                            </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <form class="mb-5" action="">
                <div class="input-group">
                    <input type="text" class="form-control p-4" placeholder="Coupon Code">
                    <div class="input-group-append">
                        <button class="btn btn-primary">Apply Coupon</button>
                    </div>
                </div>
            </form>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <h6 class="font-weight-medium">$150</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">$10</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">$160</h5>
                    </div>
                    <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        //ajax gửi request từ jsp tới server
        //server nhận tham số và xử lý, gửi response về lại cho ajax
        //ajax nhận, nếu success thì làm gì, error thì làm gì
        $(".btn-minus, .btn-plus").click(function () {
            var cartItemID = $(this).closest('tr').find('input[type="checkbox"]').val();
            var newQuantity = $(this).parent().siblings('input').val();
            $.ajax({
                url: "BookAction?action=updateQuantity",
                method: "GET",
                data: {cartItemID: cartItemID, newQuantity: newQuantity},
                success: function (response) {
                    if (response === "success") {
                        // Cập nhật UI nếu cần thiết
                        location.reload();
                        console.log("Quantity updated successfully");
                    } else {
                        console.log("Failed to update quantity");
                    }
                },
                error: function () {
                    console.log("Error occurred while updating quantity");
                }
            });
        });

         $(".delete-cart-item").click(function () {
            var cartItemID = $(this).data("cartitemid");
            $.ajax({
                url: "BookAction?action=deleteCart",
                method: "GET",
                data: { cartItemID: cartItemID },
                success: function (response) {
                    // Xử lý response từ server
                    if (response === "success") {
                        // Xóa phần tử cart item khỏi UI
                        $(this).closest("tr").remove();
                        location.reload();
                        console.log("Cart item deleted successfully!");
                    } else {
                        console.log("Failed to delete cart item!");
                    }
                },
                error: function () {
                    console.log("Error occurred while deleting cart item!");
                }
            });
        });
         $(".add-order-item").click(function () {
            var cartItemID = $(this).closest('tr').find('input[type="checkbox"]').val();
            var newQuantity = $(this).parent().siblings('input').val();
            $.ajax({
                url: "BookAction?action=updateQuantity",
                method: "GET",
                data: {cartItemID: cartItemID, newQuantity: newQuantity},
                success: function (response) {
                    if (response === "success") {
                        // Cập nhật UI nếu cần thiết
                        location.reload();
                        console.log("Quantity updated successfully");
                    } else {
                        console.log("Failed to update quantity");
                    }
                },
                error: function () {
                    console.log("Error occurred while updating quantity");
                }
            });
        });
    });
</script>
<!-- Cart End -->

