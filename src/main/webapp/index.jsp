<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link rel="stylesheet" href="css/loginstyle.css">


</head>
<body>

<div class="container">
    <div class="info">
        <h2>COMP2013J Demo System</h2>
    </div>
</div>

<div class="login-page">
    <div class="form">
        <form class="login-form" method="post" action="login.jsp">
            <input type="text" placeholder="username" name="username"/>
            <input type="text" placeholder="password" name="password"/>
            <button>login</button>
        </form>
    </div>
</div>

<%@ include file="footer.html" %>

</body>
</html>