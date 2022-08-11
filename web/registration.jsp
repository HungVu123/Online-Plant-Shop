<%-- 
    Document   : registration
    Created on : Feb 7, 2022, 2:16:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <form action="mainController" method="post" >
            <h1>Register</h1>
            <table>
                <tr><td>email      </td><td><input type="text" name="txtemail" required="" value="<%= (request.getAttribute("txtemail")==null)?"":request.getAttribute("txtemail") %>" placeholder="name@example.com"></td></tr>
                <tr><td>full name  </td><td><input type="text" name="txtfullname" required="" value="<%= (request.getAttribute("txtfullname")==null)?"":request.getAttribute("txtfullname") %>"></td></tr>
                <tr><td>password</td><td><input type="password" name="txtpassword" required="" ></td></tr>
                <tr><td>phone</td><td><input type="text" name="txtphone" required="" pattern="\d+$" title="must be integer" value="<%= (request.getAttribute("txtphone")==null)?"":request.getAttribute("txtphone") %>" >
                        </td></tr>
                <tr><td colspan="2"><input type="submit" value="register" name="action"></td></tr>
            </table>    
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
