<%-- 
    Document   : header_loginedUser
    Created on : Feb 8, 2022, 11:33:40 PMz
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="Change_profile.jsp">Change profile</a></li>
                <li><a href="Completed_orders.jsp">Completed orders</a></li>
                <li><a href="Canceled_orders.jsp">Canceled orders</a></li>
                <li><a href="Processing_orders.jsp">Processing orders</a></li>
                <li><form action="mainController" method="post" class="formsearch">
                    from <input type="date" name="txtfrom" value="<%= (request.getParameter("txtfrom")==null)?"":request.getParameter("txtfrom")%>"> to <input type="date" name="txtto" value="<%= (request.getParameter("txtto")==null)?"":request.getParameter("txtto")%>" >
                    <input type="submit" value="filter" name="action">
                    </form>
                </li>
            </ul>
        </nav>
    </body>
</html>
