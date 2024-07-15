/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.*;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.ArrayList;

/**
 *
 * @author THANH HUYEN
 */
public class BookActionAA extends HttpServlet {

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
                if (b == null) {
                    out.println("<script> alert(\"Book not found for image URL: " + imgURL + "\");</script>");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                    return;
                }
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
                BigDecimal avgRating = new BigDecimal("01");
                if (cReviewed != null) {
                    avgRating = cReviewed.getAverageRating(b.getBookID());
                }
                //lấy các sách cùng thể loại
                ArrayList<Book> booksSameCate = new ArrayList<>();
                if (c != null) {
                     booksSameCate= b.getListBookByCategoryName(c.getCategoryName());
                     request.setAttribute("category", c);
                } else {
                    booksSameCate= b.getListBookByCategoryName("Manga");
                }
                HttpSession session = request.getSession();
                session.setAttribute("lastTitle", b.getTitle());
                request.setAttribute("lastTitle", b.getTitle());
                request.setAttribute("booksSameCate", booksSameCate);
                request.setAttribute("book", b);
                request.setAttribute("publisher", p);
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
                System.out.println("title: " + title);
                Book b = new Book();
//                //lấy sách từ ảnh
                b = b.getBookByTitle(title);
                if (b == null) {
                    out.println("<script> alert(\"Book not found for title: " + title + "\");</script>");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                    return;
                }
//                //lấy NXB sách
                Publisher p = b.getPublisherByBookID(b.getBookID());
                System.out.println("Publisher: "+p);
                Category c = b.getCategoryByBookID(b.getBookID());
                 System.out.println("Category: "+c);
//                //lấy ngôn ngữ sách
                ArrayList<Language> langList = b.getListLanguagesBook(b.getBookID());
                for (Language a : langList) {
                    System.out.println(a);
                }
//                //lấy ảnh sách
                ArrayList<String> imgList = b.getListImagesBook(b.getBookID());
                 for (String a : imgList) {
                    System.out.println(a);
                }
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
                BigDecimal avgRating = new BigDecimal("01");
                if (cReviewed != null) {
                    avgRating = cReviewed.getAverageRating(b.getBookID());
                }
//                //lấy các sách cùng thể loại
                ArrayList<Book> booksSameCate = new ArrayList<>();
                if (c != null) {
                     booksSameCate= b.getListBookByCategoryName(c.getCategoryName());
                     request.setAttribute("category", c);
                } else {
                    booksSameCate= b.getListBookByCategoryName("Manga");
                }
                HttpSession session = request.getSession();
                session.setAttribute("lastTitle", b.getTitle());
                request.setAttribute("lastTitle", title);
                request.setAttribute("auList", auList);
                request.setAttribute("booksSameCate", booksSameCate);
                request.setAttribute("book", b);
                request.setAttribute("publisher", p);
                
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
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "time" -> {
                        String minDay = (String) request.getParameter("minDay");
                        String maxDay = (String) request.getParameter("maxDay");
                        Book b = new Book();
                        ArrayList<Book> bookList = b.getListBookByTime(minDay, maxDay);
                        System.out.println("List book from " + minDay + " to " + maxDay);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "author" -> {
                        ArrayList<Book> bookList = new ArrayList<>();
                        String name = (String) request.getParameter("name");
                        Book b = new Book();
                        if (name.equals("all")) {
                            bookList = b.getListBook();
                        } else {
                            bookList = b.getListBookByAuthorName(name);
                        }
                        System.out.println("List book of " + name);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
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
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "price" -> {
                        BigDecimal min = new BigDecimal(request.getParameter("min"));
                        BigDecimal max = new BigDecimal(request.getParameter("max"));
                        Book b = new Book();
                        ArrayList<Book> bookList = b.getListBookByPrice(min, max);
                        System.out.println("List book from " + min + " to " + max);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                    case "series" -> {
                        ArrayList<Book> bookList = new ArrayList<>();
                        String seriesName = (String) request.getParameter("seriesName");
                        Book b = new Book();
                        bookList = b.getListBookByTitle(seriesName);
                        System.out.println("List book of " + seriesName);
                        for (Book s : bookList) {
                            System.out.println(s);
                        }
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
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
                        HttpSession session = request.getSession();
                        session.setAttribute("bookList", bookList);
                        request.setAttribute("bookList", bookList);
                        request.getRequestDispatcher("shop.jsp").forward(request, response);
                    }
                }
            }
            case "search" -> {
                String by = (String) request.getParameter("by");
                switch (by) {
                    case "key" -> {
                        Book b = new Book();
                        String keyword = (String) request.getParameter("keyword");
                        ArrayList<Book> resSearch = b.searchByKeyWord(keyword);
                        System.out.println("List books of " + keyword);
                        for (Book s : resSearch) {
                            System.out.println(s);
                        }
                        request.setAttribute("bookList", resSearch);
                        out.println("<script>$('input[placeholder=\"Search books by title,year publish,description\"]').val(" + keyword + ")</script>");
                        request.getRequestDispatcher("shop.jsp").include(request, response);
                    }
                }
            }
            case "sort" -> {
                Book b = new Book();
                String type = (String) request.getParameter("type");
                HttpSession session = request.getSession();
                ArrayList<Book> sortedBookList = (ArrayList<Book>) session.getAttribute("bookList");
                switch (type) {
                    case "latest" -> {
                        sortedBookList = b.sortLatest(sortedBookList);
                        request.setAttribute("bookList", sortedBookList);
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
                    BigDecimal price = new BigDecimal(request.getParameter("price"));
                    BigDecimal priceDiscount = new BigDecimal(request.getParameter("priceDiscount"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    CartItem cartI = new CartItem(userID, bookID, langID, quantity, price, priceDiscount);
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
                BigDecimal totalPrice = updatedCartItem.getTotalPrice();
                if (totalPrice != null) {
                    response.getWriter().write(totalPrice.toString());
                } else {
                    response.getWriter().write("error");
                }
            }
            case "updateOrderQuantity" -> {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
                OrderItem o = new OrderItem();
                o = o.updateOrderItemQuantity(cartItemID, newQuantity);
                if (o != null) {
                    response.getWriter().write("success"); // Gửi lại response cho AJAX
                } else {
                    response.getWriter().write("error");
                }
            }
            case "addOrderItem" -> {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                OrderItem o = new OrderItem();
                int res = o.transformToOrderItem(cartItemID);
                System.out.println(res);
                if (res >= 0) {
                    response.getWriter().write("success"); // Gửi lại response cho AJAX
                } else {
                    response.getWriter().write("error");
                }
            }
            case "deleteOrderItem" -> {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                OrderItem o = new OrderItem();
                int res = o.deleteOderItem(cartItemID);
//                System.out.println(res);
                if (res >= 0) {
                    response.getWriter().write("success"); // Gửi lại response cho AJAX
                } else {
                    response.getWriter().write("error");
                }
            }
            case "applyVoucher" -> {
                String voucherCode = request.getParameter("voucherCode");
                Voucher v = new Voucher();
                v = v.getVoucherByCode(voucherCode);
                if (!voucherCode.equals("none") && v != null) {
                    // Convert the Voucher object to JSON
                    String json = new Gson().toJson(v);
                    response.getWriter().write(json); // Send the JSON back to AJAX
                } else {
                    response.getWriter().write("error");
                }
            }
            case "viewVoucher" -> {
                Voucher v = new Voucher();
                ArrayList<Voucher> vous = v.getListVoucher();
                for (Voucher vou : vous) {

                    System.out.println(vou);
                    out.println(" <script>console.log(\"voucher: " + vou + "\");</script>");
                }
                request.setAttribute("vous", vous);
                request.getRequestDispatcher("viewVoucher.jsp").include(request, response);
            }
            case "proceedToCheckout" -> {
                String voucherCode = request.getParameter("voucherCode");
                HttpSession session = request.getSession(false);
                User user = (User) session.getAttribute("user");
                int userID = user.getUserID();
                BigDecimal subTotal = new BigDecimal(request.getParameter("subTotal"));
                String cartItemIDsJson = request.getParameter("cartItemIDs");
                ArrayList<Integer> cartItemIDs = new Gson().fromJson(cartItemIDsJson, new TypeToken<ArrayList<Integer>>() {
                }.getType());
                Order o = new Order();
                int orderID = o.proceedCheckout(userID, voucherCode, subTotal, cartItemIDs);
                if (orderID > 0) {
                    //lấy book được order
                    session.setAttribute("order", o.getOrder(orderID));
                    //lấy các phương thức thanh toán
                    PaymentMethod p = new PaymentMethod();
                    ArrayList<PaymentMethod> payList = p.getListPaymentMethod();
                    session.setAttribute("payList", payList);
                    //lấy các pt vận chuyển
                    ShippingMethod sm = new ShippingMethod();
                    ArrayList<ShippingMethod> shipList = sm.getListShippingMethod();
                    session.setAttribute("shipList", shipList);

                    Address a = new Address();
                    ArrayList<Address> addressList = a.getListAddressByUserID(userID);
                    session.setAttribute("addressList", addressList);
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("BookAction?action=viewCart").forward(request, response);
                }
            }
            case "deleteOrder" -> {
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                Order o = new Order();
                int res = o.deleteOrder(orderID);
                System.out.println("orderID: " + orderID);
                System.out.println("delete id " + res);
                if (res > 0) {
                    response.getWriter().write("success"); // Send the JSON back to AJAX
                } else {
                    response.getWriter().write("error");
                }
            }
            case "getSavedCards" -> {
                String paymentMethodName = (String) request.getParameter("paymentMethodName");
                int userID = Integer.parseInt(request.getParameter("userID"));
                System.out.println(paymentMethodName);
                Card cardModel = new Card();
                ArrayList<Card> cardList = cardModel.getListCards(userID, paymentMethodName);
                response.setContentType("text/html");

                for (Card card : cardList) {
                    out.println("<div class='form-group'>");
                    out.println("<div class='custom-control custom-radio'>");
                    out.println("<input type='radio'name='paymentCard' id='" + card.getCardID() + "'>");
                    out.println("<label  for='" + card.getCardID() + "'>" + card.getCardCode() + "</label>");
                    out.println("</div>");
                    out.println("</div>");
                }
            }
            case "viewOrder" -> {
                HttpSession session = request.getSession(false);
                Order o = new Order();
                User user = (User) session.getAttribute("user");
                int userID = user.getUserID();
                ArrayList<Order> orders = o.getListOrderByUserID(userID);
                session.setAttribute("orders", orders);
                request.getRequestDispatcher("ordered.jsp").include(request, response);
            }
            case "placeOrder" -> {
                int shippingID = Integer.parseInt(request.getParameter("shippingID"));
                int addressID = Integer.parseInt(request.getParameter("addressID"));
                int cardID = 0;
                if (!request.getParameter("cardID").equals("")) {
                    cardID = Integer.parseInt(request.getParameter("cardID"));
                }
                HttpSession session = request.getSession(false);
                Order order = (Order) session.getAttribute("order");
                User user = (User) session.getAttribute("user");
                int userID = user.getUserID();
                int orderID = order.getOrderID();
                int res = order.placeOrder(orderID, shippingID, addressID, cardID);
                if (res > 0) {
                    out.println(" <script>console.log(\"shippingID: " + shippingID + "\");");
                    out.println("console.log(\"addressID: " + addressID + "\");");
                    out.println("console.log(\"cardID: " + cardID + "\");");

                    out.println("console.log(\"Place order successful!\");</script>");
                    ArrayList<Order> orders = order.getListOrderByUserID(userID);
                    session.setAttribute("orders", orders);
                    request.getRequestDispatcher("BookAction?action=viewOrder").forward(request, response);
                } else {
                    out.println("<script>console.log(\"Failed place order!\");</script>");
                    request.getRequestDispatcher("BookAction?action=proceedToCheckout").include(request, response);
                }
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
