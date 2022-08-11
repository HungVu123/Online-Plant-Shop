<%-- 
    Document   : viewCart
    Created on : Feb 15, 2022, 12:07:46 AM
    Author     : Admin
--%>

<%@page import="hung.dao.OrderDAO"%>
<%@page import="hung.dao.PlantDAO"%>
<%@page import="hung.dto.Plant"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome <%= session.getAttribute("name")%> come back</h3>
            <h3><a href="mainController?action=logout" class="shopping">Logout</a></h3>
            <h3><a href="personalPage.jsp" class="shopping">personal page</a></h3>
            <%
                }
            %>
            <font style='color: red;'><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </font>
            <%
                HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                int totalMoney =0;
                if (cart == null || cart.size() == 0) {
            %>
            <h3>List Is Empty</h3> 
            <% } else {

            %>

            <h3>List Products</h3>     
            <table class="table" >
                <thead>
                    <tr>
                        <th scope="col">Product ID</th>
                        <th scope="col">Images</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%   Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            int quantity = cart.get(pid);
                            int pid1 = Integer.parseInt(pid);
                            Plant p = PlantDAO.getPlant(pid1);
                    %> 
                <form action="mainController" method="post">
                    <tr><td><input type="hidden" value="<%= pid%>" name="pid"><a href="getPlantServlet?pid=<%= pid%>"><%= pid%></a></td>
                        <td><img src='<%= p.getImgpath()%>' class='plantimg'/></td>
                        <td><%= p.getPrice() * quantity%></td>
                        <td><input type="number" value="<%= quantity%>" name="quantity"></td>
                        <td><input type="submit" value="update" name="action">
                            <input type="submit" value="delete" name="action" ></td>
                    </tr>    
                </form>
                <%
                    totalMoney = totalMoney + p.getPrice() * quantity;
                    }

                %>
            </tbody>
            <table  class="shopping">
                 <tr><td>Total money: <%= totalMoney%> </td></tr>
                <tr><td>Order Date: <%= (new Date(0)).toString()%></td></tr>
                <tr><td>Ship Date: N/A: </td></tr>
            </table>
    </table>

        </section> 
        <section><form action="mainController" method="post">
                <input type="submit" value="saveOrder" name="action" class="submitorder"></form>
        </section>
        <%            }
        %>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>  
    </body>
</html>
