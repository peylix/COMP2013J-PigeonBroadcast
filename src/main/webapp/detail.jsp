<%@ page import="pb.dao.NotificationDAO" %>
<%@ page import="pb.pojo.Notification" %><%--
  Created by IntelliJ IDEA.
  User: 12789
  Date: 2023/5/23
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  int noteID = Integer.parseInt(request.getParameter("noteID"));
  Notification notification = NotificationDAO.getNotificationByID(noteID).get(0);
%>
<div class="notification">
  <h2>ID: <%= notification.getNoteID() %></h2>
  <h3>Title: <%= notification.getTitle() %></h3>
  <h3>Type: <%= notification.getType() %></h3>
  <h3>Publisher ID: <%= notification.getPublisherID() %></h3>
  <h3>Release Time: <%= notification.getReleaseDate() %></h3>
  <h3>Content: <%= notification.getContent() %></h3>
  <button onclick="goBack()">Go Back</button>
</div>
<script>
  function goBack() {

  }
</script>
</body>
</html>
