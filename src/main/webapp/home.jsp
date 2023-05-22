<%@ page import="pb.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pigeon Broadcast Home Page</title>
    <link rel="stylesheet" href="css/homestyle.css">
</head>

<%
    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
%>

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <img id="Pigeon" src="images/Pigeon.png" alt="Pigeon">
            <h3 id="userName"><%=userName%></h3>
            <h3 id="userID"><%=userID%></h3>
        </div>
        <ul class="menu">
            <li id="school-notice">Epistles from College</li>
            <li id="course-notice">Epistles from Course</li>
            <li id="community-notice">Feathers from Organization</li>
            <li id="personal-notice">Feathers from Individual</li>
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
            <h2>Pigeon Broadcast is a service for everyone in the college.</h2>
            <h2>Pigeon allows you to send, modify and delete your own messages.</h2>
            <h2>You can search other's message using the search box.</h2>
            <br>
            <br>
            <h2>Note that </h2>
            <h2>If you are a stuff, send your message via Epistles.</h2>
            <h2>If you are a student, send via Feathers.</h2>
        </div>
    </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>
