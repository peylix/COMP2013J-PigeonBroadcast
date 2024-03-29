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
    <title>PigeonBroadcast Details Page</title>
    <link rel="stylesheet" href="css/details-style.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>
<%
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
<%
    int noteID = Integer.parseInt(request.getParameter("noteID"));
    Notification notification = NotificationDAO.getNotificationByID(noteID).get(0);
    User publisher = UserDAO.getUserByID(notification.getPublisherID());
%>

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <a href="home.jsp">
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
            <h2 id="homepage">Details</h2>
        </div>
        <div class="notice-content">
            <div class="notification">
                <div class="notification">
                    <div class="notification-header">
                        <div class="publisher-info">
                            <img src="<%=publisher.getProfilePhoto()%>" alt="Publisher Avatar" class="publisher-avatar">
                            <h3 class="publisher-name"><%=publisher.getUserName()%>
                            </h3>
                            <h3 class="publisher-id">ID: <%=publisher.getUserID()%>
                            </h3>
                        </div>
                        <div class="notification-info">
                            <h2 class="notification-title"><%= notification.getTitle() %>
                            </h2>
                            <h4 class="notification-release-time">Release Date: <%= notification.getReleaseDate() %>
                            </h4>
                            <h4 class="notification-type">Type: <%= notification.getType() %>
                            </h4>
                        </div>
                    </div>
                    <div class="notification-body">
                        <p class="notification-content"><%= notification.getContent() %>
                        </p>
                    </div>
                    <% if (notification.getPublisherID() == userID) { %>
                    <button class="button-back" onclick="modifyNotification()">Modify</button>
                    <% session.setAttribute("notif-type", notification.getType()); %>
                    <button class="button-back" onclick="deleteNotification()">Delete</button>
                    <% } %>
                    <button class="button-back" onclick="goBack()">Go Back</button>

                    <%
                        session.setAttribute("user", user);
                        session.setAttribute("notification", notification);
                    %>
                </div>

            </div>

        </div>
    </div>
</div>

<%@ include file="WEB-INF/footer.html" %>

<script>
    function goBack() {
        history.back();
    }

    function deleteNotification() {
        window.location.href = 'deleteNotification.jsp?noteID=' + <%= noteID %>;
    }

    function modifyNotification() {
        window.location.href = 'modifyNotification.jsp?noteID=' + <%= noteID %>;
    }
</script>

</body>
</html>