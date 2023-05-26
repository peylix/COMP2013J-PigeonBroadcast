<%@ page import="pb.pojo.User" %>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
    <link rel="stylesheet" href="css/home-style.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<%
    //    获取当前登录用户信息
    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
    String profilePhoto = user.getProfilePhoto();
    String userIdentity;
    if (Objects.equals(user.getIdentity(), "admin")) {
        userIdentity = "Administrative Staff";
    } else if (Objects.equals(user.getIdentity(), "teacher")) {
        userIdentity = "Teaching Staff";
    } else {
        userIdentity = "Student";
    }

    session.setAttribute("user", user);

%>

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <a href="home.jsp">
                <img id="Pigeon" src="<%=profilePhoto%>" alt="Pigeon">
            </a>
            <h3 id="userName"><%=userName%></h3>
            <h3 id="userID"><%=userID%></h3>
            <h4 id="userIdentity"><%=userIdentity%></h4>
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
            <h2 id="homepage">Error Page</h2>
        </div>
        <div class="notice-content">
            <h1>Ah... Something goes wrong... Let's press </h1>
            <form id="back-home" method='post' action="home.jsp">
                <label>
                    <button type="submit" class="sidebar-button">THIS BUTTON</button>
                </label>
            </form>
            <h1> to go home!</h1>
        </div>
    </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>

