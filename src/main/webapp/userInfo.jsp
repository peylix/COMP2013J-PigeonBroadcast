<%@ page import="pb.pojo.User" %>
<%@ page import="pb.dao.UserDAO" %>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pigeon Broadcast User Page</title>
    <link rel="stylesheet" href="css/homestyle.css">
</head>

<%
    //    获取当前登录用户信息
    User user = (User) session.getAttribute("user");
    int userID = user.getUserID();
    String userName = user.getUserName();
    String password = user.getPassword();
    String profilePhoto = user.getProfilePhoto();
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
        let PigeonPhoto = document.getElementById('PigeonPhoto');

        // 更新当前显示的图片
        PigeonPhoto.src = imageSelect.value;
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
            <li id="school-notice">Epistles from College</li>
            <li id="course-notice">Epistles from Course</li>
            <li id="community-notice">Feathers from Organization</li>
            <li id="personal-notice">Feathers from Individual</li>
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
            <div class="user-info">
                <div class="form">
                    <form id="changeInfo-form" method="post">
                        <label>
                            <input type="text" placeholder="Your new password" name="password"/>
                        </label>
                        <label>
                            <input type="text" placeholder="Your new email" name="email"/>
                        </label>
                        <br>
                        <img id="choosePhoto" src="<%=profilePhoto%>" alt="Profile Photo">
                        <label for="imageSelect">
                            <select id="imageSelect" name="profilePhoto" onchange="changeImage()">
                                <% for (String imagePath : imagePaths) { %>
                                <option value="<%=imagePath%>"><%=imagePath%>
                                </option>
                                <% } %>
                            </select></label>
                        <br><button>Change!</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>
