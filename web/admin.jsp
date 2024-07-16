<%-- 
    Document   : admin
    Created on : Jul 14, 2024, 8:13:34 PM
    Author     : THANH HUYEN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Date"%>
<%@include file="/shop_includes/headerShop.jsp" %>
    <body>
        <h1>Admin Page</h1>

        <h2>Add Book</h2>
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="add">
            <!-- Add book fields here -->
            <input type="text" name="title" placeholder="Title">
            <input type="number" name="publisherID" placeholder="Publisher ID">
            <input type="number" step="0.01" name="price" placeholder="Price">
            <input type="number" step="0.01" name="priceDiscount" placeholder="Price Discount">
            <input type="number" name="pages" placeholder="Pages">
            <input type="number" name="avaQuantity" placeholder="Available Quantity">
            <input type="date" name="publishDate" placeholder="Publish Date">
            <textarea name="descriptions" placeholder="Descriptions"></textarea>
            <textarea name="longDescriptions" placeholder="Long Descriptions"></textarea>
            <input type="text" name="imageURL" placeholder="Image URL">
            <button type="submit">Add Book</button>
        </form>

        <h2>Delete Book</h2>
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="delete">
            <input type="number" name="bookID" placeholder="Book ID">
            <button type="submit">Delete Book</button>
        </form>

        <h2>Update Book</h2>
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="update">
            <!-- Update book fields here (similar to add book) -->
            <input type="number" name="bookID" placeholder="Book ID">
            <input type="text" name="title" placeholder="Title">
            <input type="number" name="publisherID" placeholder="Publisher ID">
            <input type="number" step="0.01" name="price" placeholder="Price">
            <input type="number" step="0.01" name="priceDiscount" placeholder="Price Discount">
            <input type="number" name="pages" placeholder="Pages">
            <input type="number" name="avaQuantity" placeholder="Available Quantity">
            <input type="date" name="publishDate" placeholder="Publish Date">
            <textarea name="descriptions" placeholder="Descriptions"></textarea>
            <textarea name="longDescriptions" placeholder="Long Descriptions"></textarea>
            <input type="text" name="imageURL" placeholder="Image URL">
            <button type="submit">Update Book</button>
        </form>

        <h2>View Daily Revenue</h2>
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="viewRevenue">
            <input type="date" name="date" placeholder="Date">
            <button type="submit">View Revenue</button>
        </form>
        

        <% 
            String action = request.getParameter("action");
            if ("viewRevenue".equals(action)) {
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                Book bookModel = new Book();
                BigDecimal revenue = bookModel.getDailyRevenue(date);
                out.println("<p>Revenue for " + date + ": " + revenue + "</p>");
            }
        %>
 <%@include file="/shop_includes/footerShop.jsp" %>