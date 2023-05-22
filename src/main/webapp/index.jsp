<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pigeon Broadcast Login Page</title>
    <link rel="stylesheet" href="css/loginstyle.css">
    <link rel="icon" href="images/Pigeon.png" type="image">
</head>

<body>
    <div class="web-title">
        <div class="title">
            <h1>Pigeon Broadcast</h1> <br>
            <h2>——Your All-in-One Notification Platform</h2>
        </div>
    </div>

    <div class="login-page">
        <div class="form">
            <form id="login-form" class="active-form" method="post" action="login.jsp">
                <label>
                    <input type="text" placeholder="User ID" name="userID"/>
                </label>
                <label>
                    <input type="text" placeholder="Password" name="password"/>
                </label>
                <button>login</button>
                <button type="button" id="create-account-button">create new account</button>
            </form>

            <form id="create-account-form" class="inactive-form" method="post" action="createAccount.jsp">
                <label>
                    <input type="text" placeholder="Member ID" name="memberID"/>
                </label>
                <div class="input-row">
                    <label>
                        <input type="text" placeholder="Last Name" name="lastName"/>
                    </label>
                    <label>
                        <input type="text" placeholder="First Name" name="firstName"/>
                    </label>
                </div>
                <label>
                    <input type="text" placeholder="Password" name="password"/>
                </label>
                <label>
                    <input type="text" placeholder="Email" name="email"/>
                </label>
                <button>create new account</button>
                <button type="button" id="login-button">back to login</button>
            </form>

            <div class="hint">

            </div>
        </div>
    </div>

    <%@ include file="footer.html" %>

    <script>
        document.getElementById('create-account-button').addEventListener('click', function() {
            document.getElementById('login-form').classList.remove('active-form');
            document.getElementById('login-form').classList.add('inactive-form');
            document.getElementById('create-account-form').classList.remove('inactive-form');
            document.getElementById('create-account-form').classList.add('active-form');
        });
        document.getElementById('login-button').addEventListener('click', function() {
            document.getElementById('create-account-form').classList.remove('active-form');
            document.getElementById('create-account-form').classList.add('inactive-form');
            document.getElementById('login-form').classList.remove('inactive-form');
            document.getElementById('login-form').classList.add('active-form');
        });
    </script>

</body>
</html>