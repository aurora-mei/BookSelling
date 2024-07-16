/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginGoogle;

import Controller.Authenticate;
import Model.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 * @author heaty566
 */
public class LoginGoogleHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        System.out.println(user);
        User u = new User();
        System.out.println(u.checkExistedEmail(user.getEmail()));
        if (u.checkExistedEmail(user.getEmail()) == null) {
            int newU = u.newUserGoogle(user);
            System.out.println(u.newUserGoogle(user));
            if (newU > 0) {
                try {
                    u = u.loginByEmail(user.getEmail());
                } catch (Exception ex) {
                    Logger.getLogger(Authenticate.class.getName()).log(Level.SEVERE, null, ex);
                }
                 if (u != null) {
                    HttpSession newSession = request.getSession(true);
                    newSession.setMaxInactiveInterval(600 * 60);
                    newSession.setAttribute("user", u);
                    newSession.setAttribute("userRole", u.getRoles());
                    newSession.setAttribute("userID", u.getUserID());

                    if ("admin".equals(u.getRoles())) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                     PrintWriter out = response.getWriter();
                    out.println("<script> alert(\"User name or password is invalid!\");</script>");
                    request.setAttribute("nameJSP", "loginForm");
                    request.getRequestDispatcher("authenticate.jsp").include(request, response);
                }
            }
        }else{
            System.out.println("user existed");
            User nU = u.getUserByEmail(user.getEmail());
             nU = u.login(nU.getUserName());
             if (nU != null ) {
                    HttpSession newSession = request.getSession(true);
                    newSession.setMaxInactiveInterval(600 * 60);
                    newSession.setAttribute("user", nU);
                    newSession.setAttribute("userRole", nU.getRoles());
                    newSession.setAttribute("userName", nU.getUserName());
                    newSession.setAttribute("userID", nU.getUserID());
                    Cookie acookie = new Cookie("userName", nU.getUserName());
                    acookie.setMaxAge(30 * 60);
                    response.addCookie(acookie);

                    if ("admin".equals(nU.getRoles())) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                 PrintWriter out = response.getWriter();
                    out.println("<script> alert(\"User name or password is invalid!\");</script>");
                    request.setAttribute("nameJSP", "loginForm");
                    request.getRequestDispatcher("authenticate.jsp").include(request, response);
                }
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the +
    // sign on the left to edit the code.">
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginGoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoginGoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginGoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoginGoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
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
