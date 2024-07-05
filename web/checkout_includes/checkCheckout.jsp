<%-- 
    Document   : checkCheckout
    Created on : Jul 4, 2024, 3:20:07 AM
    Author     : THANH HUYEN
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.math.BigDecimal, Model.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Checkout Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div class="mb-4">
                <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Full Name</label>
                        <input class="form-control" type="text" value="${user.name}">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>E-mail</label>
                        <input class="form-control" type="text" value="${user.email}">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Mobile No</label>
                        <input class="form-control" type="text" value="${user.phoneNum}">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Address</label>
                        <select name="address" class="custom-select">
                            <c:forEach var="addr" items="${addressList}">
                                <option id='${addr.addressID}'>${addr.toString()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="shipto">
                            <label class="custom-control-label" for="shipto" data-toggle="collapse" data-target="#shipping-address">Ship to new address</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse mb-4" id="shipping-address">
                <h4 class="font-weight-semi-bold mb-4">New Shipping Address</h4>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Street</label>
                        <input class="form-control" type="text" placeholder="123 Main St">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Building No</label>
                        <input class="form-control" type="text" placeholder="Apt 4B">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>City</label>
                        <input class="form-control" type="text" placeholder="New York">
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Save Address</button>
                    </div>
                </div>
            </div>
            <div class="collapse mb-4" id="bank-cards">
                <!--<h4 class="font-weight-semi-bold mb-4">Cards</h4>-->
                <div id="cards-container">
                    <!-- Cards will be loaded here by JavaScript -->
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                </div>
                <div class="card-body">
                    <h5 class="font-weight-medium mb-3">Products</h5>
                    <c:forEach var="abook" items="${sessionScope.bookOrderList}">
                        <div class="d-flex justify-content-between">
                            <p>${abook.title}</p>
                            <p>${abook.avaQuantity}</p>
                            <p>${abook.priceDiscount}</p>
                        </div>
                    </c:forEach>
                    <hr class="mt-0">
                    <div class="d-flex justify-content-between ">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <h6 class="font-weight-medium" id="subtotal">${order.originPrice}</h6>
                    </div>
                    <div class="d-flex justify-content-between ">
                        <h6 class="font-weight-medium">Voucher</h6>
                        <h6 class="font-weight-medium">-$
                            <c:choose>
                                <c:when test="${order.voucherID != null}">
                                    ${order.getVoucherValueByVID(order.voucherID)}
                                </c:when>
                                <c:when test="${order.voucherID == null}">
                                    0
                                </c:when>
                            </c:choose>
                        </h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <select name="ship-method" style='width:120px;'>
                            <c:forEach var="ship" items="${sessionScope.shipList}">   
                                <option id='${ship.shippingMethodID}'value='${ship.cost}'>${ship.methodName}</option>
                            </c:forEach>
                        </select>
                        <h6 class="font-weight-medium">$0</h6>

                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">${order.totalPrice}</h5>
                    </div>
                </div>
            </div>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Payment</h4>
                </div>
                <div class="card-body">
                    <c:forEach var="payment" items="${sessionScope.payList}">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <c:choose>
                                    <c:when test="${payment.paymentMethodID==1}">
                                        <input type="radio" name="payment" id="${payment.paymentMethodID}" value="${payment.paymentName}" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="radio" name="payment" id="${payment.paymentMethodID}" value="${payment.paymentName}">
                                    </c:otherwise>
                                </c:choose>
                                <label for="${payment.paymentMethodID}">${payment.paymentName}</label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <button onclick="placeOrder(event)" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
                        // Flag to indicate if the form submission is intentional
                        var isSubmittingOrder = false;
                        // Place order function
                        function placeOrder(event) {
                            event.preventDefault();
                            isSubmittingOrder = true;
                            var shippingID = $('select[name="ship-method"] option:selected').attr('id');
                            var addressID = $('select[name="address"] option:selected').attr('id');
                            var cardID = $('input[name="paymentCard"]:checked').attr('id');
                            if (cardID === null || cardID === "" || addressID === null || addressID === "" || shippingID === null || shippingID === "") {
                                alert('Must choose essential item!');
                                return;
                            }
                            var form = $('<form></form>').attr('action', 'BookAction').attr('method', 'get');
                            form.append($('<input>').attr('type', 'hidden').attr('name', 'action').attr('value', 'placeOrder'));
                            form.append($('<input>').attr('type', 'hidden').attr('name', 'shippingID').attr('value', shippingID));
                            form.append($('<input>').attr('type', 'hidden').attr('name', 'addressID').attr('value', addressID));
                            form.append($('<input>').attr('type', 'hidden').attr('name', 'cardID').attr('value', cardID));
                            $('body').append(form);
                            form.submit();
                        }

                        $(document).ready(function () {
                            // Handle shipping method selection
                            function updateTotalPrice() {
                                var shippingValue = $('select[name="ship-method"]').find('option:selected').val(); // Get the value of the selected option
                                var shippingValueNum = Number(shippingValue);
                                var subTotalStr = $('h6.font-weight-medium').eq(1).text(); // Get the text of the first <h6> element
                                var subTotalNum = Number(subTotalStr.replace('$', '')); // Remove the dollar sign and convert to number

                                var voucherValueStr = $('h6.font-weight-medium').eq(3).text(); // Get the text of the second <h6> element
                                var voucherValueNum = Number(voucherValueStr.replace('-$', '')); // Remove the dollar sign and convert to number

                                $('h6.font-weight-medium').last().text('$' + shippingValue);
                                console.log("voucher: " + voucherValueNum);
                                console.log("shipping: " + shippingValueNum);
                                console.log("total price: " + subTotalNum);
                                var totalPrice = subTotalNum - voucherValueNum + shippingValueNum;
                                $(".font-weight-bold:contains('Total')").next().text('$' + totalPrice.toFixed(2));
                            }

                            $('select[name="ship-method"]').on('change', updateTotalPrice);
                            // Handle payment method selection
                            $('input[type="radio"][name="payment"]').on('change', function () {
                                var paymentMethodName = $(this).val();
                                console.log("load card run");
                                console.log("payment name:" + paymentMethodName);
                                var userID = '<%= ((User) session.getAttribute("user")).getUserID() %>';
                                loadCards(paymentMethodName, userID);
                            });
                            function loadCards(paymentMethodName, userID) {
                                $.ajax({
                                    url: 'BookAction?action=getSavedCards',
                                    type: 'GET',
                                    data: {
                                        paymentMethodName: paymentMethodName,
                                        userID: userID
                                    },
                                    success: function (data) {
                                        console.log("load card success!");
                                        $('#cards-container').html(data);
                                        $('#bank-cards').collapse('show');
                                    },
                                    error: function () {
                                        console.log("load card failed!");
                                        alert('Failed to load cards.');
                                    }
                                });
                            }

                            // Handle the event when the user leaves the page
                            window.onbeforeunload = function () {
                                if (!isSubmittingOrder) {
                                    // Send an AJAX request to delete the order
                                    var orderID = '${order.orderID}';
                                    var url = 'BookAction?action=deleteOrder&orderID=' + orderID;
                                    // Use navigator.sendBeacon for reliable data transmission on page unload
                                    navigator.sendBeacon(url);
                                }
                            };
                            window.onload = function () {
                                updateTotalPrice();
                                var checkedPaymentMethod = $('input[type="radio"][name="payment"]:checked').val();
                                var userID = '<%= ((User) session.getAttribute("user")).getUserID() %>';
                                loadCards(checkedPaymentMethod, userID);
                            };
                        });
</script>
<!-- Checkout End -->
