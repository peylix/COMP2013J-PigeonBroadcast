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
    <link rel="stylesheet" href="css/details.css">
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
    int noteID = Integer.parseInt(request.getParameter("noteID"));
    Notification notification = NotificationDAO.getNotificationByID(noteID).get(0);
    User publisher = UserDAO.getUserByID(notification.getPublisherID());
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
            <div class="notification">
                <div class="notification">
                    <div class="notification-header">
                        <div class="publisher-info">
                            <img src="<%=publisher.getProfilePhoto()%>" alt="Publisher Avatar" class="publisher-avatar">
                            <h3 class="publisher-name"><%=publisher.getUserName()%></h3>
                            <h3 class="publisher-id">ID: <%=publisher.getUserID()%></h3>
                        </div>
                        <div class="notification-info">
                            <h2 class="notification-title"><%= notification.getTitle() %></h2>
                            <h4 class="notification-release-time">发布时间: <%= notification.getReleaseDate() %></h4>
                            <h4 class="notification-type">类型: <%= notification.getType() %></h4>
                        </div>
                    </div>
                    <div class="notification-body">
                        <p class="notification-content"><%= notification.getContent() %></p>
                    </div>
                    <button onclick="goBack()">返回</button>
                </div>

            </div>

        </div>
    </div>
</div>

<%@ include file="footer.html" %>

<script>
    function goBack() {
        // Reload the page to go back to the list view
        history.back();
    }
</script>

</body>
</html>