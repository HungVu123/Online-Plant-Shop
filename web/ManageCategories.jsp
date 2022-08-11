<%-- 
    Document   : ManageCategories
    Created on : Mar 16, 2022, 4:31:54 AM
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
                <input type="submit" value="searchCategories" name="action">
            </form>
            <table class="order">
                <tr>
                    <th>Name</th>
                    <th>Image</th>
                    <th>CateName</th>
                </tr>
            <c:forEach var="acc" items="${requestScope.categoriesList}">
                <tr>
                    <td><c:out value="${acc.getName()}"></c:out></td>  
                    <td><img src="${acc.getImgpath()}" class='plantimg'></td>
                    <td><c:out value="${acc.getCatename()}"></c:out></td>  
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
