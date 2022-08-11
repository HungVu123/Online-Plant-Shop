<%-- 
    Document   : header
    Created on : Feb 7, 2022, 1:43:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href=""><img src="images/logo.jpg" id="logo" class="logo"></a> </li>
                    <li><a href="index.jsp"><ion-icon name="home-outline"></ion-icon> Home</a></li>
                    <li><a href="registration.jsp"><ion-icon name="newspaper-outline"></ion-icon> Register</a></li>
                    <li><a href="login.jsp"><ion-icon name="person-circle-outline"></ion-icon> Login</a></li>
                    <li><a href="mainController?action=viewcart"><ion-icon name="cart-outline"></ion-icon> View Cart</a></li>
                    <li><form action="mainController" method="post" class="formsearch">
                            <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>">
                            <select name="searchby">
                                <option value="byname">by name</option> 
                                <option value="bycate">by category</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form>
                    </li>
                </ul>
            </nav>
        </header>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    </body>
</html>
