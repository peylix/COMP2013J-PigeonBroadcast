<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.UserDAO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="pb.pojo.Notification" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pigeon Broadcast Search Page</title>
    <link rel="stylesheet" href="css/homestyle.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<%
    //    获取当前登录用户信息
    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
    String profilePhoto = user.getProfilePhoto();

    session.setAttribute("user", user);
%>
<%
    // 获取搜索信息
    List<Notification> notifications = new ArrayList<>();
    String searchInput = request.getParameter("searchInput");
    if (searchInput == null || searchInput.trim().isEmpty()) {
        response.sendRedirect("home.jsp");
    } else {
        searchInput = request.getParameter("searchInput");
        String info;
        if (searchInput.charAt(0) == '#') {
            info = searchInput.substring(4, searchInput.length());
            String limit = searchInput.substring(1, 3);
            switch (limit) {
                case "ID":
                    try {
                        int noteID = Integer.parseInt(info);
                        notifications.addAll(NotificationDAO.getNotificationByID(noteID));
                    } catch (NumberFormatException e) {
                        // 警告
                    }
                    break;
                case "TI":
                    notifications.addAll(NotificationDAO.getNotificationByTitle(info));
                    break;
                case "CO":
                    notifications.addAll(NotificationDAO.getNotificationByContent(info));
                    break;
                case "TY":
                    notifications.addAll(NotificationDAO.getNotificationByType(info));
                    break;
                case "RD":
                    try {
                        Timestamp timestamp = Timestamp.valueOf(info);
                        notifications.addAll(NotificationDAO.getNotificationByReleaseTime(timestamp));
                    } catch (IllegalArgumentException e) {
                        // 警告
                    }
                    break;
                case "PI":
                    try {
                        int publisherID = Integer.parseInt(info);
                        notifications.addAll(NotificationDAO.getNotificationByPublisherID(publisherID));
                    } catch (NumberFormatException e) {
                        // 警告
                    }
                    break;
                default:
                    // 警告
                    break;
            }
        } else {
            // If the searchInput does not start with "#", search in all types
            notifications.addAll(NotificationDAO.getNotificationByTitle(searchInput));
            notifications.addAll(NotificationDAO.getNotificationByContent(searchInput));
            try {
                int id = Integer.parseInt(searchInput);
                notifications.addAll(NotificationDAO.getNotificationByID(id));
                notifications.addAll(NotificationDAO.getNotificationByPublisherID(id));
            } catch (NumberFormatException e) {
                // Ignored, as the searchInput might not be a number
            }
            notifications.addAll(NotificationDAO.getNotificationByType(searchInput));
            try {
                Timestamp timestamp = Timestamp.valueOf(searchInput);
                notifications.addAll(NotificationDAO.getNotificationByReleaseTime(timestamp));
            } catch (IllegalArgumentException e) {
                // Ignored, as the searchInput might not be a timestamp
            }
        }

//        if (u == null) {
//            response.sendRedirect("index.jsp");
//        } else {
//            session.setAttribute("user", u);
//            response.sendRedirect("home.jsp");
//        }

        //ID 模糊搜索notification的ID
        //TI 模糊搜索notification的title
        //CO 模糊搜索notification的content
        //TY 直接搜索notification的type
        //RD 直接搜索notification的发表时间
        //PI 模糊搜索notification的作者
    }
%>

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <a href="userInfo.jsp">
                <img id="Pigeon" src="<%=profilePhoto%>" alt="Pigeon">
            </a>
            <h3 id="userName"><%=userName%>
            </h3>
            <h3 id="userID"><%=userID%>
            </h3>
        </div>
        <ul class="menu">
            <li id="school-notice"><a href="epistlesPage.jsp">Epistles</a></li>
            <li id="student-notice"><a href="feathersPage.jsp">Feathers</a></li>
        </ul>
    </div>

    <div class="search-box">
        <form id="search-input" method="get" action="search.jsp">
            <label><input type="text" name="searchInput" placeholder="Search..."/></label>
            <button type="submit"></button>
        </form>
    </div>

    <div class="main-content">
        <div class="info-bar">
            <h2 id="homepage">Search Result</h2>
        </div>
        <div class="notice-content">
            <%
                int itemsPerPage = 3;
                int numPages = (int) Math.ceil((double) notifications.size() / itemsPerPage);
                String currentPageStr = request.getParameter("currentPage");
                int currentPage = currentPageStr != null ? Integer.parseInt(currentPageStr) : 1;
                int startIndex = (currentPage - 1) * itemsPerPage;
                int endIndex = Math.min(startIndex + itemsPerPage, notifications.size());
                for (int i = startIndex; i < endIndex; i++) {
                    Notification notification = notifications.get(i);
            %>
            <div class="notification">
                <h2>ID: <%= notification.getNoteID()%></h2>
                <h3>Title: <%= notification.getTitle() %></h3>
                <h3>Type: <%= notification.getType() %></h3>
                <h3>Publisher ID: <%= notification.getPublisherID() %></h3>
                <h3>Release Time: <%= notification.getReleaseDate() %></h3>
            </div>
            <%
                }
            %>
            <div class="pagination">
                <%
                    // Display links to other pages
                    for (int i = 1; i <= numPages; i++) {
                        if (i == currentPage) {
                %>
                <span><%= i %></span>
                <%
                } else {
                %>
                <a href="search.jsp?currentPage=<%= i %>&searchInput=<%= searchInput %>"><%= i %></a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>
