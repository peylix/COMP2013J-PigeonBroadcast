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
    <title>Pigeon Broadcast User Page</title>
    <link rel="stylesheet" href="css/homestyle.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<%
    //    获取当前登录用户信息
    User user = (User) session.getAttribute("user");
    int userID = user.getUserID();
    String userName = user.getUserName();
    String password = user.getPassword();
    String profilePhoto = user.getProfilePhoto();
    String userIdentity = user.getIdentity();
    String email = user.getEmail();

    if (request.getMethod().equals("POST")) {
        // 获取提交的新密码和电子邮件地址
        String newPassword = (!Objects.equals(request.getParameter("password"), "")) ? request.getParameter("password") : password;
        String newProfilePhoto = (!Objects.equals(request.getParameter("profilePhoto"), "")) ? request.getParameter("profilePhoto") : profilePhoto;
        String newEmail = (!Objects.equals(request.getParameter("email"), "")) ? request.getParameter("email") : email;

        // 这里是更新数据库中的信息的逻辑
        if (UserDAO.updateUserInfo(user, newPassword, newProfilePhoto, newEmail)) {
            user = UserDAO.login(user.getUserID(), newPassword);  // 重新获取更新后的用户信息
            session.setAttribute("user", user);  // 将更新后的用户信息存入 session
            response.sendRedirect("home.jsp");
        };
    }

    String[] imagePaths = {"images/Pigeon.png", "images/StarDust.png"};
%>

<script>

    function changeImage() {
        let imageSelect = document.getElementById('imageSelect');
        let choosePhoto = document.getElementById('choosePhoto');

        // 更新当前显示的图片
        choosePhoto.src = imageSelect.value;
    }
</script>

<body>
<div class="home-page">
    <div class="sidebar">
        <div class="user-info">
            <a href="home.jsp">
                <img id="profilePhoto" src="<%=profilePhoto%>" alt="Profile Photo">
            </a>
            <h3 id="userName"><%=userName%>
            </h3>
            <h3 id="userID"><%=userID%>
            </h3>
        </div>
        <ul class="menu">
            <li id="school-notice"><a href="epistlesPage.jsp">Epistles</a></li>
            <li id="student-notice"><a href="feathersPage.jsp">Feathers</a></li>
        </ul>
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
        <div class="notice-content">
            <div class="user-basic-info">
                <p>User ID: <%=userID%></p>
                <p>User Name: <%=userName%></p>
                <p>User Identity: <%=userIdentity%></p>  <!-- Suppose we have userType from the User object -->
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
                <h3>Your Notifications:</h3>
                <%
                    List<Notification> userNotifications = NotificationDAO.getNotificationByPublisherID(userID);
                    for (Notification notification : userNotifications) {
                %>
                <div class="notification-card">
                    <h4><%=notification.getTitle()%></h4>
                    <p><%=notification.getContent()%></p>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.html" %>

<script>
    function changeImage() {
        let imageSelect = document.getElementById('imageSelect');
        let choosePhoto = document.getElementById('choosePhoto');

        // 更新当前显示的图片为选中的头像
        choosePhoto.src = imageSelect.options[imageSelect.selectedIndex].value;
    }

</script>


</body>
</html>
