<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.UserDAO" %>
<%@ page import="java.util.Objects" %>

<%--login account--%>
<%
    if (Objects.equals(request.getParameter("userID"), "")) response.sendRedirect("index.jsp");
    else {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String password = request.getParameter("password");

        User u = UserDAO.login(userID, password);

        if (u == null) {
            response.sendRedirect("index.jsp");
        } else {
            session.setAttribute("user", u);
            response.sendRedirect("home.jsp");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nothing here</title>
</head>
<body>
Nothing here
</body>
</html>