<%-- 
    Document   : personalPage
    Created on : Feb 8, 2022, 11:44:31 PM
    Author     : Admin
--%>

<%@page import="hung.dao.AccountDao"%>
<%@page import="hung.dto.Account"%>
<%@page import="hung.dto.Order"%>
<%@page import="hung.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
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
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie [] c= request.getCookies();
            boolean login=false;
            if (name == null && email == null) {
                String token = "";
                for(Cookie aCookie : c)
                if(aCookie.getName().equals("selector")){
                    token = aCookie.getValue();
                    Account acc = AccountDao.getAccount(token);
                    if(acc != null ){
                        name = acc.getFullName();
                        email = acc.getEmail();
                        login=true;
                    }
                }
            }else
                login = true;
                
                //show content if login= true
                if(login){
            
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>welcome <%=name%> come back </h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section><!-- load all orders of the user at here -->
            <%  
                String DateFrom =request.getParameter("txtfrom");
                String DateTo =request.getParameter("txtto");
                ArrayList<Order> list;
                String[] status = {"", "processing", "completed", "canceled"};
                if( DateFrom == "" &&DateTo == "" || DateFrom == null && DateTo == null ||  DateFrom == "" || DateTo == ""){
                    list = OrderDAO.getOrders(email);
                }  
                else {
                    list = OrderDAO.getFilterDate(email, DateFrom, DateTo);
                }
                if (list != null && !list.isEmpty()) {
                     for (Order ord : list) { %>
            <table class="order">
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>action</td></tr>
                <tr><td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%></td>
                    <td><a href="OrderDetail.jsp?orderid=<%= ord.getOrderID() %>">detail</a></td></tr>    
            </table>
            <% }
    }       
            %>
        </section> 
        <footer>
            <%@include file="footer.jsp" %>
        </footer>    
        <% } %>
    </body>
</html>
