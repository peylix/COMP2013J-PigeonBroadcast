<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.UserDAO" %>
<%@ page import="pb.dao.EmployeeDAO" %>
<%@ page import="pb.pojo.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
</head>
<body>

<%
    String empno = request.getParameter("empno");
    Employee employee = EmployeeDAO.getEmployeeByID(Integer.parseInt(empno));
    if (employee == null) {
        out.println("Employee not found.");
    }
%>

<form id="emp" method="post" action="updateEmployee.jsp">
    <input type="hidden" name="empno" value="<%=empno%>"/>
    empno:<input type="text" name="newEmpno" value="<%=employee.getEmpno()%>"/>
    <input type="submit" value="Update"/>
</form>

<%
    String newEmpno = request.getParameter("newEmpno");
    if (newEmpno == null || newEmpno.isEmpty()) {
        out.println("New empno value is required.");
    } else {
        try {
            int empnoValue = Integer.parseInt(newEmpno);
            if (EmployeeDAO.updateEmployee(employee, empnoValue)) {
                response.sendRedirect("home.jsp");
            } else {
                out.println("Update failed.");
            }
        } catch (NumberFormatException e) {
            out.println("Invalid empno value.");
        }
    }
%>


</body>
</html>