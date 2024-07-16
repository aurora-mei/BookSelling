package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import Model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Book bookModel = new Book();

        switch (action) {
            case "add":
                // Handle add book
                Book newBook = new Book(
                    0,
                    Integer.parseInt(request.getParameter("publisherID")),
                    request.getParameter("title"),
                    new BigDecimal(request.getParameter("price")),
                    new BigDecimal(request.getParameter("priceDiscount")),
                    Integer.parseInt(request.getParameter("pages")),
                    Integer.parseInt(request.getParameter("avaQuantity")),
                    Date.valueOf(request.getParameter("publishDate")),
                    request.getParameter("descriptions"),
                    request.getParameter("longDescriptions"),
                    request.getParameter("imageURL")
                );
                bookModel.addBook(newBook);
                break;
            case "delete":
                // Handle delete book
                int bookIDToDelete = Integer.parseInt(request.getParameter("bookID"));
                bookModel.deleteBook(bookIDToDelete);
                break;
            case "update":
                // Handle update book
                Book updatedBook = new Book(
                    Integer.parseInt(request.getParameter("bookID")),
                    Integer.parseInt(request.getParameter("publisherID")),
                    request.getParameter("title"),
                    new BigDecimal(request.getParameter("price")),
                    new BigDecimal(request.getParameter("priceDiscount")),
                    Integer.parseInt(request.getParameter("pages")),
                    Integer.parseInt(request.getParameter("avaQuantity")),
                    Date.valueOf(request.getParameter("publishDate")),
                    request.getParameter("descriptions"),
                    request.getParameter("longDescriptions"),
                    request.getParameter("imageURL")
                );
                bookModel.updateBook(updatedBook);
                break;
            case "viewRevenue":
                // Handle view revenue
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                BigDecimal revenue = bookModel.getDailyRevenue(date);
                request.setAttribute("revenue", revenue);
                request.setAttribute("date", date);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                return; // Prevent redirect
        }

        response.sendRedirect("admin.jsp");
    }
}