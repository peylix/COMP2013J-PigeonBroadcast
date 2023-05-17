<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pigeon Broadcast Home Page</title>
    <link rel="stylesheet" href="css/homestyle.css">
</head>
<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <img id="avatar" src="images/avatar.png" alt="Avatar">
            <h3 id="userID">User ID</h3>
        </div>
        <ul class="menu">
            <li id="school-notice">School Notice</li>
            <li id="course-notice">Course Notice</li>
            <li id="community-notice">Community Notice</li>
            <li id="personal-notice">Personal Notice</li>
        </ul>
    </div>
    <div class="main-content">
        <div class="info-bar">
            <h2 id="notice-name">Notice Name</h2>
        </div>
        <div class="notice-content">
            <!-- The notice content will be loaded dynamically here -->
        </div>
    </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>
