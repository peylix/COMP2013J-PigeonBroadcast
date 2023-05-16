<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.dao.EmployeeDAO" %>
<%@ page import="pb.pojo.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="pb.pojo.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pigeon Broadcast Home Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>

<%
    User u = (User) session.getAttribute("user");

    if (u == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%
    int recordsPerPage = 5;
    int currentPage = 1;

    if (request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }

    int offset = (currentPage - 1) * recordsPerPage;

    List<Employee> employees = EmployeeDAO.getEmployeesByPage(offset, recordsPerPage);
    int numOfRecords = EmployeeDAO.getNumOfRecords();
    int numOfPages = (int) Math.ceil(numOfRecords * 1.0 / recordsPerPage);
%>

<div class="container">
    <div class="info">
        <h2>COMP2004J Demo System</h2>
    </div>
</div>

<div class="container">

    <% for (Employee e : employees) { %>
    <%=e.toString()%> <a href="updateEmployee.jsp?empno=<%=e.getEmpno() %>">update</a>
    <br/>
    <% } %>

    <nav aria-label="Page navigation">
        <ul class="pagination">
            <% if (currentPage > 1) { %>
            <li>
                <a href="home.jsp?currentPage=<%=currentPage-1%>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <% } %>

            <% for (int i = 1; i <= numOfPages; i++) { %>
            <% if (i == currentPage) { %>
            <li class="active"><a href="#"><%=i%> <span class="sr-only">(current)</span></a></li>
            <% } else { %>
            <li><a href="home.jsp?currentPage=<%=i%>"><%=i%>
            </a></li>
            <% } %>
            <% } %>

            <% if (currentPage < numOfPages) { %>
            <li>
                <a href="home.jsp?currentPage=<%=currentPage+1%>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <% } %>
        </ul>
    </nav>


</div>

<%@ include file="footer.html" %>
</body>
</html>