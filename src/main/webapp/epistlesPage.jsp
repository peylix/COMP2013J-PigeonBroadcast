<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="pb.pojo.Notification" %>
<html>
<head>
    <title>Epistles</title>
    <link rel="stylesheet" href="css/homestyle.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<%
    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
    String profilePhoto = user.getProfilePhoto();
    List<Notification> notifList = NotificationDAO.getAllNotifications();
    session.setAttribute("user", user);
%>

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <img id="Pigeon" src="<%=profilePhoto%>" alt="Pigeon">
            <h3 id="userName"><%=userName%></h3>
            <h3 id="userID"><%=userID%></h3>
        </div>
        <ul class="menu">
            <li id="school-notice"><a href="epistlesPage.jsp">Epistles</a></li>
            <li id="student-notice"><a href="feathersPage.jsp">Feathers</a></li>
        </ul>
    </div>
    <div class="search-box">
        <input type="text" placeholder="Search..."/>
        <button type="submit">
            <i class="fa fa-search"></i>  <!-- Replace with the icon class you are using -->
        </button>
    </div>

    <div class="main-content">
        <div class="info-bar">
            <h2 id="homepage">Pigeon Broadcast</h2>
        </div>
        <div class="notice-content">
            <!-- The notice content will be loaded dynamically here -->

            <%
                for(Notification notif : notifList) {
            %>
            <div class="message-block">
                <p><%= notif.getContent() %></p>
                <div class="buttons">
                    <button class="modify">Modify</button>
                    <button class="delete">Delete</button>
                </div>
            </div>
            <%
                }
            %>

        </div>
    </div>
</div>
</body>
</html>
