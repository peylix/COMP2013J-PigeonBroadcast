<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="java.util.Objects" %>
<%
    try {
        int noteID = Integer.parseInt(request.getParameter("noteID"));
        User user = (User) session.getAttribute("user");


        boolean deleteStatus = NotificationDAO.deleteNotificationByID(noteID);

        if (deleteStatus) {
            if (Objects.equals(user.getIdentity(), "admin") || Objects.equals(user.getIdentity(), "teacher")) {
                response.sendRedirect("epistlesPage.jsp");
            } else {
                response.sendRedirect("feathersPage.jsp");
            }
        } else {
            response.sendRedirect("errorPage.jsp");

        }
    } catch (Exception e) {
        response.sendRedirect("errorPage.jsp");
    }

%>
