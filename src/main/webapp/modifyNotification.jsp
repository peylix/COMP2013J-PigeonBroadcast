<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="java.util.Objects" %>
<%@ page import="pb.pojo.Notification" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.Timestamp" %>
<html>

<head>
    <title>Modifying</title>
    <link rel="stylesheet" href="css/messagestyle.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>
<%

    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
    String profilePhoto = user.getProfilePhoto();

    Notification notification = (Notification) session.getAttribute("notification");

    String userIdentityName;
    if (Objects.equals(user.getIdentity(), "admin")) {
        userIdentityName = "Administrative Staff";
    } else if (Objects.equals(user.getIdentity(), "teacher")) {
        userIdentityName = "Teaching Staff";
    } else {
        userIdentityName = "Student";
    }

    String title;
    String message;
    int noteID;

    if ("GET".equalsIgnoreCase(request.getMethod())) {
        title = request.getParameter("title");
        message = request.getParameter("message");
        noteID = notification.getNoteID();

        // Check if the title and message are not empty
        if (title != null && !title.trim().isEmpty() && message != null && !message.trim().isEmpty()) {
            LocalDateTime now = LocalDateTime.now();
            Timestamp time = Timestamp.valueOf(now);

            String type = null;
            if (Objects.equals(user.getIdentity(), "admin")) type = "school";
            else if (Objects.equals(user.getIdentity(), "teacher")) type = "course";

            if (type != null) {
                Notification notif = new Notification(title, message, type, time, user.getUserID());
                NotificationDAO.updateNotification(notif, noteID);
                if (Objects.equals(user.getIdentity(), "admin") || Objects.equals(user.getIdentity(), "teacher")) {
                    response.sendRedirect("epistlesPage.jsp");
                } else {
                    response.sendRedirect("feathersPage.jsp");
                }
            } else {
                out.print("Unable to send message. Perhaps you do not have the permission.");
            }
        }
    }
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
            <h4 id="userIdentityName"><%=userIdentityName%></h4>
        </div>
        <div>
            <form id="sidebar-1" method='post' action="epistlesPage.jsp">
                <label>
                    <button type="submit" class="sidebar-button">Epistles</button>
                </label>
            </form>
            <form id="sidebar-2" method="post" action="feathersPage.jsp">
                <label>
                    <button type="submit" class="sidebar-button">Feathers</button>
                </label>
            </form>


        </div>
    </div>

    <div class="search-box">
        <form id="search-input" method="get" action="search.jsp">
            <label><input type="text" name="searchInput" placeholder="Search..."/></label>
            <button type="submit"></button>
        </form>
    </div>

    <div class="main-content">
        <div class="info-bar">
            <h2 id="homepage">Modifying</h2>
        </div>
        <div class="notice-content">
            <form id="send-message" method="get" action="modifyNotification.jsp">
                <div class="message-input">
                    <label>
                        <textarea id="new-title" name="title" placeholder="New Title..."></textarea>
                    </label>
                    <label>
                        <textarea id="new-message" class="message1" name="message" placeholder="Write a new message..."></textarea>
                    </label>
                    <button type="submit" id="send-button">Done</button>
                </div>
            </form>
            <div class="old-notification">
                <h3>ID: <%= notification.getNoteID()%></h3>
                <%--                <% session.setAttribute("noteID", notification.getNoteID()); %>--%>
                <h2><a href="details.jsp?noteID=<%= notification.getNoteID()%>">Title: <%= notification.getTitle() %></a></h2>
                <h3>Type: <%= notification.getType() %></h3>
                <h3>Publisher ID: <%= notification.getPublisherID() %></h3>
                <h3>Release Time: <%= notification.getReleaseDate() %></h3>
                <h4><%= notification.getContent()%></h4>
            </div>
        </div>
    </div>
</div>

</body>
</html>

