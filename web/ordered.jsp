<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/order_includes/headerOrder.jsp" %>
<%@ page import="java.math.BigDecimal, Model.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid pt-5">
    <c:forEach var="order" items="${orders}">
        <div class="row px-xl-5">     
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Title</th>
                            <th>Language</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <%
                            Order o = (Order) pageContext.getAttribute("order");
                            Map<OrderItem, Book> itemsWithBooksMap = o.getOrderItemsWithBooksMap();
                            request.setAttribute("itemsWithBooksMap", itemsWithBooksMap);
                        %>
                        <c:forEach var="entry" items="${itemsWithBooksMap}">
                            <%
                                Map.Entry<OrderItem, Book> mapEntry = (Map.Entry<OrderItem, Book>) pageContext.getAttribute("entry");
                                OrderItem ord = mapEntry.getKey();
                                Book bo = mapEntry.getValue();
                                String langName = new Language().getLanguageNameByOrderItemID(ord.getOrderItemID());
                                 request.setAttribute("ord", ord);
                                  request.setAttribute("bo", bo);
                                   request.setAttribute("langName", langName);
                            %>
                            <tr>
                                <td style="display:flex;justify-content: space-between;"><img src="${bo.imageURL}" alt="${bo.title}" style="width:50px;height:70px;"> ${bo.title}</td>
                                <td>${langName}</td>
                                <td>${ord.priceDiscount}</td>
                                <td>${ord.quantity}</td>
                                <td>${ord.totalPrice}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Summary Of ${order.orderID}</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Payment method</h6>
                            <h6 style="font-weight: normal;">${order.getPaymentNameByCardID(order.cardID)}</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Total price</h6>
                            <h6 style="font-weight: normal;">$${order.totalPrice}</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Order date</h6>
                            <h6 style="font-weight: normal;">${order.orderDate}</h6>
                        </div>
                        <button class="btn btn-block btn-primary my-3 py-3" onclick="cancelOrder(this)" data-order-id="${order.orderID}">Cancel Order</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</div>
<script>
                            function cancelOrder(button) {
                                var orderID = $(button).data('order-id');
                                $.ajax({
                                    url: "BookAction?action=cancelOrder",
                                    method: "GET",
                                    data: {orderID: orderID},
                                    success: function (response) {
                                        if (response !== "error") {
                                            console.log("Cancel order successfully!");
                                            // Remove the parent div of the button
                                            $(button).closest('.row').remove();
                                        } else {
                                            console.log("Failed to cancel order!");
                                        }
                                    },
                                    error: function () {
                                        console.log("Error occurred while canceling order!");
                                    }
                                });
                            }
</script>
<%@include file="/cart_includes/footerCart.jsp" %>
