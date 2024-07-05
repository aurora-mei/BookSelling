<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/cart_includes/headerCart.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid pt-5">
    <c:forEach var="order" items="${orders}">
        <h3>Order ID: ${order.orderID}</h3>
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
                        </tr>
                    </thead>
                    <tbody class="align-middle">

                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Payment method</h6>
                            <h6 style="font-weight: normal;">${order.getPaymentNameByCardID(order.cardID)}</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Total price</h6>
                            <h6 style="font-weight: normal;">$${order.totalPrice}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<%@include file="/cart_includes/footerCart.jsp" %>
