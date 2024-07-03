/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;

/**
 *
 * @author THANH HUYEN
 */
public class BookAction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = "";
        String actionParam = request.getParameter("action");
        if (actionParam != null) {
            action = actionParam;
        }
        switch (action) {
            case "bookShoppingImg" -> {
                String imgURL = request.getParameter("imgURL");
                Book b = new Book();
                //lấy sách từ ảnh
                b = b.getBookByImage(imgURL);

                //lấy NXB sách
                Publisher p = b.getPublisherByBookID(b.getBookID());
                Category c = b.getCategoryByBookID(b.getBookID());
                //lấy ngôn ngữ sách
                ArrayList<Language> langList = b.getListLanguagesBook(b.getBookID());
                //lấy ảnh sách
                ArrayList<String> imgList = b.getListImagesBook(b.getBookID());
                //lấy tác giả sách
                ArrayList<Author> auList = b.getListAuthorsBook(b.getBookID());
                for (Author a : auList) {
                    System.out.println(a);
                }
                //user & comment cao rating nhất
                User uReviewed = new User();
                Comment cReviewed = new Comment();
                cReviewed = cReviewed.getLargestRatingComment(b.getBookID());
                uReviewed = uReviewed.getLargestRatingUser(b.getBookID());
                BigDecimal avgRating = cReviewed.getAverageRating(b.getBookID());
                //lấy các sách cùng thể loại
                ArrayList<Book> booksSameCate = b.getListBookByCategoryName(c.getCategoryName());
                request.setAttribute("booksSameCate", booksSameCate);
                request.setAttribute("book", b);
                request.setAttribute("publisher", p);
                request.setAttribute("category", c);
                request.setAttribute("langList", langList);
                request.setAttribute("imgList", imgList);
                request.setAttribute("auList", auList);
                request.setAttribute("avgRating", avgRating);
                request.setAttribute("uReviewed", uReviewed);
                request.setAttribute("cReviewed", cReviewed);
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            }
            case "bookShoppingTitle" -> {
                String title = request.getParameter("title");
                System.out.println(title);
                Book b = new Book();
//                //lấy sách từ ảnh
                b = b.getBookByTitle(title);
//                //lấy NXB sách
                Publisher p = b.getPublisherByBookID(b.getBookID());
                Category c = b.getCategoryByBookID(b.getBookID());
//                //lấy ngôn ngữ sách
                ArrayList<Language> langList = b.getListLanguagesBook(b.getBookID());
//                //lấy ảnh sách
                ArrayList<String> imgList = b.getListImagesBook(b.getBookID());
                //lấy tác giả sách
                ArrayList<Author> auList = b.getListAuthorsBook(b.getBookID());
                for (Author a : auList) {
                    System.out.println(a);
                }
//                //user & comment cao rating nhất
                User uReviewed = new User();
                Comment cReviewed = new Comment();
                cReviewed = cReviewed.getLargestRatingComment(b.getBookID());
                uReviewed = uReviewed.getLargestRatingUser(b.getBookID());
                BigDecimal avgRating = cReviewed.getAverageRating(b.getBookID());
//                //lấy các sách cùng thể loại
                ArrayList<Book> booksSameCate = b.getListBookByCategoryName(c.getCategoryName());
                request.setAttribute("auList", auList);
                request.setAttribute("booksSameCate", booksSameCate);
                request.setAttribute("book", b);
                request.setAttribute("publisher", p);
                request.setAttribute("category", c);
                request.setAttribute("langList", langList);
                request.setAttribute("imgList", imgList);
                request.setAttribute("uReviewed", uReviewed);
                request.setAttribute("cReviewed", cReviewed);
                request.setAttribute("avgRating", avgRating);
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            }
            case "filter" -> {
                String by = (String) request.getParameter("by");
                switch (by) {
                    case "year" -> {
                        String minY = (String) request.getParameter("minY");
                        String maxY = (String) request.getParameter("maxY");
                        Book b = new Book();
                        ArrayList<Book> bookList = b.getListBookByYears(minY, maxY);
                        System.out.println("List book from " + minY + " to " + maxY);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "author" -> {
                        ArrayList<Book> bookList = new ArrayList<>();
                        String name = (String) request.getParameter("name");
                        Book b = new Book();
                        if (name.equals("all")) {
                            bookList = b.getListBookByAllAuthor();
                        } else {
                            bookList = b.getListBookByAuthorName(name);
                        }
                        System.out.println("List book of " + name);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "category" -> {
                        ArrayList<Book> bookList = new ArrayList<>();
                        String cate = (String) request.getParameter("cate");
                        Book b = new Book();
                        if (cate.equals("all")) {
                            bookList = b.getListBookByAllCategory();
                        } else {
                            bookList = b.getListBookByCategoryName(cate);
                        }
                        System.out.println("List book of " + cate);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "none" -> {
                        Book b = new Book();
                        ArrayList<Book> bookList = new ArrayList<>();
                        bookList = b.getListBookByAllAuthor();
                        System.out.println("List book of all");
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                }
            }
            case "addCart" -> {
                HttpSession session = request.getSession(false);
                if (session == null) {
                    out.println("<script> alert(\"No session found!\");</script>");
                    return;
                }
                try {
                    int bookID = Integer.parseInt(request.getParameter("bookID"));
                    Book b = new Book();
                    b = b.getBook(bookID);
                    User user = (User) session.getAttribute("user");
                    int userID = user.getUserID();
                    int langID = Integer.parseInt(request.getParameter("langID"));
                     BigDecimal price= new BigDecimal(request.getParameter("price"));
                    BigDecimal priceDiscount = new BigDecimal(request.getParameter("priceDiscount"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    CartItem cartI = new CartItem(userID, bookID, langID, quantity, price,priceDiscount);
                    int res = cartI.newCartItem(cartI);
                    if (res > 0) {
                        response.getWriter().write("success");
                    } else {
                        response.getWriter().write("error");
                    }
                } catch (NumberFormatException e) {
                    out.println("<script> alert(\"" + e + "\");</script>");
                    out.println("<script> alert(\"Invalid number format!\");</script>");
                }
            }
            case "viewCart" -> {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    try {
                        User user = (User) session.getAttribute("user");
                        int userID = user.getUserID();
                        CartItem c = new CartItem();
                        ArrayList<CartItem> cartList = c.getListCartItem(userID);
                        ArrayList<Book> booksInCart = new ArrayList<>();
                        ArrayList<Language> langsInCart = new ArrayList<>();
                        for (CartItem cartItem : cartList) {
                            Book book = new Book();
                            book = book.getBook(cartItem.getBookID());
                            booksInCart.add(book);

                            Language lang = new Language();
                            lang = lang.getLanguage(cartItem.getBookID());
                            langsInCart.add(lang);
                        }
                        session.setAttribute("langsInCart", langsInCart); // Fixed here
                        session.setAttribute("booksInCart", booksInCart);
                        session.setAttribute("cartList", cartList);
                        request.getRequestDispatcher("cart.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                        out.println("<script> alert(\"Invalid number format!\");</script>");
                    }
                }
            }
            case "deleteCart" -> {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                CartItem c = new CartItem();
                int res = c.deleteCartItem(cartItemID);
                if (res >= 0) {
                    response.getWriter().write("success"); // Gửi lại response cho AJAX
                } else {
                    response.getWriter().write("error");
                }
            }
            case "updateQuantity" -> {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
                CartItem cartItem = new CartItem();
                CartItem updatedCartItem = cartItem.updateCartItemQuantity(cartItemID, newQuantity);
                if (updatedCartItem != null) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("error");
                }
                out.flush();
            }
            default -> {
                request.getRequestDispatcher("index.html").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
