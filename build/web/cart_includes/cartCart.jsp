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
                        <% 
                        CartItem ca = (CartItem) pageContext.getAttribute("cart");
                        String languageName = ca.getLanguageNameByCartID(ca.getCartItemID());
                        request.setAttribute("languageName",languageName);
                        %>
                        <tr>
                            <td style="width:30px;"><input class='add-order-item' type="checkbox" id="cart-${status.index}" style="width: 20px;" value="${cart.cartItemID}"> </td>
                            <td class="align-middle" style="display:flex;justify-content: space-between;align-items: center;">
                                <img src="${b.imageURL}" alt="" style="width: 30px;"> 
                                <p style="font-size: 15px;">${b.title}</p>
                            </td>
                            <td class="align-middle">${languageName}</td>
                            <td class="align-middle"><pre>${cart.priceDiscount} <del>${cart.price}</del></pre></td>
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
                            <td class="align-middle total-price">${cart.totalPrice}</td>
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
                        <button type="button" class="btn btn-primary" onclick="applyVoucher()">Apply Coupon</button>
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
                        <h6 class="font-weight-medium">$0</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Voucher Value</h6>
                        <h6 class="font-weight-medium">-$0</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">$0</h5>
                    </div>
                    <button class="btn btn-block btn-primary my-3 py-3" onclick="proceedToCheckout()">Proceed To Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
                        function applyVoucher() {
                            var voucherCode = $('input[placeholder="Coupon Code"]').val();
                            var subTotalText = $(".font-weight-medium:contains('Subtotal')").next().text();
                            var subTotal = Number(subTotalText.replace('$', ''));
                            if (voucherCode.length === 0) {
                                voucherCode = "none";
                            }
                            $.ajax({
                                url: "BookAction?action=applyVoucher",
                                method: "GET",
                                data: {voucherCode: voucherCode},
                                success: function (response) {
                                    if (response !== "error") {
                                        var voucher = JSON.parse(response);
                                        var voucherValue = Number(voucher.voucherValue);
                                        var totalPrice = subTotal - voucherValue;
                                        $(".font-weight-medium:contains('Voucher Value')").next().text("-$" + voucherValue.toFixed(2));
                                        $(".font-weight-bold:contains('Total')").next().text("$" + totalPrice.toFixed(2));
                                        console.log("Subtotal: " + subTotal);
                                        console.log("Apply voucher successfully!");
                                    } else {
                                        console.log("Failed to apply voucher!");
                                    }
                                },
                                error: function () {
                                    console.log(voucherCode);
                                    console.log("Error occurred while applying voucher!");
                                }
                            });
                        }
                        function proceedToCheckout() {
                            var subTotalText = $(".font-weight-medium:contains('Subtotal')").next().text();
                            var subTotal = Number(subTotalText.replace('$', ''));
                            var voucherCode = $('input[placeholder="Coupon Code"]').val();

                            // Get all checked cartItemIDs
                            var cartItemIDs = [];
                            $('input[type="checkbox"]:checked').each(function () {
                                cartItemIDs.push($(this).val());
                            });
                            if (cartItemIDs.length !== 0) {
                                // Create a hidden form
                                var form = $('<form></form>').attr('action', 'BookAction').attr('method', 'get');
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'action').attr('value', 'proceedToCheckout'));
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'voucherCode').attr('value', voucherCode));
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'subTotal').attr('value', subTotal));
                                form.append($('<input>').attr('type', 'hidden').attr('name', 'cartItemIDs').attr('value', JSON.stringify(cartItemIDs)));
                                // Append the form to the body and submit it
                                $('body').append(form);
                                form.submit();
                            } else {
                                alert("Choose item first!");
                            }
                        }
                        function deleteCartItem(cartItemID) {
                            $.ajax({
                                url: "BookAction?action=deleteCart",
                                method: "GET",
                                data: {cartItemID: cartItemID},
                                success: function (response) {
                                    if (response === "success") {
                                        $("tr[data-cartitemid='" + cartItemID + "']").remove();
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
                        }

                        $(document).ready(function () {
                            window.onload = function () {
                                updateCartTotal();
                            };
                            $(".btn-minus, .btn-plus").click(function () {
                                var $row = $(this).closest('tr');
                                var cartItemID = $row.find('input[type="checkbox"]').val();
                                var newQuantity = $(this).parent().siblings('input').val();
                                var $totalPriceElement = $row.find('.total-price');
                                var isChecked = $row.find('input[type="checkbox"]').prop("checked");
                                if (newQuantity === '0') {
                                    var confirmDelete = confirm("Do you really want to delete this cart item?");
                                    if (confirmDelete) {
                                        deleteCartItem(cartItemID);
                                        return; // Exit the function if the item is deleted
                                    } else {
                                        newQuantity = '1'; 
                                        $(this).parent().siblings('input').val(newQuantity);
                                    }
                                }
                                $.ajax({
                                    url: "BookAction?action=updateQuantity",
                                    method: "GET",
                                    data: {cartItemID: cartItemID, newQuantity: newQuantity},
                                    success: function (response) {
                                        $totalPriceElement.text(response);
                                        if (isChecked) {
                                            updateOrderQuantity(cartItemID, newQuantity);
                                        }
                                        updateCartTotal();
                                        console.log(isChecked);
                                        console.log(response);
                                        console.log("Quantity updated successfully");
                                    },
                                    error: function () {
                                        console.log("Error occurred while updating quantity");
                                    }
                                });
                            });

                            $(".delete-cart-item").click(function () {
                                var cartItemID = $(this).data("cartitemid");
                                deleteCartItem(cartItemID);
                            });

                            $(".add-order-item").click(function () {
                                updateCartTotal();
                                var isChecked = $(this).prop("checked");
                                var cartItemID = $(this).closest('tr').find('input[type="checkbox"]').val();
                                var action = isChecked ? "addOrderItem" : "deleteOrderItem";
                                $.ajax({
                                    url: "BookAction?action=" + action,
                                    method: "GET",
                                    data: {cartItemID: cartItemID},
                                    success: function (response) {
                                        if (response === "success") {
                                            updateCartTotal();
                                            console.log("Action processed successfully");
                                        } else {
                                            console.log("Failed to process action");
                                        }
                                    },
                                    error: function () {
                                        console.log("Error occurred while processing action");
                                    }
                                });
                            });

                            function updateCartTotal() {
                                var total = 0;
                                $('input[type="checkbox"]:checked').each(function () {
                                    var $row = $(this).closest('tr');
                                    var totalPriceText = $row.find('.total-price').text();
                                    var totalPrice = Number(totalPriceText.replace('$', ''));
                                    total += totalPrice;
                                });
                                $(".font-weight-medium:contains('Subtotal')").next().text("$" + total.toFixed(2));
                                $(".font-weight-bold:contains('Total')").next().text("$" + total.toFixed(2));
                            }

                            function updateOrderQuantity(cartItemID, newQuantity) {
                                $.ajax({
                                    url: "BookAction?action=updateOrderQuantity",
                                    method: "GET",
                                    data: {cartItemID: cartItemID, newQuantity: newQuantity},
                                    success: function (response) {
                                        if (response === "success") {
                                            console.log("Order quantity updated successfully");
                                            updateCartTotal();
                                        } else {
                                            console.log("Order quantity update failed");
                                        }
                                    },
                                    error: function () {
                                        console.log("Error occurred while updating order quantity");
                                    }
                                });
                            }
                        });
</script>
<!-- Cart End -->
