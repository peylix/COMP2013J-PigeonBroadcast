<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="ie.ucd.comp2013J.User" %>
<%@ page import="ie.ucd.comp2013J.UserDAO" %>
<%@ page import="ie.ucd.comp2013J.EmployeeDAO" %>
<%@ page import="ie.ucd.comp2013J.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<%
    String empno = request.getParameter("empno");
    Employee employee = EmployeeDAO.getEmployeeByID(Integer.parseInt(empno));
    if (employee == null) {
        out.println("Employee not found.");
    }
%>

<body>
<form id="emp" method="post" action="updateEmployee.jsp">
    <input type="hidden" name="empno" value="<%=empno%>"/>
    empno:<input type="text" name="newEmpno" value="<%=employee.getEmpno()%>"/>
    <input type="submit" value="Update"/>
</form>
</body>
<%

    String newEmpno = request.getParameter("newEmpno");
    out.println(newEmpno);
    if (newEmpno == null || newEmpno.isEmpty()) {
        out.println("New empno value is required.");
    } else {
        try {
            employee.setEmpno(Integer.parseInt(newEmpno));
            if (EmployeeDAO.updateEmployee(employee)) {
                response.sendRedirect("employeeList.jsp");
            } else {
                out.println("What?");
            }
        } catch (NumberFormatException e) {
            out.println("Invalid empno value.");
        }
    }

%>


</html>