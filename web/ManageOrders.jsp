<%-- 
    Document   : ManageOrders
    Created on : Mar 17, 2022, 1:08:23 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <form action="mainController" method="post" class="formsearch">
                <input type="text" name="txtSearch" value="<%= (request.getParameter("txtSearch")==null)?"":request.getParameter("txtSearch")%>">
                <input type="submit" value="searchOrders" name="action">
            </form>
            <table class="order">
                <tr><th>ID</th>
                    <th>Email</th>
                    <th>FullName</th>
                    <th>OrdDate</th>
                    <th>ShipDate</th>
                    <th>Status</th>
                </tr>
            <c:forEach var="acc" items="${requestScope.orderList}">
                <tr><td><c:out value="${acc.getOrderID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullName()}"></c:out></td>  
                    <td><c:out value="${acc.getOrderDate()}"></c:out></td>
                    <td><c:out value="${acc.getShipDate()}"></c:out></td>
                    <td><c:choose>
                            <c:when test="${acc.getStatus() eq 1}">Processing</c:when>
                            <c:when test="${acc.getStatus() eq 2}">Completed</c:when>
                            <c:otherwise>Canceled</c:otherwise>
                        </c:choose>   
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
