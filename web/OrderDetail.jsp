<%-- 
    Document   : orderDetail
    Created on : Feb 4, 2022, 7:11:10 PM
    Author     : 
--%>

<%@page import="hung.dto.OrderDetail"%>
<%@page import="hung.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hung.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <% 
            String name = (String) session.getAttribute("name");
            if(name==null){
        %>
        <p><font color="red">You must login to view personal page!</font></p>
        <p></p>
        <% } else { %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name %>!</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <a href="personalPage.jsp">view all orders</a>
        </section>
            <section><!-- Load all orders of the user here! -->
                <% String orderid = request.getParameter("orderid");
                if (orderid!=null){
                    int orderID = Integer.parseInt(orderid.trim());                 
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if(list!=null && !list.isEmpty()){
                        int money = 0;
                        for (OrderDetail detail : list) { %>
                <table class="order">
                <tr><td>Order ID</td><td>Plant ID</td><td>Plant name</td><td>Image</td><td>Price</td><td>Quantity</td></tr>
                <tr>
                    <td><%= detail.getOrderID() %></td>
                    <td><%= detail.getPlantID() %></td>
                    <td><%= detail.getPlantName() %></td>
                    <td><img src='<%= detail.getimgPath()%>' class='plantimg'/> <br/></td>
                    <td><%= detail.getPrice() %></td>
                    <td><%= detail.getQuantity() %></td>
                    <% money = money + detail.getPrice() * detail.getQuantity(); %>
                </tr>           
                </table>
                <% } %>
                <h3> Total money: <%= money %></h3>
                <% } else { %>
                <p>You don't have any order!</p>
                <% } } %>
            </section>
            <footer>
                <%@include file="footer.jsp" %>
            </footer>
            <% } %>
    </body>
</html>