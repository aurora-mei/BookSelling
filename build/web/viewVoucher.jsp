<%-- 
    Document   : viewVoucher
    Created on : Jul 5, 2024, 4:00:35 AM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/shop_includes/headerShop.jsp" %>
<table>
    <thead>
    <th>Voucher Code</th>
    <th>Voucher Value</th>
</thead>
<tbody>

    <c:forEach var="vou" items="${requestScope.vous}">
        <tr>
            <td>    ${vou.voucherCode} </td>
            <td>    ${vou.voucherValue} </td>
        </tr>
    </c:forEach>
</tbody>
</table>
<%@include file="/shop_includes/footerShop.jsp" %>
