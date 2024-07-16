/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THANH HUYEN
 */
public class Authenticate extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        String action = "";
        String actionParam = request.getParameter("action");
        if (actionParam != null) {
            action = actionParam;
        }
        switch (action) {
            case "loginForm" -> {
                if (session != null && session.getAttribute("userName") != null) {
                    out.print("<script> alert(\"Have already logged in.\");</script>");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                }
                request.setAttribute("nameJSP", action);
                request.getRequestDispatcher("authenticate.jsp").include(request, response);
            }
            case "login" -> {
                String userName = request.getParameter("user");
                String pwd = request.getParameter("pwd");
                User s = new User();
                try {
                    s = s.login(userName);
                } catch (Exception ex) {
                    Logger.getLogger(Authenticate.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (s != null && s.getPassword().equals(pwd)) {
                    HttpSession newSession = request.getSession(true);
                    newSession.setMaxInactiveInterval(600 * 60);
                    newSession.setAttribute("user", s);
                    newSession.setAttribute("userRole", s.getRoles());
                    newSession.setAttribute("userName", s.getUserName());
                    newSession.setAttribute("userID", s.getUserID());
                    Cookie acookie = new Cookie("userName", s.getUserName());
                    acookie.setMaxAge(30 * 60);
                    response.addCookie(acookie);

                    if ("admin".equals(s.getRoles())) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    out.println("<script> alert(\"User name or password is invalid!\");</script>");
                    request.setAttribute("nameJSP", "loginForm");
                    request.getRequestDispatcher("authenticate.jsp").include(request, response);
                }
            }
            case "logout" -> {
                if (session != null && session.getAttribute("userName") != null) {//nếu đã đăng nhập được
                    session.invalidate();
                    out.println("<script> alert(\"Logout successful!\");</script>");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                } else {
                    request.getRequestDispatcher("Authenticate?action=none").forward(request, response);
                }
            }
            case "registerForm" -> {
                request.setAttribute("nameJSP", "registerForm");
                request.getRequestDispatcher("authenticate.jsp").forward(request, response);
            }
            case "register" -> {
                User d = new User();
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String phoneNum = request.getParameter("phoneNum");
                String name = request.getParameter("name");
                String dob = request.getParameter("dob");
                String gender = request.getParameter("gender");
                String avatar = request.getParameter("avatar");
                System.out.println("res d: " + d);
                if (!username.isBlank() && !password.isBlank() && !email.isBlank() && !phoneNum.isBlank() && !name.isBlank() && !dob.isBlank() && !gender.isBlank()) {
                    d.setUserName(username);
                    d.setPassword(password);
                    d.setEmail(email);
                    d.setPhoneNum(phoneNum);
                    d.setName(name);
                    d.setDob(dob);
                    d.setGender(gender);
                    d.setAvatar(avatar);
                    int res = d.newUser(d);
                    System.out.println("res register: " + res);
                    if (res > 0) {
//                    System.out.println("res register: "+res);
                        request.getRequestDispatcher("Authenticate?action=loginForm").forward(request, response);
                    } else {
                        out.println("<script> alert(\"Error when register!\");</script>");
                        request.getRequestDispatcher("Authenticate?action=registerForm").include(request, response);
                    }
                } else {
                    request.getRequestDispatcher("Authenticate?action=registerForm").forward(request, response);
                }
            }
            default -> {
//            request.getRequestDispatcher("index.html").forward(request, response);
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
