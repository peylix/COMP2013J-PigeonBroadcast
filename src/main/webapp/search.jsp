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
    <title>Pigeon Broadcast Search Page</title>
    <link rel="stylesheet" href="css/search-style.css">
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
<%
    List<Notification> notifications = new ArrayList<>();
    String searchInput = request.getParameter("searchInput");
    if (searchInput == null || searchInput.trim().isEmpty()) {
        response.sendRedirect("home.jsp");
    } else {
        searchInput = request.getParameter("searchInput");
        String info;
        if (searchInput.charAt(0) == '#') {
            info = searchInput.substring(4, searchInput.length());
            String limit = searchInput.substring(1, 3);
            switch (limit) {
                case "ID":
                    try {
                        int noteID = Integer.parseInt(info);
                        notifications.addAll(NotificationDAO.getNotificationByID(noteID));
                    } catch (NumberFormatException e) {
                        // Warning
                    }
                    break;
                case "TI":
                    notifications.addAll(NotificationDAO.getNotificationByTitle(info));
                    break;
                case "CO":
                    notifications.addAll(NotificationDAO.getNotificationByContent(info));
                    break;
                case "TY":
                    notifications.addAll(NotificationDAO.getNotificationByType(info));
                    break;
                case "RD":
                    try {
                        Timestamp timestamp = Timestamp.valueOf(info);
                        notifications.addAll(NotificationDAO.getNotificationByReleaseTime(timestamp));
                    } catch (IllegalArgumentException e) {
                        // Warning
                    }
                    break;
                case "PI":
                    try {
                        int publisherID = Integer.parseInt(info);
                        notifications.addAll(NotificationDAO.getNotificationByPublisherID(publisherID));
                    } catch (NumberFormatException e) {
                        // Warning
                    }
                    break;
                default:
                    // Warning
                    break;
            }
        } else {
            // If the searchInput does not start with "#", search in all types
            notifications.addAll(NotificationDAO.getAllNotifications(searchInput));
        }
    }
    int searchResults = notifications.size();
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
            <h2 id="homepage">Search Result</h2>
        </div>
        <div class="notice-content">
            <h3>Search Results: <%=searchResults%></h3>
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
                <h3>ID: <%= notification.getNoteID()%></h3>
                <h2>Title: <%= notification.getTitle() %></h2>
                <h3>Type: <%= notification.getType() %></h3>
                <h3>Publisher ID: <%= notification.getPublisherID() %></h3>
                <h3>Release Time: <%= notification.getReleaseDate() %></h3>
                <form action="details.jsp" method="get">
                    <input type="hidden" name="noteID" value="<%= notification.getNoteID()%>" />
                    <button type="submit" class="view-button">View Details</button>
                </form>
            </div>
            <%
                }
            %>
            <div class="pagination">
                <%
                    // Display links to other pages
                    for (int i = 1; i <= numPages; i++) {
                        if (i == currentPage) {
                %>
                <span><%= i %></span>
                <%
                } else {
                %>
                <a href="search.jsp?currentPage=<%= i %>&searchInput=<%= searchInput %>"><%= i %></a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>

<%@ include file="WEB-INF/footer.html" %>

<script>
    function showDetails(id) {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'details.jsp?noteID=' + id, true);
        xhr.onload = function() {
            if (this.status === 200) {
                document.querySelector('.notice-content').innerHTML = this.responseText;
            }
        };
        xhr.send();
    }
</script>


</body>
</html>












