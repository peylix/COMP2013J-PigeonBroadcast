<%@ page import="pb.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Error Page</title>
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
      <h2 id="homepage">Error Page</h2>
    </div>
    <div class="notice-content">
      <h1>Ah... Something goes wrong... Let's press </h1><button id="home"><a href="home.jsp">THIS BUTTON</a></button><h1> to go home!</h1>
    </div>
  </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>

