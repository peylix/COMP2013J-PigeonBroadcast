<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.UserDAO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="pb.pojo.Notification" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PigeonBroadcast User Page</title>
    <link rel="stylesheet" href="css/home-style.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<%
    User user = (User) session.getAttribute("user");
    int userID = user.getUserID();
    String userName = user.getUserName();
    String password = user.getPassword();
    String profilePhoto = user.getProfilePhoto();
    String userIdentity = user.getIdentity();
    String email = user.getEmail();
    String userIdentityName;
    int notificationNum = NotificationDAO.getNotificationCountByID(userID);

    if (Objects.equals(user.getIdentity(), "admin")) {
        userIdentityName = "Administrative Staff";
    } else if (Objects.equals(user.getIdentity(), "teacher")) {
        userIdentityName = "Teaching Staff";
    } else {
        userIdentityName = "Student";
    }

    if (request.getMethod().equals("POST")) {
        // get the new password, profilePhoto and email
        String newPassword = (!Objects.equals(request.getParameter("password"), "")) ? request.getParameter("password") : password;
        String newProfilePhoto = (!Objects.equals(request.getParameter("profilePhoto"), "")) ? request.getParameter("profilePhoto") : profilePhoto;
        String newEmail = (!Objects.equals(request.getParameter("email"), "")) ? request.getParameter("email") : email;

        // update the database
        if (UserDAO.updateUserInfo(user, newPassword, newProfilePhoto, newEmail)) {
            user = UserDAO.login(user.getUserID(), newPassword);
            session.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        }
        ;
    }

    // Information about the profile picture path
    String[] imagePaths = {"images/Pigeon.png", "images/StarDust.png", "images/Dalek.png",
            "images/Pigeon2.png", "images/Alex.png", "images/Apple.png", "images/Horse.png"};
%>

<script>
    function changeImage() {
        let imageSelect = document.getElementById('imageSelect');
        let choosePhoto = document.getElementById('choosePhoto');

        // Update the image currently displayed
        choosePhoto.src = imageSelect.value;
    }
</script>

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
            <h4 id="userIdentityName"><%=userIdentityName%>
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
        <input type="text" placeholder="Search..."/>
        <button type="submit">
            <i class="fa fa-search"></i>  <!-- Replace with the icon class you are using -->
        </button>
    </div>

    <div class="main-content">
        <div class="info-bar">
            <h2 id="homepage">Your Personal Information</h2>
        </div>
        <div class="info-content">
            <div class="user-basic-info">
                <p>User ID: <%=userID%>
                </p>
                <p>User Name: <%=userName%>
                </p>
                <p>User Identity: <%=userIdentity%>
                </p>  <!-- Suppose we have userType from the User object -->
            </div>

            <div class="user-changeInfo">
                <div class="form">
                    <form id="changeInfo-form" method="post">
                        <div class="photo-section">
                            <img id="choosePhoto" src="<%=imagePaths[0]%>" alt="Profile Photo">
                            <label for="imageSelect">
                                <select id="imageSelect" name="profilePhoto" onchange="changeImage()">
                                    <% for (String imagePath : imagePaths) { %>
                                    <option value="<%=imagePath%>"><%=imagePath%>
                                    </option>
                                    <% } %>
                                </select>
                            </label>
                            <br><br>
                        </div>
                        <div class="info-section">
                            <label>
                                <input type="text" placeholder="Your new password" name="password"/>
                            </label>
                            <label>
                                <input type="text" placeholder="Your new email" name="email"/>
                            </label>
                            <button>Change!</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="user-notification-list">
                <h3>Your Notifications: <%=notificationNum%>
                </h3>
                <%
                    List<Notification> userNotifications = NotificationDAO.getNotificationByPublisherID(userID);
                    for (Notification notification : userNotifications) {
                %>
                <div class="notification-card">
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
                <% } %>


            </div>
        </div>
    </div>
</div>

<%@ include file="WEB-INF/footer.html" %>

<script>
    function changeImage() {
        let imageSelect = document.getElementById('imageSelect');
        let choosePhoto = document.getElementById('choosePhoto');

        choosePhoto.src = imageSelect.options[imageSelect.selectedIndex].value;
    }

</script>


</body>
</html>
