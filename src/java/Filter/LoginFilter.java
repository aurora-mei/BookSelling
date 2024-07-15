/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 *
 * @author THANH HUYEN
 */
public class LoginFilter implements Filter {

    private ServletContext context;
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public LoginFilter() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userName") == null || session.getAttribute("user") == null) {
            if (!"bookShoppingImg".equals(action) && !"bookShoppingTitle".equals(action)
                    && !"filter".equals(action) 
                    && !"search".equals(action)
                    &&!"viewVoucher".equals(action)
                    &&!"sort".equals(action)) {
                String requestedWith = req.getHeader("X-Requested-With");
                if ("XMLHttpRequest".equals(requestedWith)) {
                    res.setHeader("REDIRECT", "REDIRECT");
                    res.setHeader("CONTENTPATH", "Authenticate?action=loginForm");
                    res.setStatus(HttpServletResponse.SC_FORBIDDEN);
                } else {
                    request.getRequestDispatcher("Authenticate?action=loginForm").forward(request, response);
                }
                return;
            }
        }
        chain.doFilter(request, response);
    }

    /**
     * Return the filter configuration object for this filter.
     */
    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.context = filterConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("LoginFilter()");
        }
        StringBuffer sb = new StringBuffer("LoginFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

}
