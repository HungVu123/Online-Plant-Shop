<%-- 
    Document   : login
    Created on : Feb 7, 2022, 3:00:05 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="background"> 
            <form action="mainController" method="post" class="loginbox">
                <font style='color: red;'><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </font>    
                <img src="images/avatar.jpg" class="avatar">
                <h1>Log In</h1>
                    <p>Email</p>
                    <div class="icon"><ion-icon name="mail-outline"></ion-icon></div>
                    <input type="text" name="txtemail" placeholder="name@example.com" >
                    <p>Password</p>
                    <div class="icon"><ion-icon name="lock-closed-outline"></ion-icon></div>
                    <input type="password" name="txtpassword" placeholder="password">
                    <label>
                         <input type="checkbox" value="savelogin" name="savelogin" > Rememeber me
                    </label>
                 <input type="submit" value="login" name="action" >
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
