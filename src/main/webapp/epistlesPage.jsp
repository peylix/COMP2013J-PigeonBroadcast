<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="pb.pojo.Notification" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Comparator" %>


<html>
<head>
    <title>Epistles</title>
    <link rel="stylesheet" href="css/message-style.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<%
    User user = (User) session.getAttribute("user");
    String userName = user.getUserName();
    int userID = user.getUserID();
    String profilePhoto = user.getProfilePhoto();
    session.setAttribute("user", user);
    List<Notification> notifications = new ArrayList<>();
    notifications.addAll(NotificationDAO.getNotificationByType("course"));
    notifications.addAll(NotificationDAO.getNotificationByType("school"));
    notifications.sort(Comparator.comparing(Notification::getReleaseDate).reversed());
    String userIdentity;
    if (Objects.equals(user.getIdentity(), "admin")) {
        userIdentity = "Administrative Staff";
    } else if (Objects.equals(user.getIdentity(), "teacher")) {
        userIdentity = "Teaching Staff";
    } else {
        userIdentity = "Student";
    }


%>

<%

    String title;
    String message;
    if ("GET".equalsIgnoreCase(request.getMethod())) {
        title = request.getParameter("title");
        message = request.getParameter("message");

        if (title != null && !title.trim().isEmpty() && message != null && !message.trim().isEmpty()) {
            LocalDateTime now = LocalDateTime.now();
            Timestamp time = Timestamp.valueOf(now);

            String type = null;
            if (Objects.equals(user.getIdentity(), "admin")) type = "school";
            else if (Objects.equals(user.getIdentity(), "teacher")) type = "course";

            if (type != null) {
                Notification notif = new Notification(title, message, type, time, user.getUserID());
                NotificationDAO.insertNotification(notif);
            } else {
                out.print("Unable to send message. Perhaps you do not have the permission.");
            }

            // Refresh the notifications list
            notifications = new ArrayList<>();
            notifications.addAll(NotificationDAO.getNotificationByType("course"));
            notifications.addAll(NotificationDAO.getNotificationByType("school"));
            notifications.sort(Comparator.comparing(Notification::getReleaseDate).reversed());
        }
    }
    int notificationNum = notifications.size();
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
            <h2 id="homepage">Epistles</h2>
        </div>
        <div class="notice-content">
            <h3>All Epistles: <%=notificationNum%>
            </h3>
            <form id="send-message" method="get" action="epistlesPage.jsp">
                <div class="message-input">
                    <label>
                        <textarea id="new-title" name="title" placeholder="Title..."></textarea>
                    </label>
                    <label>
                        <textarea id="new-message" class="message1" name="message"
                                  placeholder="Write a message..."></textarea>
                    </label>
                    <button type="submit" id="send-button">Send</button>
                </div>
            </form>
            <%
                int itemsPerPage = 3;
                int numPages = (int) Math.ceil((double) notifications.size() / itemsPerPage);
                String currentPageStr = request.getParameter("currentPage");
                int currentPage = currentPageStr != null ? Integer.parseInt(currentPageStr) : 1;
                int startIndex = (currentPage - 1) * itemsPerPage;
                int endIndex = Math.min(startIndex + itemsPerPage, notifications.size());
                for (int i = startIndex; i < endIndex; i++) {
                    Notification notification = notifications.get(i);
            %>
            <div class="notification">
                <h3>ID: <%= notification.getNoteID()%>
                </h3>
                <h2>Title: <%= notification.getTitle() %>
                </h2>
                <h3>Type: <%= notification.getType() %>
                </h3>
                <h3>Publisher ID: <%= notification.getPublisherID() %>
                </h3>
                <h3>Release Time: <%= notification.getReleaseDate() %>
                </h3>
                <form action="details.jsp" method="get">
                    <input type="hidden" name="noteID" value="<%= notification.getNoteID()%>"/>
                    <button type="submit" class="view-button">View Details</button>
                </form>

            </div>
            <%
                }
            %>
            <div class="pagination">
                <%
                    for (int i = 1; i <= numPages; i++) {
                        if (i == currentPage) {
                %>
                <span><%= i %></span>
                <%
                } else {
                %>
                <a href="epistlesPage.jsp?currentPage=<%= i %>&"><%= i %>
                </a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
<%@ include file="WEB-INF/footer.html" %>
</body>
</html>
