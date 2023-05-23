<%@ page import="pb.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pigeon Broadcast Home Page</title>
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

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <a href="userInfo.jsp">
                <img id="Pigeon" src="<%=profilePhoto%>" alt="Pigeon">
            </a>
            <h3 id="userName"><%=userName%></h3>
            <h3 id="userID"><%=userID%></h3>
        </div>
<%--        <ul class="menu">--%>
<%--            <li id="school-notice"><a href="epistlesPage.jsp">Epistles</a></li>--%>
<%--            <li id="student-notice"><a href="feathersPage.jsp">Feathers</a></li>--%>
<%--        </ul>--%>
        <div>
            <form id="sidebar-1" method='post' action="epistlesPage.jsp">
                <label>
                    <button type="submit">Epistles</button>
                </label>
            </form>
            <form id="sidebar-2" method="post" action="feathersPage.jsp">
                <label>
                    <button type="submit">Feathers</button>
                </label>
            </form>

        </div>
    </div>

    <div class="search-box">
        <form id="search-input" method="get" action="search.jsp">
            <label><input type="text" placeholder="Search..." name="searchInput"></label>
            <button type="submit"></button>
        </form>
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
