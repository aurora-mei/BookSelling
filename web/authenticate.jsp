<%-- 
    Document   : authenticate
    Created on : Jul 1, 2024, 11:35:19 PM
    Author     : THANH HUYEN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authenticate Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: url('images/loginImg.jpg') no-repeat center center fixed;
                background-size: cover;
                margin: 0;
                padding: 0;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background: rgba(255, 255, 255, 0.3); /* Semi-transparent background */
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
                margin: auto;
                margin-top: 180px;
            }
            .form-container h2 {
                margin-bottom: 20px;
                color: #333;
            }
            .form-container input {
                width: calc(100% - 22px);
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                background: #fff; /* Opaque input background */
            }
            .form-container input[type="submit"] {
                background: #d19c97;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            .form-container input[type="submit"]:hover {
                background: #d19c97;
            }
            .register-link {
                color: #5F5F5F;
                margin-top: 10px;
                display: block;
            }
            .register-link a {
                color: #C6938F;
                text-decoration: none;
            }
            .register-link a:hover {
                text-decoration: underline;
            }
            .home {
                background: #d19c97;
                color: #fff;
                border: none;
                font-size:12px;
                cursor: pointer;
                border-radius:3px;
                 padding:9px;
                 margin: 0 10px;
            }
            .home a{
                color: white;
               
            }
            .home:hover {
                background: #d19c97;
            }
        </style>
    </head>
    
    <body>
        <%
            // Retrieve the nameJSP parameter from the request
            String nameJSP = (String) request.getParameter("nameJSP");
            if (nameJSP == null || nameJSP.isEmpty()) {
                nameJSP = (String) request.getAttribute("nameJSP");
                if (nameJSP == null || nameJSP.isEmpty()) {
                    nameJSP = (String) session.getAttribute("nameJSP");
                }
            }
        %>
        <c:set var="nameJSP" value="${nameJSP}" />
        <div class="form-container">
            <c:choose>
                <c:when test="${fn:contains(nameJSP,'loginForm')}">
                    <form action="Authenticate" method="get">
                        <input type="hidden" id="action" name="action" value='login'>
                        <h2>Login</h2>
                        <input type="text" name="user" placeholder="Username" required>
                        <input type="password" name="pwd" placeholder="Password" required>
                        <input type="submit" value="Login">
                        <div class="register-link"> 
                            <span style="font-style: italic;font-size: 85%;">First time to Kittens Shop?</span> 
                            <a href="Authenticate?action=registerForm">Register</a>
                        </div>
                    </form>
                </c:when>  
                <c:when test="${fn:contains(nameJSP,'welcome')}">
                    <h1>Welcome, ${sessionScope.userName}!</h1>
                </c:when>  
                <c:when test="${fn:contains(nameJSP,'registerForm')}">  
                    <form action="Authenticate" method="get">
                        <input type="hidden" id="action" name="action" value='register'>
                        <h2>Register</h2>
                        <input type="text" name="username" placeholder="User name" required>
                        <input type="password" name="password" placeholder="Password" required>
                        <input type="email" name="email" placeholder="Email" required>
                        <input type="text" name="phoneNum" placeholder="Phone number" required>
                        <input type="text" name="name" placeholder="Name" required>
                        <input type="date" name="dob" required>
                        <input type="text" name="gender" placeholder="Gender" required>
                        <input type="text" name="avatar" placeholder="Avatar URL">
                        <input type="submit" value="Register">
                        <div class="home"><a href="index.jsp">Back Home</a></div>
                    </form>
                </c:when>
                <c:otherwise>    
                    <h1>Nothing in here...</h1> 
                </c:otherwise>  
            </c:choose>
        </div>
    </body>
</html>
