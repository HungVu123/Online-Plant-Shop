<%-- 
    Document   : ManagePlants
    Created on : Mar 16, 2022, 3:57:21 AM
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
                <input type="submit" value="searchPlants" name="action">
            </form>
            <table class="order">
                <tr><th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
            <c:forEach var="acc" items="${requestScope.plantList}">
                <tr><td><c:out value="${acc.getId()}"></c:out></td>
                    <td><c:out value="${acc.getName()}"></c:out></td>  
                    <td><c:out value="${acc.getPrice()}"></c:out></td>
                    <td><img src="${acc.getImgpath()}" class='plantimg'></td>
                    <td><c:out value="${acc.getDesciption()}"></c:out></td>
                    <td><c:choose>
                            <c:when test="${acc.getStatus() eq 1}">available</c:when>
                            <c:otherwise>unavailable</c:otherwise>
                        </c:choose>   
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
