<%@ page import="pb.pojo.User" %>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PigeonBroadcast Home Page</title>
    <link rel="stylesheet" href="../../../css/home-style.css">
    <link rel="icon" href="../../../images/Pigeon.png" type="image">
</head>

<%--User home page--%>
<%
    // Obtain the information about the current login user
    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
    String userIdentity;
    if (Objects.equals(user.getIdentity(), "admin")) {
        userIdentity = "Administrative Staff";
    } else if (Objects.equals(user.getIdentity(), "teacher")) {
        userIdentity = "Teaching Staff";
    } else {
        userIdentity = "Student";
    }
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
            <h3 id="userName"><%=userName%>
            </h3>
            <h3 id="userID"><%=userID%>
            </h3>
            <h4 id="userIdentity"><%=userIdentity%>
            </h4>
        </div>
        <div>
            <form id="sidebar-1" method='post' action="epistlesPage.jsp">
                <label>
                    <button type="submit" class="sidebar-button">Epistles</button>
                </label>
            </form>
            <br>
            <form id="sidebar-2" method="post" action="feathersPage.jsp">
                <label>
                    <button type="submit" class="sidebar-button">Feathers</button>
                </label>
            </form>
            <br>
            <br>
            <br>
            <form id="sidebar-3" method="post" action="../../../index.jsp">
                <label>
                    <button type="submit" class="sidebar-button">Log out</button>
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
            <h2 id="homepage">PigeonBroadcast</h2>
        </div>
        <div class="notice-content">
            <h2>PigeonBroadcast is an information system for posting messages inside a college.</h2>
            <h2>It allows the faculty, administrative staff and students to send and check messages.</h2>
            <h2>You can also search for messages posted by users using the search box.</h2>
            <br>
            <br>
            <h2>Please note:</h2>
            <h2>- If you are an administrative staff or teaching staff,
                <br>
                please send your messages in Epistles;</h2>
            <h2>- If you are a student (or you may also be managing a club), <br>
                please send your messages in Feathers.</h2>
        </div>
    </div>
</div>

<%@ include file="../../footer.html" %>

</body>
</html>
