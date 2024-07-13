<%-- 
    Document   : authenticate
    Created on : Jul 1, 2024, 11:35:19 PM
    Author     : THANH HUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@include file="/detail_includes/headerDetail.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <c:choose>
            <c:when test="${fn:contains(nameJSP,'loginForm')}">
                <form action="Authenticate" method="get" >
                    <input type="hidden" id="action" name="action" value='login'>
                    Username: <input type="text" name="user"> <br>
                    Password: <input type="password" name="pwd"> <br>
                    <input type="submit" value="Login">
                    <div>First time to Kittens Shop? 
                        <a style="color:red;"href="Authenticate?action=registerForm">Register</a>
                    </div>
                </form> 
            </c:when>  
            <c:when test="${fn:contains(nameJSP,'welcome')}">
                <h1 style='color:white;'>Welcome,${sessionScope.userName} !</h1>
            </c:when>  
            <c:when test="${fn:contains(nameJSP,'registerForm')}">  
                <form action="Authenticate" method="get" class="new">
                    <input type="hidden" id="action" name="action" value='register'>
                    <%--<c:set var="action" value="register" scope="session"/>--%>                  
                    User name: <input type="text" name="username" required> <br>
                    Password: <input type="password" name="password" required> <br>
                    <!--Roles: <input type="text" name="roles" required> <br>-->
                    Email: <input type="email" name="email" required> <br>
                    Phone number: <input type="text" name="phoneNum" required> <br>
                    Name: <input type="text" name="name" required> <br>
                    Date of Birth: <input type="date" name="dob" required> <br>
                    Gender: <input type="text" name="gender" required> <br>
                    Avatar URL: <input type="text" name="avatar"> <br>
                    <input type="submit" value="Register">
                </form>
            </c:when>
            <c:otherwise>    
                <h1>Nothing in here...</h1> 
            </c:otherwise>  
        </c:choose>
            <%@include file="/detail_includes/footerDetail.jsp" %>
    </body>
</html>
