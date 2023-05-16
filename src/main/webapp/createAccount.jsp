<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.pojo.SchoolMembers" %>
<%@ page import="pb.dao.SchoolMembersDAO" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.UserDAO" %>

<%
    String memberID = request.getParameter("memberID");
    String lastName = request.getParameter("lastName");
    String firstName = request.getParameter("firstName");
    String email = request.getParameter("email");

//    out.print(username);
//    out.print(password);
//
//    User u = UserDAO.login(username, password);

    if (u == null) {
        response.sendRedirect("index.jsp");
    } else {
        session.setAttribute("user", u);
        response.sendRedirect("employeeList.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title</title>
</head>
<body>
Wrong password!!!!!!
</body>
</html>