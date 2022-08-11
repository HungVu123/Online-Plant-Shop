<%-- 
    Document   : Completed_orders
    Created on : Mar 6, 2022, 12:20:41 AM
    Author     : Admin
--%>

<%@page import="hung.dao.OrderDAO"%>
<%@page import="hung.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hung.dao.AccountDao"%>
<%@page import="hung.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            String name = (String) session.getAttribute("name");
            if (name == null) {
        %>
        <p><font color="red">You must login to view personal page!</font></p>
        <p></p>
        <% } else {%>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>welcome <%=name%> come back </h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section><!-- load processing orders of the user at here -->
            <%
                int status = 1;
                ArrayList<Order> list = OrderDAO.getCompletedOrders(email, status);
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {%>
            <table class="order">
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>action</td></tr>
                <tr><td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><a href="OrderDetail.jsp?orderid=<%= ord.getOrderID()%>">detail</a></td></tr>    
            </table>
            <% }
            } else { %>
            <p>You don't have any order!</p>
            <% }

            %>
        </section> 
        <footer>
            <%@include file="footer.jsp" %>
        </footer>    
        <% }%>
    </body>
</html>
