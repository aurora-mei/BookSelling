<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/shop_includes/headerShop.jsp" %>

<style>
    body {
        font-family: Arial, sans-serif;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #C5837C;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
</style>

<table>
    <thead>
        <tr>
            <th>Voucher Code</th>
            <th>Voucher Value</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="vou" items="${requestScope.vous}">
            <tr>
                <td>${vou.voucherCode}</td>
                <td>${vou.voucherValue}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%@include file="/shop_includes/footerShop.jsp" %>