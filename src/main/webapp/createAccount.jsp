<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.dao.SchoolMembersDAO" %>
<%@ page import="java.util.Objects" %>

<%
    if (Objects.equals(request.getParameter("memberID"), "")) response.sendRedirect("index.jsp");
    else {
        int memberID = Integer.parseInt(request.getParameter("memberID"));
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        if (SchoolMembersDAO.createAccount(memberID, lastName, firstName, password, email)) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp");
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